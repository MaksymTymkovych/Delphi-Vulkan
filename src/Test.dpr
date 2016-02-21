(*
** Delphi-Vulkan
**
** Copyright (c) 2016 Maksym Tymkovych
*)

Program Test;

{$APPTYPE CONSOLE}

uses
  vk_platform, vulkan;


  function AppAlloc(
                                pUserData: Pointer;
                                size: size_t;
                                alignment: size_t;
                                allocationScope: TVkSystemAllocationScope
                                ): Pointer; {$IFDEF CDECL}cdecl{$ELSE}stdcall{$ENDIF};
  begin
    Result := GetMemory(size);
  end;

  function AppRealloc(
                                pUserData: Pointer;
                                pOriginal: Pointer;
                                size: size_t;
                                alignment: size_t;
                                allocationScope: TVkSystemAllocationScope): Pointer; {$IFDEF CDECL}cdecl{$ELSE}stdcall{$ENDIF};
  begin
    Result := ReallocMemory(pOriginal,size);
  end;

  procedure AppFree(
                                pUserData: Pointer;
                                pMemory: Pointer); {$IFDEF CDECL}cdecl{$ELSE}stdcall{$ENDIF};
  begin
    FreeMemory(pMemory);
  end;



const
  appInfo: TVkApplicationInfo = (
                                sType: VK_STRUCTURE_TYPE_APPLICATION_INFO;
                                pNext: nil;
                                pApplicationName: 'Test';
                                applicationVersion: 0;
                                pEngineName: 'Test'
                                );
  instInfo: TVkInstanceCreateInfo = (
                                sType: VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
                                pNext: nil;
                                pApplicationInfo: @appInfo;
                                );
var
  allocator: TVkAllocationCallbacks = (
                                pfnAllocation: AppAlloc;
                                pfnReallocation: AppRealloc;
                                pfnFree: AppFree);

var
  instance: PVkInstance;
  err: TVkResult;
begin
  InitVulkan(VulkanLibName);

  if @vkCreateInstance = nil then
  begin
    Exit;
  end;

  err := vkCreateInstance(@instInfo,@allocator,@instance);
  case err of
    VK_ERROR_INCOMPATIBLE_DRIVER:
    begin
      Writeln('Incompatible driver');
    end;
    VK_ERROR_EXTENSION_NOT_PRESENT:
    begin
      Writeln('Extension not present');
    end;
    VK_ERROR_LAYER_NOT_PRESENT:
    begin
      Writeln('Layer not present');
    end;
    VK_ERROR_INITIALIZATION_FAILED:
    begin
      Writeln('Initialization failed');
    end;
    VK_ERROR_OUT_OF_DEVICE_MEMORY:
    begin
      Writeln('Out of device memory');
    end;
    VK_ERROR_OUT_OF_HOST_MEMORY:
    begin
      Writeln('Out of host memory');
    end;
    VK_SUCCESS:
    begin
      Writeln('Success');
    end;
  end;

  Writeln('Press any key...');
  Readln;
end.