#include "player.h"

#include <vector>
#include <tuple>
#include <string>
#include <utility>
struct MediaInfo
{
    char *title;
    char *artist;
    char *album;
    char *img;
};
class qtPlayer;
class My_Player_List : public Base_Player
{
    friend qtPlayer;
private:
    /* data */
    libvlc_instance_t *instance{nullptr};
    libvlc_media_list_t *media_List{nullptr};
    libvlc_media_player_t *player{nullptr};
    libvlc_media_list_player_t *player_list{nullptr};

    libvlc_media_t *tempMedia{nullptr};

    libvlc_event_manager_t *eventManager{nullptr};
    libvlc_event_manager_t *eventManager_media{nullptr};

    std::vector<std::pair<libvlc_media_t *, My_Player_List *> *> *crash_pair_data;
    std::vector<MediaInfo> *song_list;

public:
    template <typename T>
    T verity(T data, const char *);
    void openFile(const std::string &file) override;
    void play() override;
    void pause() override;
    void stop() override;
    void setVolume(int vol) override;
    void seek(int pos) override;
    void next() override;
    void previous() override;
    int get_duration();
    int get_current_duration();

    void crash();

    std::vector<MediaInfo> *get_song_list();
    libvlc_media_t *get_tempMedia();

    void play_index_media(int);
    void attachEvents();
    My_Player_List();
    ~My_Player_List();
};
static void My_Player_List_handleEvent(const libvlc_event_t *event, void *userData);
