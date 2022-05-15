
#ifdef __cplusplus
extern "C"
{
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <unistd.h>
#include <vlc/vlc.h>
}
#endif
#ifndef __cplusplus
// #include <stdio.h>
//  #include <stdlib.h>
//  #include <inttypes.h>
//  #include <unistd.h>
//  #include <vlc/vlc.h>
#endif // !__cplusplus

void handleEvents(const libvlc_event_t *event, void *userData)
{
    // Player *player = static_cast(userData);
// Player *player = static_cast(userData);
    switch (event->type)
    {
    // 播放状态改变
    case libvlc_MediaPlayerOpening:
    {
        printf("libvlc_MediaPlayerOpening");
        break;
    }
    case libvlc_MediaPlayerBuffering:
    {
        printf("libvlc_MediaPlayerBuffering");
        break;
    }
    case libvlc_MediaPlayerPlaying:
    {
        printf("libvlc_MediaPlayerPlaying");
        break;
    }
    case libvlc_MediaPlayerPaused:
    {
        printf("libvlc_MediaPlayerPaused");
        break;
    }
    case libvlc_MediaPlayerStopped:
    {
        printf("libvlc_MediaPlayerStopped");
        break;
    }
    case libvlc_MediaPlayerEncounteredError:
    {
        printf("libvlc_MediaPlayerEncounteredError");
        break;
    }
    // 时长改变
    case libvlc_MediaPlayerLengthChanged:
    {
        printf("libvlc_MediaPlayerLengthChanged");
        break;
    }
    // 播放时间改变
    case libvlc_MediaPlayerTimeChanged:
    {
        printf("libvlc_MediaPlayerTimeChanged");

        break;
    }
    // 播放位置改变
    case libvlc_MediaPlayerPositionChanged:
    {
        printf("libvlc_MediaPlayerPositionChanged");
        break;
    }
    default:
        break;
    }
}
void waitPlaying(libvlc_media_player_t *mp)
{
    // libvlc_media_player_stop(mp);
    libvlc_state_t state;
    do
    {
        int64_t milliseconds = libvlc_media_player_get_time(mp);
        int64_t seconds = milliseconds / 1000;
        int64_t minutes = seconds / 60;
        milliseconds -= seconds * 1000;
        seconds -= minutes * 60;

        printf("Current time: %" PRId64 ":%" PRId64 ":%" PRId64 "\n",
               minutes, seconds, milliseconds);
        state = libvlc_media_player_get_state(mp);

    } while (state != libvlc_Error && state != libvlc_Ended);
}
int main(int argc, char *argv[])
{
    libvlc_instance_t *instance;
    libvlc_media_t *media;
    libvlc_media_player_t *player;
    const char *localMrl = "/home/zjh/program/c++/lib/libvlcpp/hello/build/a2.mp3";

    instance = libvlc_new(0, NULL);
    media = libvlc_media_new_path(instance, localMrl);
    player = libvlc_media_player_new_from_media(media);

    libvlc_media_player_play(player);
    waitPlaying(player);

    // 释放 libvlc 实例
    // 释放 media player
    libvlc_media_release(media);
    libvlc_media_player_release(player);
    libvlc_release(instance);

    return 0;
}