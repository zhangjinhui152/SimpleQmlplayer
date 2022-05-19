#include "player.h"
#include "my_player.h"
#include "my_player_list.h"
#include <thread>
void fun(My_Player_List *p)
{
    p->openFile("./a2.mp3");
    p->openFile("./a3.mp3");
    p->openFile("./a4.mp3");
    std::this_thread::sleep_for(std::chrono::seconds(3));

    for (auto i : *p->get_song_list())
    {
        std::cout << i.title << std::endl;
    }

    p->play();
    p->setVolume(60);
    std::this_thread::sleep_for(std::chrono::seconds(4));
    p->play_index_media(1);
    p->crash();
    std::this_thread::sleep_for(std::chrono::seconds(4));
    p->get_duration();
    p->get_current_duration();
    std::this_thread::sleep_for(std::chrono::seconds(4));
    p->seek(60);
    p->setVolume(60);
    p->next();
    p->get_duration();
    p->get_current_duration();
    std::this_thread::sleep_for(std::chrono::seconds(4));
    p->pause();
    printf("pause\n");
    p->setVolume(60);
    p->previous();
    std::this_thread::sleep_for(std::chrono::seconds(5));
    p->stop();
}
int main(int argc, char *argv[])
{
    My_Player_List *p = new My_Player_List();
    fun(p);

    return 0;
}