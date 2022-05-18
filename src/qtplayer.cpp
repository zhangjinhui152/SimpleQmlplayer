#include "qtplayer.h"
#include <QDebug>

qtPlayer::qtPlayer()
{
    this->player = std::make_shared<my_player_list>();
    connect(this,&qtPlayer::setVolume,this,&qtPlayer::setVolumeSlot);
    connect(this,&qtPlayer::setDuration,this,&qtPlayer::setDurationSlot);
}

void qtPlayer::openfile(QString fileName)
{
    this->player->openFile(fileName.toStdString());
    //    this->player->openFile("a3.mp3");
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
        //Notify the player to parse new media
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
    /* ... here is the expensive or blocking operation ... */
    player->openfile("a4.mp3");
    player->openfile("a3.mp3");
    player->openfile("a2.mp3");

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
