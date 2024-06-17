#include "tri_lib.h"

//################################################################
//                          Platform globals
//################################################################


static bool running = true;

//################################################################
//                          Platform Functions
//################################################################

bool platform_create_window(int width, int hight, char* title);
void platform_update_window();
//################################################################
//                         Windows Platform 
//################################################################
#ifdef _WIN32
#define WIN32_LEAN_AND_MEAN
#define NOMINAX
#include <Windows.h>
//################################################################
//                          Windows globals
//################################################################

static HWND window; 
//################################################################
//                          Platform implementations
//################################################################

LRESULT CALLBACK windows_window_callback(HWND window, UINT msg, WPARAM wParam, LPARAM lParam){
    LRESULT result = 0;

    switch (msg)
    {
    case WM_CLOSE: {
            running = false;
            break;
        }
    default:{
            result = DefWindowProcA(window, msg, wParam, lParam);
        }
    }

    return result;
}

bool platform_create_window(int width, int hight, char* title){
    HINSTANCE instance = GetModuleHandleA(0);

    WNDCLASSA wc = {};
    wc.hInstance = instance;
    wc.hIcon = LoadIcon(instance, IDI_APPLICATION);
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.lpszClassName = title;
    wc.lpfnWndProc = windows_window_callback; 

    if(!RegisterClassA(&wc)){
        return false;
    }

    int dwStyle = WS_OVERLAPPEDWINDOW;

    window = CreateWindowExA(
        0, title, title, dwStyle,
        100, 100, width, hight,
        NULL, NULL, instance, NULL);

    if(window == NULL){
        return false;
    }

    ShowWindow(window, SW_SHOW);

    return true;
}

void platform_update_window(){
    MSG msg;

    while (PeekMessageA(&msg, window, 0,0, PM_REMOVE)){
        TranslateMessage(&msg);
        DispatchMessageA(&msg);

    }
    
}

#endif

int main(){

    platform_create_window(1200,720, "project triality");
    while (running)
    {
        // update
        platform_update_window();
        SM_TRACE("test");
        SM_WARN("warn");
        SM_ERROR("bruh");
        SM_ASSERT(false, "Assertion failed")
    }

    return 0;
    
}