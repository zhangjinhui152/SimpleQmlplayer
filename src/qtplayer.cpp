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
    auto player = static_cast<std::pair<libvlc_media_t *, My_Player_List *> *>(userData);
    switch (event->type)
    {
    case libvlc_MediaParsedChanged:
    {
        int state = event->u.media_parsed_changed.new_status;
        if (libvlc_media_parsed_status_done == state)
        {
           getMeta_qt(player->first,player->second);
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
}

void qtPlayer::openfile(QString fileName)
{
    //替换掉原来的openfile dwadwadawd aw awdawdawdw
    fileName = fileName.replace("file:///","/");
    qDebug()<<" qtPlayer::openfile(QString fileName)"<<fileName;


    auto temp_media = libvlc_media_new_path(this->player->instance, fileName.toStdString().c_str());
    this->player->eventManager_media = libvlc_media_event_manager(temp_media);
    auto data = new std::pair<libvlc_media_t *, My_Player_List *>{temp_media, this->player.get()};
    this->player->crash_pair_data->push_back(data);


    libvlc_event_attach(this->player->eventManager_media, libvlc_MediaParsedChanged, listHandleParsedEventForPlayer_qt, data);
    libvlc_media_parse_with_options(temp_media, libvlc_media_parse_local, 1000);
    libvlc_media_list_add_media(this->player->media_List, temp_media);

}

void qtPlayer::openFileList(QString filePath)
{
    filePath = filePath.replace("file:///","/");
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

    QStringList media_list;
    for(int i=0; i<file_count; i++)
    {
        QFileInfo file_info = list.at(i);
        QString absolute_file_path = file_info.absoluteFilePath();
        media_list.append(absolute_file_path);
        this->openfile(absolute_file_path);
    }
//wait parse
    for(auto v : *player->get_song_list()){
        qDebug()<<" for(auto v : *player->get_song_list()){"<<v.title;
    }
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

    emit this->changeMedia();
}

void qtPlayer::previous()
{
    this->player->previous();
        //Notify the player to parse new media
    emit this->changeMedia();
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
