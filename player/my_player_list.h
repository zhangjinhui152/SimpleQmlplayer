#include "player.h"
class my_player_list:public Base_Player
{
private:
    /* data */
    libvlc_instance_t* instance;
    libvlc_media_list_t* media_List;
    libvlc_media_player_t* player;
    libvlc_media_list_player_t *player_list;
    
    libvlc_event_manager_t *eventManager{nullptr};
    libvlc_event_manager_t *eventManager_media{nullptr};

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

    void attachEvents();
    my_player_list();
    ~my_player_list();
};
static void My_Player_List_handleEvent(const libvlc_event_t *event, void *userData);

