program Granaflow;

uses
  Vcl.Forms,
  UnitDMDB in 'UnitDMDB.pas' {DMDB: TDataModule},
  UnitPrincipal in 'UnitPrincipal.pas' {Principal},
  UnitLogin in 'UnitLogin.pas' {Login};


{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMDB, DMDB);
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TLogin, Login);
  Application.Run;
end.
