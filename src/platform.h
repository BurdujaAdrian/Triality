#pragma once
//################################################################
//                          Platform globals
//################################################################
static bool running = true;

//################################################################
//                          Platform Functions
//################################################################

bool platform_create_window(int width, int hight, char* title);
void platform_update_window();
void* platform_load_gl_function(char* funName);
void platform_swap_buffers();