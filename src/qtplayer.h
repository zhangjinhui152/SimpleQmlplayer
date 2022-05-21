#ifndef QTPLAYER_H
#define QTPLAYER_H


#include <QObject>
#include <QString>
#include <QThread>
#include <memory>
#include <QVariant>
#include <QVariantList>
#include "../player/my_player_list.h"
#include "../player/player.h"

class MediaInfo_Q{
public:
    MediaInfo mediaInfo;

};

class qtPlayer : public QObject
{
    Q_OBJECT
private:
    friend class std::shared_ptr<My_Player_List>;
    std::shared_ptr<My_Player_List> player;
    int fileNum = 0;
    int fileCount=0;

    int currentIndex = 0;
public:
    qtPlayer();

    Q_INVOKABLE void openfile(QString fileName);
    Q_INVOKABLE void openFileList(QString filePath);
    Q_INVOKABLE void play();
    Q_INVOKABLE void pause();
    Q_INVOKABLE void stop();
    Q_INVOKABLE void next();
    Q_INVOKABLE void previous();
    Q_INVOKABLE void play_index(int);
    Q_INVOKABLE void testfun();
    Q_INVOKABLE int get_duration();
    Q_INVOKABLE int get_Current_Time();

    std::shared_ptr<My_Player_List> get_player(){
        return this->player;
    };
    int get_fileNum(){
        return this->fileNum;
    }
    void set_fileNum(int num){
        this->fileNum = num;
    }

public slots:
    void setVolumeSlot(int);
    void setDurationSlot(int);
    void parseEndSlot();

signals:
    void resultNotify(void);
    void changeDuration(int);
    void changeFile(QString);


    //Notify the player to parse new media
    void changeMedia();
    void setVolume(int);
    void setDuration(int);
    void appendSong(QVariantList value);
    void parseEnd();


};

class player_worker : public QObject
{
    Q_OBJECT
private:
    std::shared_ptr<qtPlayer> player;
public:
    player_worker(){}
    player_worker(std::shared_ptr<qtPlayer> p);

public slots:
    void doWork(const QString &parameter) ;

signals:
    void resultReady(const QString &result);
};

class Player_Thread_Controller : public QObject
{
    Q_OBJECT
    QThread workerThread;
public:
    Player_Thread_Controller() {
        player_worker *worker = new player_worker;
        worker->moveToThread(&workerThread);
        connect(&workerThread, &QThread::finished, worker, &QObject::deleteLater);
        connect(this, &Player_Thread_Controller::operate, worker, &player_worker::doWork);
        connect(worker, &player_worker::resultReady, this, &Player_Thread_Controller::handleResults);
        workerThread.start();
    }
    Player_Thread_Controller(std::shared_ptr<qtPlayer> p);

    ~Player_Thread_Controller() {
        workerThread.quit();
        workerThread.wait();
    }
public slots:
    void handleResults(const QString &);
signals:
    void operate(const QString &);
};
#endif // QTPLAYER_H
