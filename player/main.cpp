#include "player.h"
#include "my_player.h"
#include "my_player_list.h"
#include <thread>
void fun(my_player_list *p)
{
    p->openFile("./a3.mp3");
    p->openFile("./a4.mp3");
    // p->openFile("./a3.mp3");
    p->setVolume(60);
    std::this_thread::sleep_for(std::chrono::seconds(4));
    p->play();
    p->get_duration();
    p->get_current_duration();
    std::this_thread::sleep_for(std::chrono::seconds(4));
    p->get_current_duration();
    p->next();
    p->get_duration();
    p->get_current_duration();
    std::this_thread::sleep_for(std::chrono::seconds(4));
    p->setVolume(60);
    p->seek(60);
    std::this_thread::sleep_for(std::chrono::seconds(5));
    printf("pause\n");
    p->pause();
    p->setVolume(60);
    p->previous();
    std::this_thread::sleep_for(std::chrono::seconds(5));
    p->play();
    std::this_thread::sleep_for(std::chrono::seconds(105));
}
int main(int argc, char *argv[])
{
    my_player_list *p = new my_player_list();
    fun(p);

    return 0;
}