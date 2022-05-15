#include "player.h"
#include <thread>

int main(int argc, char *argv[])
{
    My_Player p;
    p.openFile("./a3.mp3");
    p.play();
    p.setVolume(80);
    p.seek(60);
    std::this_thread::sleep_for(std::chrono::seconds(5));
    printf("pause\n");
    p.pause();
    p.setVolume(100);
    std::this_thread::sleep_for(std::chrono::seconds(5));
    p.play();
    std::this_thread::sleep_for(std::chrono::seconds(105));
    
    return 0;
}