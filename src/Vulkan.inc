
{$IFDEF MSWINDOWS}
  {$DEFINE WINDOWS}
{$ENDIF}
{$IFDEF WINDOWS}
  {$IF DEFINED(WIN32) or DEFINED(WIN64)}
    {$DEFINE WINDESKTOP}
  {$ELSE}
    {$DEFINE WINMOBILE}
  {$IFEND}
  {$DEFINE STDCALL}
{$ENDIF}
{$IFDEF LINUX}
  {$DEFINE CDECL}
{$ENDIF}
{$IFDEF DARWIN}
  {$IF DEFINED(iPHONESIM) or (DEFINED(DARWIN) and DEFINED(CPUARM))}
    {$DEFINE iOS}
  {$ELSE}
    {$DEFINE MACOSX}
  {$IFEND}
  {$DEFINE CDECL}
{$ENDIF}


(*
***************************************************************************************************
*   Platform-specific directives and type declarations
***************************************************************************************************
*)

{
/* Platform-specific calling convention macros.
 *
 * Platforms should define these so that Vulkan clients call Vulkan commands
 * with the same calling conventions that the Vulkan implementation expects.
 *
 * VKAPI_ATTR - Placed before the return type in function declarations.
 *              Useful for C++11 and GCC/Clang-style function attribute syntax.
 * VKAPI_CALL - Placed after the return type in function declarations.
 *              Useful for MSVC-style calling convention syntax.
 * VKAPI_PTR  - Placed between the '(' and '*' in function pointer types.
 *
 * Function declaration:  VKAPI_ATTR void VKAPI_CALL vkCommand(void);
 * Function pointer type: typedef void (VKAPI_PTR *PFN_vkCommand)(void);
 */
#if defined(_WIN32)
    // On Windows, Vulkan commands use the stdcall convention
    #define VKAPI_ATTR
    #define VKAPI_CALL __stdcall
    #define VKAPI_PTR  VKAPI_CALL
#elif defined(__ANDROID__) && defined(__ARM_EABI__) && !defined(__ARM_ARCH_7A__)
    // Android does not support Vulkan in native code using the "armeabi" ABI.
    #error "Vulkan requires the 'armeabi-v7a' or 'armeabi-v7a-hard' ABI on 32-bit ARM CPUs"
#elif defined(__ANDROID__) && defined(__ARM_ARCH_7A__)
    // On Android/ARMv7a, Vulkan functions use the armeabi-v7a-hard calling
    // convention, even if the application's native code is compiled with the
    // armeabi-v7a calling convention.
    #define VKAPI_ATTR __attribute__((pcs("aapcs-vfp")))
    #define VKAPI_CALL
    #define VKAPI_PTR  VKAPI_ATTR
#else
    // On other platforms, use the default calling convention
    #define VKAPI_ATTR
    #define VKAPI_CALL
    #define VKAPI_PTR
#endif
}

{$IFDEF WINDOWS}
  {$DEFINE VK_USE_PLATFORM_WIN32_KHR}
{$ENDIF}

{$IFDEF LINUX}
  {$DEFINE VK_USE_PLATFORM_XLIB_KHR}
{$ENDIF}



{$DEFINE VK_VERSION_1_0 1}


{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

{$IFNDEF FPC}
  {$IFDEF VER110}//Builder 3
    {$DEFINE DEFINE_8087CW_NOT_IMPLEMENTED}
    {$DEFINE DEFINE_UINT64_EQU_INT64}
    {$DEFINE DEFINE_REGION_NOT_IMPLEMENTED}
  {$ENDIF}
  {$IFDEF VER100}//Delphi3
    {$DEFINE DEFINE_8087CW_NOT_IMPLEMENTED}
    {$DEFINE DEFINE_UINT64_EQU_INT64}
    {$DEFINE DEFINE_REGION_NOT_IMPLEMENTED}
  {$ENDIF}
  {$IFDEF VER120}//Delphi 4
    {$DEFINE DEFINE_8087CW_NOT_IMPLEMENTED}
    {$DEFINE DEFINE_UINT64_EQU_INT64}
    {$DEFINE DEFINE_REGION_NOT_IMPLEMENTED}
  {$ENDIF}
  {$IFDEF VER130}//Delphi 5
    {$DEFINE DEFINE_UINT64_EQU_INT64}
    {$DEFINE DEFINE_UINT64_EQU_INT64}
  {$ENDIF}
  {$IFDEF VER140}//Delphi 6
    {$DEFINE DEFINE_UINT64_EQU_INT64}
    {$DEFINE DEFINE_REGION_NOT_IMPLEMENTED}
  {$ENDIF}
  {$IFDEF VER150}//Delphi 7
    {$DEFINE DEFINE_REGION_NOT_IMPLEMENTED}
  {$ENDIF}
{$ENDIF}

