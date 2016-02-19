(*
** Copyright (c) 2014-2015 The Khronos Group Inc.
**
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and/or associated documentation files (the
** "Materials"), to deal in the Materials without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Materials, and to
** permit persons to whom the Materials are furnished to do so, subject to
** the following conditions:
**
** The above copyright notice and this permission notice shall be included
** in all copies or substantial portions of the Materials.
**
** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
*)

(*
** Delphi-Vulkan
**
** Copyright (c) 2016 Maksym Tymkovych
*)

unit vk_platform;

interface

{$INCLUDE 'Vulkan.inc'}

type
  Psize_t = ^size_t;
  size_t = Cardinal;

  Puint8_t = ^uint8_t;
  uint8_t = Byte;

  Pint8_t = ^int8_t;
  int8_t = Shortint;

  Pint16_t = ^int16_t;
  int16_t = Smallint;

  Puint16_t = ^uint16_t;
  uint16_t = Word;

  Pint32_t = ^int32_t;
  int32_t = Longint;

  Puint32_t = ^uint32_t;
  uint32_t = Cardinal;

  Pint64_t = ^int64_t;
  int64_t = Int64;

  Puint64_t = ^uint64_t;
  uint64_t = {$IFDEF DEFINE_UINT64_EQU_INT64} Int64;{$ELSE} UInt64;{$ENDIF}

implementation

end.