(*
** Initial source and read more at:
** https://gist.github.com/graphitemaster/e162a24e57379af840d4#file-t1-md
** Copyright (c) Dale Weiler (graphitemaster)
*)
(*
** Delphi-Vulkan
**
** Copyright (c) 2016 Maksym Tymkovych
*)
program Tutorial1;

{$APPTYPE CONSOLE}

uses
  vk_platform in '..\src\vk_platform.pas',
  vulkan in '..\src\vulkan.pas';

var
  applicationInfo: TVkApplicationInfo;
  instanceInfo: TVkInstanceCreateInfo;
  instance: TVkInstance;

  result: TVkResult;

begin
  InitVulkan(VulkanLibName);

  // Filling out application description:
  // sType is mandatory
  applicationInfo.sType := VK_STRUCTURE_TYPE_APPLICATION_INFO;
  // pNext is mandatory
  applicationInfo.pNext := nil;
  // The name of our application
  applicationInfo.pApplicationName := 'Tutorial 1';
  // The name of the engine (e.g: Game engine name)
  applicationInfo.pEngineName := nil;
  // The version of the engine
  applicationInfo.engineVersion := 1;
  // The version of Vulkan we're using for this application
  applicationInfo.apiVersion := VK_API_VERSION;

  // Filling out instance description:
  // sType is mandatory
  instanceInfo.sType := VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
  // pNext is mandatory
  instanceInfo.pNext := nil;
  // flags is mandatory
  instanceInfo.flags := 0;
  // The application info structure is then passed through the instance
  instanceInfo.pApplicationInfo := @applicationInfo;
  // Don't enable and layer
  instanceInfo.enabledLayerCount := 0;
  instanceInfo.ppEnabledLayerNames := nil;
  // Don't enable any extensions
  instanceInfo.enabledExtensionCount := 0;
  instanceInfo.ppEnabledExtensionNames := nil;

  // Now create the desired instance
  result := vkCreateInstance(@instanceInfo, nil, @instance);
  if (result <> VK_SUCCESS) then
  begin
    Writeln('Failed to create instance: ',Integer(result));
    Exit;
  end;

  // To Come Later
  // ...
  // ...


  // Never forget to free resources
  vkDestroyInstance(instance, nil);

end.
