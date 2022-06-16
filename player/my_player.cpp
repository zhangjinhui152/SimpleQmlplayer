#include "my_player.h"
void getMeta(libvlc_media_t *media)
{
    // 读取标题、艺术家、专辑
    char *title = libvlc_media_get_meta(media, libvlc_meta_Title);
    char *artist = libvlc_media_get_meta(media, libvlc_meta_Artist);
    char *album = libvlc_media_get_meta(media, libvlc_meta_Album);
    auto *img = libvlc_media_get_meta(media, libvlc_meta_ArtworkURL);
    

    if (nullptr != title)
        std::cout << "title: " << title << std::endl;

    if (nullptr != artist)
        std::cout << "artist: " << artist << std::endl;

    if (nullptr != album)
        std::cout << "album: " << album << std::endl;

     if (nullptr != img)
        std::cout << "img: " << img << std::endl;
}
static void handleParsedEvent(const libvlc_event_t *event, void *userData)
{
    auto player = static_cast<My_Player *>(userData);
    switch (event->type)
    {
    case libvlc_MediaParsedChanged:
    {
        int state = event->u.media_parsed_changed.new_status;
        if (libvlc_media_parsed_status_done == state){
            getMeta(player->getMedia());
            
        }

        break;
    }
    default:
        break;
    }
}

static void My_Player_handleEvent(const libvlc_event_t *event, void *userData)
{
    My_Player *player = static_cast<My_Player *>(userData);
    switch (event->type)
    {
    // 播放状态改变
    case libvlc_MediaPlayerOpening:
        std::cout << "libvlc_MediaPlayerOpening" << std::endl;

    case libvlc_MediaPlayerBuffering:
        // std::cout << "libvlc_MediaPlayerBuffering" << std::endl;

        printf("libvlc_MediaPlayerBuffering");
        printf("\r");
        break;
    case libvlc_MediaPlayerPlaying:
    {
        std::cout << "libvlc_MediaPlayerPlaying" << std::endl;
        break;
    }
    case libvlc_MediaPlayerPaused:
    {
        std::cout << "libvlc_MediaPlayerPaused" << std::endl;
        break;
    }
    case libvlc_MediaPlayerStopped:
    {
        std::cout << "libvlc_MediaPlayerStopped" << std::endl;
        break;
    }
    case libvlc_MediaPlayerEncounteredError:
    {
        std::cout << "libvlc_MediaPlayerEncounteredError" << std::endl;
        break;
    }
    // 时长改变
    case libvlc_MediaPlayerLengthChanged:
    {
        long long dur = event->u.media_player_length_changed.new_length;
        // player->durationChanged(dur);
        break;
    }
    // 播放时间改变
    case libvlc_MediaPlayerTimeChanged:
    {
        long long time = event->u.media_player_time_changed.new_time;
        // player->timeChanged(time);
        break;
    }
    // 播放位置改变
    case libvlc_MediaPlayerPositionChanged:
    {
        // float pos = event->u.media_player_position_changed.new_position;
        // player->positionChanged(pos);
        break;
    }
    case libvlc_MediaParsedChanged:
    {
        int state = event->u.media_parsed_changed.new_status;
        if (libvlc_media_parsed_status_done == state)
        {
            std::cout << "libvlc_MediaParsedChanged" << std::endl;
        }
        //  getMeta(player->getMedia());

        std::cout << "libvlc_MediaParsedChanged" << std::endl;
        break;
    }
    default:

        break;
    }
}
My_Player::My_Player()
{

    this->instance = libvlc_new(0, NULL);
}
void My_Player::waitPlaying()
{
    libvlc_state_t state;

    do
    {
        int64_t milliseconds = libvlc_media_player_get_time(this->player);
        int64_t seconds = milliseconds / 1000;
        int64_t minutes = seconds / 60;
        milliseconds -= seconds * 1000;
        seconds -= minutes * 60;
        // printf("Current time: %" PRId64 ":%" PRId64 ":%" PRId64 "\n",minutes, seconds, milliseconds);
        state = libvlc_media_player_get_state(this->player);
    } while (state != libvlc_Error && state != libvlc_Ended || state != libvlc_state_t::libvlc_Paused);
    libvlc_media_player_stop(this->player);
}

