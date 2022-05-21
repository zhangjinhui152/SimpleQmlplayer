#include "qtplayer.h"
#include <QDebug>
#include <QFile>
#include <QDir>
#include <utility>

void getMeta_qt(libvlc_media_t *media, My_Player_List *player)
{
    auto info = MediaInfo{libvlc_media_get_meta(media, libvlc_meta_Title),
                          libvlc_media_get_meta(media, libvlc_meta_Artist),
                          libvlc_media_get_meta(media, libvlc_meta_Album),
                          libvlc_media_get_meta(media, libvlc_meta_ArtworkURL)};
    qDebug()<<"void getMeta_qt(libvlc_media_t *media, My_Player_List *player)"<<info.title;
    player->get_song_list()->push_back(info);

}
static void listHandleParsedEventForPlayer_qt(const libvlc_event_t *event, void *userData)
{
    auto player = static_cast<std::pair<libvlc_media_t *, qtPlayer *> *>(userData);
    switch (event->type)
    {
    case libvlc_MediaParsedChanged:
    {
        int state = event->u.media_parsed_changed.new_status;
        if (libvlc_media_parsed_status_done == state)
        {
            getMeta_qt(player->first,player->second->get_player().get());
            if(player->second->get_fileNum() == 1){
                emit player->second->parseEnd();
                delete player;
            }
            else{

                int temp = player->second->get_fileNum();
                player->second->set_fileNum(--temp);
            }
        }
        break;
    }
    default:

        break;
    }
}
qtPlayer::qtPlayer()
{
    this->player = std::make_shared<My_Player_List>();
    connect(this,&qtPlayer::setVolume,this,&qtPlayer::setVolumeSlot);
    connect(this,&qtPlayer::setDuration,this,&qtPlayer::setDurationSlot);
    connect(this,&qtPlayer::parseEnd,this,&qtPlayer::parseEndSlot);
}

void qtPlayer::openfile(QString fileName)
{
    //替换掉原来的openfile dwadwadawd aw awdawdawdw
#ifdef __linux__
    fileName = fileName.replace("file:///","/");
#endif
#ifdef _WIN32
    fileName = fileName.replace("file:///","");
    fileName = fileName.replace("/","\\");
#endif
    //    fileName = fileName.replace("file:///","/");
    //    fileName = fileName.replace("/","\\");
    qDebug()<<" qtPlayer::openfile(QString fileName)"<<fileName;


    auto temp_media = libvlc_media_new_path(this->player->instance, fileName.toStdString().c_str());
    this->player->eventManager_media = libvlc_media_event_manager(temp_media);
    auto data = new std::pair<libvlc_media_t *, qtPlayer*>{temp_media, this};
    //    this->player->crash_pair_data->push_back(data);


    libvlc_event_attach(this->player->eventManager_media, libvlc_MediaParsedChanged, listHandleParsedEventForPlayer_qt, data);
    libvlc_media_parse_with_options(temp_media, libvlc_media_parse_local, 1000);
    libvlc_media_list_add_media(this->player->media_List, temp_media);

}

void qtPlayer::openFileList(QString filePath)
{

#ifdef __linux__
    filePath = filePath.replace("file:///","/");
#endif
#ifdef _WIN32
    filePath = filePath.replace("file:///","");//windwos not need absolute path
#endif
    qDebug()<<"void qtPlayer::openFileList(QString filePath)"
                ""<<filePath;
    QDir currentpath = QDir(filePath);
    if(!currentpath.exists())
    {
        return;
    }
    QStringList filters{"*.mp3"};
    currentpath.setNameFilters(filters);
    QFileInfoList list = currentpath.entryInfoList();


    int file_count = list.count();
    if(file_count <= 0)
    {
        return;
    }
    this->fileNum = file_count;
    QStringList media_list;
    for(int i=0; i<file_count; i++)
    {
        QFileInfo file_info = list.at(i);
        QString absolute_file_path = file_info.absoluteFilePath();
        media_list.append(absolute_file_path);
        this->openfile(absolute_file_path);
    }
    //wait parse
    //    for(auto v : *player->get_song_list()){
    //        qDebug()<<" for(auto v : *player->get_song_list()){"<<v.title;
    //    }
    //    emit this->appendSong(m1);

}

void qtPlayer::play()
{

    this->player->play();
}

void qtPlayer::pause()
{
    this->player->pause();
}

void qtPlayer::stop()
{
    this->player->stop();
}

void qtPlayer::next()
{
    this->player->next();

    if(this->currentIndex < this->fileCount-1){
    this->currentIndex = ++this->currentIndex;
    }
    emit this->changeMedia(this->currentIndex);;
}

void qtPlayer::previous()
{
    this->player->previous();
    if(this->currentIndex > 0){
    this->currentIndex = --this->currentIndex;
    }

        //Notify the player to parse new media
    emit this->changeMedia(this->currentIndex);;
}

void qtPlayer::play_index(int index)
{
    this->currentIndex = index;
    this->player->play_index_media(index);
    emit this->changeMedia(index);;
}

void qtPlayer::testfun()
{
    emit this->resultNotify();
}

int qtPlayer::get_duration()
{

    return  this->player->get_duration();
}

int qtPlayer::get_Current_Time()
{
    return this->player->get_current_duration();
}

void qtPlayer::setVolumeSlot(int num)
{
    this->player->setVolume(num);

}

void qtPlayer::setDurationSlot(int seek)
{
    this->player->seek(seek);
}

void qtPlayer::parseEndSlot()
{
    for(auto v : *player->get_song_list()){
        QVariantList q;
        q.append(v.title);
        q.append(v.artist);
        q.append(v.album);
        q.append(v.img);
        q.append(this->fileCount);
        ++this->fileCount;
        emit this->appendSong(q);
    }
}

player_worker::player_worker(std::shared_ptr<qtPlayer> p)
{
    this->player = p;
}

void player_worker::doWork(const QString &parameter)
{
    QString result;
    player->play();
    player->pause();
    //    emit player->changeMedia();
    //Notify the player to parse new media

    emit resultReady(result);
}

Player_Thread_Controller::Player_Thread_Controller(std::shared_ptr<qtPlayer> p)
{
    player_worker *worker = new player_worker(p);
    worker->moveToThread(&workerThread);
    connect(&workerThread, &QThread::finished, worker, &QObject::deleteLater);
    connect(this, &Player_Thread_Controller::operate, worker, &player_worker::doWork);
    connect(worker, &player_worker::resultReady, this, &Player_Thread_Controller::handleResults);
    workerThread.start();
}

void Player_Thread_Controller::handleResults(const QString & last)
{
    qDebug()<<last;
}
