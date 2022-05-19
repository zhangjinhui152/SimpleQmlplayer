#include "my_player_list.h"
#include <memory>

void get_media_info1(libvlc_media_t *media, My_Player_List *player)
{
    auto info = MediaInfo{libvlc_media_get_meta(media, libvlc_meta_Title),
                          libvlc_media_get_meta(media, libvlc_meta_Artist),
                          libvlc_media_get_meta(media, libvlc_meta_Album),
                          libvlc_media_get_meta(media, libvlc_meta_ArtworkURL)};
    player->get_song_list()->push_back(info);
}
void getMeta_1(libvlc_media_t *media)
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
static void listHandleParsedEvent(const libvlc_event_t *event, void *userData)
{
    auto media = static_cast<libvlc_media_t *>(userData);
    switch (event->type)
    {
    case libvlc_MediaParsedChanged:
    {
        int state = event->u.media_parsed_changed.new_status;
        if (libvlc_media_parsed_status_done == state)
        {
            getMeta_1(media);

            libvlc_media_release(media);
        }

        break;
    }
    default:
        break;
    }
}
static void listHandleParsedEventForPlayer(const libvlc_event_t *event, void *userData)
{
    auto player = static_cast<std::pair<libvlc_media_t *, My_Player_List *> *>(userData);
    switch (event->type)
    {
    case libvlc_MediaParsedChanged:
    {
        int state = event->u.media_parsed_changed.new_status;
        if (libvlc_media_parsed_status_done == state)
        {
           get_media_info1(player->first,player->second);
        }
        break;
    }
    default:

        break;
    }
}
void My_Player_List::openFile(const std::string &file)
{

    auto temp_media = libvlc_media_new_path(this->instance, file.c_str());
    this->eventManager_media = libvlc_media_event_manager(temp_media);

    auto data = new std::pair<libvlc_media_t *, My_Player_List *>{temp_media, this};
    this->crash_pair_data->push_back(data);
    libvlc_event_attach(this->eventManager_media, libvlc_MediaParsedChanged, listHandleParsedEventForPlayer, data);
    libvlc_media_parse_with_options(temp_media, libvlc_media_parse_local, 1000);

    libvlc_media_list_add_media(this->media_List, temp_media);
}

void My_Player_List::play()
{
    auto status = libvlc_media_list_player_get_state(this->player_list);
    if (status == libvlc_state_t::libvlc_Paused)
    {
        libvlc_media_list_player_set_pause(this->player_list, false);
    }
    else
    {
        libvlc_media_list_player_play(this->player_list);
    }
}

void My_Player_List::pause()
{
    libvlc_media_list_player_set_pause(this->player_list, true);
}

void My_Player_List::stop()
{
    libvlc_media_list_player_stop(this->player_list);
}

void My_Player_List::setVolume(int vol)
{
    auto player = libvlc_media_list_player_get_media_player(this->player_list);
    libvlc_audio_set_volume(player, vol);
}

void My_Player_List::seek(int pos)
{
    auto player = libvlc_media_list_player_get_media_player(this->player_list);
    auto media = libvlc_media_player_get_media(player);

    if (media)
    {
        libvlc_time_t duration = libvlc_media_get_duration(media);
        float ms = float(pos) / 100 * float(duration);
        libvlc_media_player_set_time(libvlc_media_list_player_get_media_player(this->player_list), libvlc_time_t(ms));
    }
}

void My_Player_List::next()
{
    libvlc_media_list_player_next(this->player_list);
}

void My_Player_List::previous()
{
    libvlc_media_list_player_previous(this->player_list);
}

int My_Player_List::get_duration()
{
    auto player = libvlc_media_list_player_get_media_player(this->player_list);
    auto media = libvlc_media_player_get_media(player);
    libvlc_time_t duration = libvlc_media_get_duration(media);
    int currentTime = static_cast<int>(duration);
    std::cout << currentTime << std::endl;
    return currentTime;
}

int My_Player_List::get_current_duration()
{

    auto player = libvlc_media_list_player_get_media_player(this->player_list);
    libvlc_time_t duration = libvlc_media_player_get_time(player);
    int currentTime = static_cast<int>(duration);
//    std::cout << "nt My_Player_List::get_current_duration()" << currentTime << std::endl;
    return currentTime;
}

void My_Player_List::attachEvents()
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

    // for (const libvlc_event_e &e : events)
    // {
    //     libvlc_event_attach(this->eventManager, e, My_Player_List_handleEvent, this);
    // }
}

void My_Player_List::crash()
{
    for (auto i : *this->crash_pair_data)
    {
        libvlc_media_release(i->first);
        delete i;
    }
    
    
}

std::vector<MediaInfo> *My_Player_List::get_song_list()
{
    return this->song_list;
}

libvlc_media_t *My_Player_List::get_tempMedia()
{
    return this->tempMedia;
}

void My_Player_List::play_index_media(int index)
{
    libvlc_media_list_player_play_item_at_index(this->player_list, index);
}

My_Player_List::My_Player_List()
{
    this->instance = libvlc_new(0, NULL);
    this->player_list = libvlc_media_list_player_new(this->instance);
    this->player = libvlc_media_player_new(this->instance);
    this->media_List = libvlc_media_list_new(this->instance);

    this->crash_pair_data = new std::vector<std::pair<libvlc_media_t *, My_Player_List *> *>();
    this->song_list = new std::vector<MediaInfo>();

    libvlc_media_list_player_set_media_list(this->player_list, this->media_List);
    libvlc_media_list_player_set_media_player(this->player_list, this->player);
}

My_Player_List::~My_Player_List()
{
}

void My_Player_List_handleEvent(const libvlc_event_t *event, void *userData)
{
}

template <typename T>
T My_Player_List::verity(T data, const char *p)
{
    if (data == nullptr)
    {
        printf("this is  error for %s", p);
    }
    return data;
}
