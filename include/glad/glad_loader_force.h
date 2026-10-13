#pragma once

#ifndef GLAPI
# if defined(GLAD_GLAPI_EXPORT)
#  if defined(_WIN32) || defined(__CYGWIN__)
#   if defined(GLAD_GLAPI_EXPORT_BUILD)
#    if defined(__GNUC__)
#     define GLAPI __attribute__ ((dllexport)) extern
#    else
#     define GLAPI __declspec(dllexport) extern
#    endif
#   else
#    if defined(__GNUC__)
#     define GLAPI __attribute__ ((dllimport)) extern
#    else
#     define GLAPI __declspec(dllimport) extern
#    endif
#   endif
#  elif defined(__GNUC__) && defined(GLAD_GLAPI_EXPORT_BUILD)
#   define GLAPI __attribute__ ((visibility ("default"))) extern
#  else
#   define GLAPI extern
#  endif
# else
#  define GLAPI extern
# endif
#endif

#ifdef __cplusplus
extern "C" {
#endif

// glLibrary - is a ForceEngine struct that realized by specifc OS GL Context.
// Win32: WGLLibrary
// Cocoa: CGLLibrary (future)
// X11:   XGLLibrary (future)
typedef void* (*GLADloadproc_force)(const char* name, void* glLibrary);
GLAPI int gladLoadGL_force(void* glLibrary);
GLAPI int gladLoadGLLoader_force(GLADloadproc_force, void* glLibrary);

#ifdef __cplusplus
}
#endif

