#include "qtplayer.h"
#include <QDebug>
qtPlayer::qtPlayer()
{
    this->player = std::make_shared<My_Player>(new My_Player());
}

void qtPlayer::openfile(QString fileName)
{
    this->player->openFile(fileName.toStdString());

//    this->player->openFile("a3.mp3");
}

void qtPlayer::play()
{
    this->player->play();
    testfun();
    emit this->resultNotify();
}

void qtPlayer::pause()
{
    this->player->pause();
}

void qtPlayer::stop()
{
    this->player->stop();
}

void qtPlayer::testfun()
{
    printf("1211");
    emit this->resultNotify();
}

player_worker::player_worker(std::shared_ptr<qtPlayer> p)
{
    this->player = p;
}

void player_worker::doWork(const QString &parameter)
{
    QString result;
    /* ... here is the expensive or blocking operation ... */
    player->openfile("a3.mp3");
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
