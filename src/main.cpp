#include "tri_lib.h"
#include "input.h"
#include "platform.h"

#define GL_GLEXT_PROTOTYPES
#define APIENTRY
#include <glcorearb.h>
#ifdef _WIN32
#include "win32_platform.cpp"
#endif

#include "gl_renderer.cpp"

int main(){

    platform_create_window(1200,720, "project triality");
    input.screenSizeX = 1200;
    input.screenSizeY = 720;
    BumpAllocator transientStorage = make_bump_allocator(MB(50));

    gl_init(&transientStorage);

    while (running)
    {
        // update
        platform_update_window();
        gl_render();
        platform_swap_buffers();
    }

    return 0;
    
}