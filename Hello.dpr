program Hello;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitLogger in 'UnitLogger.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
