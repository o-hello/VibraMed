unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UnitLogger;

type
  TFormMain = class(TForm)
    Button1: TButton;
    MemoLog: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.Button1Click(Sender: TObject);
var
  I : Integer;
  H : HWND;
  MainHandle : HWND;
  ToolBarHandle : HWND;
  X : Integer;
  Y : Integer;
  Point : Integer;
begin
  MainHandle := FindWindow(Nil, ' - VibraMed');
  Logger.info(Format('MainHandle: %x', [MainHandle]));
  ToolBarHandle := MainHandle;

  ToolBarHandle := FindWindowEx(ToolBarHandle, 0, Nil, '');
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));

  H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
  // Logger.info(Format('H: %x', [H]));
  if H = 0 then
  begin
    for I:=0 to 9 do
    begin
      ToolBarHandle := GetNextWindow(ToolBarHandle, GW_HWNDNEXT);
      // Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
      H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
      // Logger.info(Format('H: %x', [H]));
      if H <> 0 then
      begin
        Break;
      end;  
    end;
  end;
  ToolBarHandle := H;
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
  if ToolBarHandle = 0 then
  begin
    Exit;
  end;
  X := 130; Y:= 35; Point := (Y shl 16) or X;
  PostMessage(ToolBarHandle, WM_LBUTTONDOWN, MK_LBUTTON, Point);
  PostMessage(ToolBarHandle, WM_LBUTTONUP, MK_LBUTTON, Point);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  UnitLogger.Logger := UnitLogger.TLogger.Create(Application.ExeName + '.log.txt', LOG_MAX_LEVEL);
  UnitLogger.Logger.Memolog := MemoLog;
  Logger.info(Format('Application: %s %d', [Application.Exename, GetCurrentProcessId]));
  Logger.info(Format('Version: %s', ['1.1.0@2018.07.18 22:50:00']));
end;

procedure TFormMain.Button2Click(Sender: TObject);
var
  I : Integer;
  H : HWND;
  MainHandle : HWND;
  ToolBarHandle : HWND;
  X : Integer;
  Y : Integer;
  Point : Integer;
begin
  MainHandle := FindWindow(Nil, ' - VibraMed');
  Logger.info(Format('MainHandle: %x', [MainHandle]));
  ToolBarHandle := MainHandle;

  ToolBarHandle := FindWindowEx(ToolBarHandle, 0, Nil, '');
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));

  H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
  // Logger.info(Format('H: %x', [H]));
  if H = 0 then
  begin
    for I:=0 to 9 do
    begin
      ToolBarHandle := GetNextWindow(ToolBarHandle, GW_HWNDNEXT);
      // Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
      H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
      // Logger.info(Format('H: %x', [H]));
      if H <> 0 then
      begin
        Break;
      end;  
    end;
  end;
  ToolBarHandle := H;
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
  if ToolBarHandle = 0 then
  begin
    Exit;
  end;
  X := 180; Y:= 35; Point := (Y shl 16) or X;
  PostMessage(ToolBarHandle, WM_LBUTTONDOWN, MK_LBUTTON, Point);
  PostMessage(ToolBarHandle, WM_LBUTTONUP, MK_LBUTTON, Point);
end;

procedure TFormMain.Button3Click(Sender: TObject);
var
  I : Integer;
  H : HWND;
  MainHandle : HWND;
  ToolBarHandle : HWND;
  X : Integer;
  Y : Integer;
  Point : Integer;
begin
  MainHandle := FindWindow(Nil, ' - VibraMed');
  Logger.info(Format('MainHandle: %x', [MainHandle]));
  ToolBarHandle := MainHandle;

  ToolBarHandle := FindWindowEx(ToolBarHandle, 0, Nil, '');
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));

  H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
  // Logger.info(Format('H: %x', [H]));
  if H = 0 then
  begin
    for I:=0 to 9 do
    begin
      ToolBarHandle := GetNextWindow(ToolBarHandle, GW_HWNDNEXT);
      // Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
      H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
      // Logger.info(Format('H: %x', [H]));
      if H <> 0 then
      begin
        Break;
      end;  
    end;
  end;
  ToolBarHandle := H;
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
  if ToolBarHandle = 0 then
  begin
    Exit;
  end;
  X := 250; Y:= 35; Point := (Y shl 16) or X;
  PostMessage(ToolBarHandle, WM_LBUTTONDOWN, MK_LBUTTON, Point);
  PostMessage(ToolBarHandle, WM_LBUTTONUP, MK_LBUTTON, Point);
end;

procedure TFormMain.Button4Click(Sender: TObject);
var
  I : Integer;
  H : HWND;
  MainHandle : HWND;
  ToolBarHandle : HWND;
  X : Integer;
  Y : Integer;
  Point : Integer;
