#include "qtplayer.h"

qtPlayer::qtPlayer()
{
    this->player = std::make_shared<My_Player>(new My_Player());
}

void qtPlayer::openfile(QString fileName)
{
    this->player->openFile(fileName.toStdString());

    this->player->openFile("a3.mp3");
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
