
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

class  Player
{

private:
    //初始化构造器
    // libvlc_instance_t *instance{nullptr};
    // //播放器
    // libvlc_media_player_t *player{nullptr};
    // //媒体//音乐文件
    // libvlc_media_t *media{nullptr};
    // //事件管理器
    // libvlc_event_manager_t *eventManager{nullptr};
    // libvlc_event_manager_t *eventManager_media{nullptr};


    /**
     * @brief 验证是否为空
     * 
     * @tparam T 任意类型
     * @param data 不为空则原样返回
     * @return T 
     */
     template <typename T>
    T verity(T data,const char *);

public:
    virtual void waitPlaying() = 0;

    virtual void openFile(const std::string &file) = 0;
    virtual void play() = 0;
    virtual void pause() = 0;
    virtual void stop() = 0;
    virtual void setVolume(int vol) = 0;
    virtual void seek(int pos) = 0;
    virtual libvlc_media_t* getMedia() = 0;
    virtual libvlc_event_manager_t* getEventManager_media() = 0;

    virtual void attachEvents() = 0;
    Player() = default;
    virtual ~Player(){};
};

class My_Player
{
private:
    //初始化构造器
    libvlc_instance_t *instance{nullptr};
    //播放器
    libvlc_media_player_t *player{nullptr};
    //媒体//音乐文件
    libvlc_media_t *media{nullptr};
    //事件管理器
    libvlc_event_manager_t *eventManager{nullptr};
    libvlc_event_manager_t *eventManager_media{nullptr};


    /**
     * @brief 验证是否为空
     * 
     * @tparam T 任意类型
     * @param data 不为空则原样返回
     * @return T 
     */
     template <typename T>
    T verity(T data,const char *);

public:
    void waitPlaying();

    void openFile(const std::string &file);
    void play();
    void pause();
    void stop();
    void setVolume(int vol);
    void seek(int pos);
    libvlc_media_t* getMedia();
    libvlc_event_manager_t* getEventManager_media();

    void attachEvents();
    My_Player();
    My_Player(My_Player * player);
    ~My_Player();
};


void getMeta(libvlc_media_t *media);
static void My_Player_handleEvent(const libvlc_event_t *event, void *userData);
