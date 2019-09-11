unit UnitLogger;

interface

uses Windows, Forms, SysUtils, StdCtrls, Classes;

const
  LOGFILE_MAX_SIZE       = 1024*1024;
  LOGFILE_LINE_MAX_SIZE  = 2*1024;
  LOGFILE_PATH           = './app.hello.txt';
  LOGFILE_MUTEX_NAME     = 'app.hello.LOGGER';

  LOG_EMERG     = 0;      //�����������Ҫ����֪ͨ������Ա��
  LOG_ALERT     = 1;      //Ӧ�ñ��������������⣬��ϵͳ���ݿⱻ�ƻ���ISP���Ӷ�ʧ��
  LOG_CRIT      = 2;      //��Ҫ�������Ӳ�̴��󣬱������Ӷ�ʧ��
  LOG_ERR       = 3;      //���󣬲��Ƿǳ���������һ��ʱ�����޸����ɡ�
  LOG_WARNING   = 4;      //������Ϣ�����Ǵ��󣬱���ϵͳ����ʹ����85%�ȡ�
  LOG_NOTICE    = 5;      //���Ǵ��������Ҳ����Ҫ��������
  LOG_INFO      = 6;      //�鱨��Ϣ��������ϵͳ��Ϣ������ɧ�ű��棬�������ݵȣ�����Ҫ����
  LOG_DEBUG     = 7;      //������ϸ�Ŀ����鱨����Ϣ��ͨ��ֻ�ڵ���һ������ʱʹ�á�
  LOG_MAX_LEVEL = 8;

type
  TLogger = class(TObject)
  Memolog: TMemo;
  private
    { Private declarations }
    FCSLock: TRTLCriticalSection;
    //Mutex: THandle;
    Logfile:THandle;
    LogfilePath: string;
    FileCursor:Integer;
    LogTable:array[0..LOG_MAX_LEVEL-1] of Boolean;
    Timeplus: TDateTime;
  public
    { Public declarations }
    constructor Create(Path:string=LOGFILE_PATH; Level:Integer=7);
    procedure log(Level:Integer; Msg: string);
    procedure debug(Msg: string);
    procedure info(Msg: string);
    procedure error(Msg: string='');
  end;

var
  Logger:TLogger;

implementation


constructor TLogger.Create(Path:string; Level:Integer);
var
  I:Integer;
begin
  inherited Create;
  Timeplus := 0;
  for I:=0 to LOG_MAX_LEVEL-1 do
  begin
    if I < Level then
    begin
      LogTable[I] := True;
    end
    else
    begin
      LogTable[I] := False;
    end;
  end;
  if Path = '' then Path := LOGFILE_PATH;
  LogfilePath := Path;
  InitializeCriticalSection(FCSLock);  
  //Mutex := CreateMutex(nil, False, LOGFILE_MUTEX_NAME);
  if not FileExists(Path) then
  begin
    Logfile := FileCreate(Path);
    FileClose(Logfile);
  end;
  Logfile := FileOpen(Path, fmOpenWrite or fmShareDenyWrite);
  FileCursor := FileSeek(Logfile, 0, 2);
end;

procedure TLogger.log(Level:Integer; Msg: string);
var
  MsgHeader:string;
  MsgBuffer:string;
  Retval : Integer;
  LastError:Cardinal;
  BufferLen:Integer;
begin
  if (Level < 0) or (Level > LOG_MAX_LEVEL-1) or (not LogTable[Level]) then Exit;
  case Level of
    LOG_EMERG  :MsgHeader:='EMERG';
    LOG_ALERT  :MsgHeader:='ALERT';
    LOG_CRIT   :MsgHeader:='CRIT';
    LOG_ERR    :MsgHeader:='ERR';
    LOG_WARNING:MsgHeader:='WARNING';
    LOG_NOTICE :MsgHeader:='NOTICE';
    LOG_INFO   :MsgHeader:='INFO';
    LOG_DEBUG  :MsgHeader:='DEBUG';
  end;
//  if not (WAIT_OBJECT_0 = WaitForSingleObject(Mutex, 100{INFINITE})) then
//  begin
//     Exit;
//  end;
  //WaitForSingleObject(Mutex, INFINITE);
  EnterCriticalSection(FCSLock);
  if FileCursor > LOGFILE_MAX_SIZE then
  begin
    //FileCursor := FileSeek(Logfile, 0, 0);
    FileClose(Logfile);
    if RenameFile(LogfilePath, LogfilePath+'.0.txt') then
    begin
      Logfile := FileOpen(LogfilePath, fmOpenWrite or fmShareDenyWrite);
      FileCursor := FileSeek(Logfile, 0, 2);
    end
    else
    begin
      Logfile := FileOpen(LogfilePath, fmOpenWrite or fmShareDenyWrite);
      FileCursor := FileSeek(Logfile, 0, 0);
    end;
  end;
  if Level = LOG_ERR then
  begin
    LastError := GetLastError;
    MsgHeader := MsgHeader + ' ' + IntToStr(LastError) + ' ' + SysErrorMessage(LastError);
  end;
  MsgBuffer := FormatDateTime('[yyyy-MM-dd HH:mm:ss.zzz]', Now()+Timeplus) + ' [' + MsgHeader + '] ' + Msg + #13#10;
  BufferLen := Length(MsgBuffer);
  if BufferLen > LOGFILE_LINE_MAX_SIZE then
  begin
    BufferLen := LOGFILE_LINE_MAX_SIZE;
  end;  
  Retval := FileWrite(Logfile, MsgBuffer[1], BufferLen);
  if Memolog <> nil then
  begin
    Memolog.Lines.Add(MsgBuffer);
  end;
  if Retval <> -1 then
  begin
    Inc(FileCursor, Retval);
    //FlushFileBuffers(Logfile);
  end;  
  //ReleaseMutex(Mutex);
  LeaveCriticalSection(FCSLock);
end;  

procedure TLogger.debug(Msg: string);
begin
  log(LOG_DEBUG, Msg);
end;

procedure TLogger.info(Msg: string);
begin
  log(LOG_INFO, Msg);
end;

procedure TLogger.error(Msg: string='');
begin
  log(LOG_ERR, Msg);
end;

//initialization
//  Logger := TLogger.Create(Application.ExeName + '.log', LOG_MAX_LEVEL);

//finalization
//  Logger.Free;

end.