begin
  MainHandle := FindWindow(Nil, ' - VibraMed');
  Logger.info(Format('MainHandle: %x', [MainHandle]));
  ToolBarHandle := MainHandle;

  ToolBarHandle := FindWindowEx(ToolBarHandle, 0, Nil, '');
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));

  H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
  // Logger.info(Format('H: %x', [H]));
  if H = 0 then
  begin
    for I:=0 to 9 do
    begin
      ToolBarHandle := GetNextWindow(ToolBarHandle, GW_HWNDNEXT);
      // Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
      H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
      // Logger.info(Format('H: %x', [H]));
      if H <> 0 then
      begin
        Break;
      end;  
    end;
  end;
  ToolBarHandle := H;
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
  if ToolBarHandle = 0 then
  begin
    Exit;
  end;
  X := 320; Y:= 35; Point := (Y shl 16) or X;
  PostMessage(ToolBarHandle, WM_LBUTTONDOWN, MK_LBUTTON, Point);
  PostMessage(ToolBarHandle, WM_LBUTTONUP, MK_LBUTTON, Point);
end;

procedure TFormMain.Button5Click(Sender: TObject);
var
  I : Integer;
  H : HWND;
  MainHandle : HWND;
  ToolBarHandle : HWND;
  X : Integer;
  Y : Integer;
  Point : Integer;
begin
  MainHandle := FindWindow(Nil, ' - VibraMed');
  Logger.info(Format('MainHandle: %x', [MainHandle]));
  ToolBarHandle := MainHandle;

  ToolBarHandle := FindWindowEx(ToolBarHandle, 0, Nil, '');
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));

  H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
  // Logger.info(Format('H: %x', [H]));
  if H = 0 then
  begin
    for I:=0 to 9 do
    begin
      ToolBarHandle := GetNextWindow(ToolBarHandle, GW_HWNDNEXT);
      // Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
      H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
      // Logger.info(Format('H: %x', [H]));
      if H <> 0 then
      begin
        Break;
      end;  
    end;
  end;
  ToolBarHandle := H;
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
  if ToolBarHandle = 0 then
  begin
    Exit;
  end;
  X := 390; Y:= 35; Point := (Y shl 16) or X;
  PostMessage(ToolBarHandle, WM_LBUTTONDOWN, MK_LBUTTON, Point);
  PostMessage(ToolBarHandle, WM_LBUTTONUP, MK_LBUTTON, Point);
end;

procedure TFormMain.Button6Click(Sender: TObject);
var
  I : Integer;
  H : HWND;
  MainHandle : HWND;
  ToolBarHandle : HWND;
  X : Integer;
  Y : Integer;
  Point : Integer;
begin
  MainHandle := FindWindow(Nil, ' - VibraMed');
  Logger.info(Format('MainHandle: %x', [MainHandle]));
  ToolBarHandle := MainHandle;

  ToolBarHandle := FindWindowEx(ToolBarHandle, 0, Nil, '');
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));

  H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
  // Logger.info(Format('H: %x', [H]));
  if H = 0 then
  begin
    for I:=0 to 9 do
    begin
      ToolBarHandle := GetNextWindow(ToolBarHandle, GW_HWNDNEXT);
      // Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
      H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
      // Logger.info(Format('H: %x', [H]));
      if H <> 0 then
      begin
        Break;
      end;  
    end;
  end;
  ToolBarHandle := H;
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
  if ToolBarHandle = 0 then
  begin
    Exit;
  end;
  X := 430; Y:= 35; Point := (Y shl 16) or X;
  PostMessage(ToolBarHandle, WM_LBUTTONDOWN, MK_LBUTTON, Point);
  PostMessage(ToolBarHandle, WM_LBUTTONUP, MK_LBUTTON, Point);
end;

procedure TFormMain.Button7Click(Sender: TObject);
var
  I : Integer;
  H : HWND;
  MainHandle : HWND;
  ToolBarHandle : HWND;
  X : Integer;
  Y : Integer;
  Point : Integer;
begin
  MainHandle := FindWindow(Nil, ' - VibraMed');
  Logger.info(Format('MainHandle: %x', [MainHandle]));
  ToolBarHandle := MainHandle;

  ToolBarHandle := FindWindowEx(ToolBarHandle, 0, Nil, '');
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));

  H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
  // Logger.info(Format('H: %x', [H]));
  if H = 0 then
  begin
    for I:=0 to 9 do
    begin
      ToolBarHandle := GetNextWindow(ToolBarHandle, GW_HWNDNEXT);
      // Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
      H := FindWindowEx(ToolBarHandle, 0, Nil, 'Toolbar');
      // Logger.info(Format('H: %x', [H]));
      if H <> 0 then
      begin
        Break;
      end;  
    end;
  end;
  ToolBarHandle := H;
  Logger.info(Format('ToolBarHandle: %x', [ToolBarHandle]));
  if ToolBarHandle = 0 then
  begin
    Exit;
  end;
  X := 460; Y:= 35; Point := (Y shl 16) or X;
  PostMessage(ToolBarHandle, WM_LBUTTONDOWN, MK_LBUTTON, Point);
  PostMessage(ToolBarHandle, WM_LBUTTONUP, MK_LBUTTON, Point);
end;

end.
