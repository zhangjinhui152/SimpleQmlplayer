#ifndef QTPLAYER_H
#define QTPLAYER_H


#include <QObject>
#include <QString>
#include <memory>
#include "../player/player.h"
class qtPlayer : public QObject
{
      Q_OBJECT
private:
      std::shared_ptr<My_Player> player;


signals:
     void resultNotify(void);

public:
    qtPlayer();

    Q_INVOKABLE void openfile(QString fileName);
    Q_INVOKABLE void play();
    Q_INVOKABLE void pause();
    Q_INVOKABLE void stop();
    Q_INVOKABLE void testfun();

};

#endif // QTPLAYER_H