void My_Player::openFile(const std::string &file)
{
    // this->media = libvlc_media_new_path(this->instance, file.c_str());

    this->media = this->verity(libvlc_media_new_path(this->instance, file.c_str()), "openFile media");
    this->player = this->verity(libvlc_media_player_new_from_media(this->media), "openFile player");
    this->eventManager = this->verity(libvlc_media_player_event_manager(this->player), "openFile eventManager");

    this->attachEvents();
    this->eventManager_media = libvlc_media_event_manager(this->media);
    libvlc_event_attach(this->eventManager_media, libvlc_MediaParsedChanged, handleParsedEvent, this);
    libvlc_media_parse_with_options(media, libvlc_media_parse_local, 1000);



    // std::this_thread::sleep_for(std::chrono::seconds(1));
}

void My_Player::play() 
{

    auto status = libvlc_media_player_get_state(this->player);

    if (status == libvlc_state_t::libvlc_Paused)
    {
        libvlc_media_player_set_pause(this->player, false);
    }
    else
    {
        libvlc_media_player_play(this->player);
        // waitPlaying();
    }
    // else if (status == libvlc_state_t::libvlc_Playing)
    // {
    //     libvlc_media_player_set_pause(this->player,false);
    // }
}

void My_Player::pause()
{

    if (libvlc_media_player_can_pause(this->player))
        libvlc_media_player_set_pause(this->player, true);
}

void My_Player::stop()
{
    libvlc_media_player_stop(this->player);
}

void My_Player::setVolume(int vol)
{
    libvlc_audio_set_volume(this->player, vol);
}
 
void My_Player::seek(int pos)
{

    libvlc_time_t duration = libvlc_media_get_duration(this->media);
    float ms = float(pos) / 100 * float(duration);
    libvlc_media_player_set_time(this->player, libvlc_time_t(ms));
}

void My_Player::next()
{
    
}

void My_Player::previous()
{
    
}



libvlc_media_t *My_Player::getMedia()
{
    // return this->media;
    return this->media;
}





libvlc_event_manager_t *My_Player::getEventManager_media()
{
    return this->eventManager_media;
}

void My_Player::attachEvents()
{
    std::vector<libvlc_event_e> events;
    events.push_back(libvlc_MediaPlayerOpening);
    events.push_back(libvlc_MediaPlayerBuffering);
    events.push_back(libvlc_MediaPlayerPlaying);
    events.push_back(libvlc_MediaPlayerPaused);
    events.push_back(libvlc_MediaPlayerStopped);
    events.push_back(libvlc_MediaPlayerEncounteredError);
    events.push_back(libvlc_MediaPlayerMuted);
    events.push_back(libvlc_MediaPlayerUnmuted);
    events.push_back(libvlc_MediaPlayerAudioVolume);
    events.push_back(libvlc_MediaPlayerLengthChanged);
    events.push_back(libvlc_MediaPlayerTimeChanged);
    events.push_back(libvlc_MediaPlayerPositionChanged);
    // events.push_back(libvlc_MediaParsedChanged);

    // 订阅事件
    // foreach (const libvlc_event_e &e, events) {
    //     libvlc_event_attach(m_eventManager, e, handleEvents, this);
    // }

    for (const libvlc_event_e &e : events)
    {
        libvlc_event_attach(this->eventManager, e, My_Player_handleEvent, this);
    }
}

My_Player::My_Player(My_Player * player)
{
    this->player = player->player;
    this->instance = player->instance;
    this->media = player->media;
    this->eventManager = player->eventManager;
    this->eventManager_media = player->eventManager_media;



}
My_Player::~My_Player()
{

    if (this->media != nullptr)
    {
        libvlc_media_release(this->media);
    }

    if (this->player != nullptr)
    {
        libvlc_media_player_release(this->player);
    }

    if (this->instance != nullptr)
    {
        libvlc_release(this->instance);
    }
}

template <typename T>
T My_Player::verity(T data, const char *p)
{
    if (data == nullptr || data == NULL)
    {
        printf("this is  error for %s", p);
    }
    return data;
}
