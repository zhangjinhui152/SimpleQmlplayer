
#ifdef __cplusplus
#include <string>
#include <iostream>
#include <vector>
extern "C"
{
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <unistd.h>

#include <vlc/vlc.h>
}
#ifndef __cplusplus
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <unistd.h>
#include <vlc/vlc.h>
#endif // !1__cplusplus
#endif

#ifdef __cplusplus
extern "C"
{
}
#endif
#ifndef __cplusplus

#endif // !__cplusplus
#ifndef BASE_PLAYER_H
#define BASE_PLAYER_H
class Base_Player
{

public:
    virtual void openFile(const std::string &file) = 0;
    virtual void play() = 0;
    virtual void pause() = 0;
    virtual void stop() = 0;
    virtual void setVolume(int vol) = 0;
    virtual void seek(int pos) = 0;
    virtual void next() = 0;
    virtual void previous() = 0;


    Base_Player() = default;
    virtual ~Base_Player(){};
};


#endif
