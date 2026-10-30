program Granaflow;

uses
  Vcl.Forms,
  UnitDMDB in 'UnitDMDB.pas' {DMDB: TDataModule},
  UnitPrincipal in 'UnitPrincipal.pas' {Principal},
  UnitLogin in 'UnitLogin.pas' {Login},
  UnitGastos in 'UnitGastos.pas' {FormGastos},
  UnitReceitas in 'UnitReceitas.pas' {FormReceitas},
  UnitPainel in 'UnitPainel.pas' {FormPainel},
  UnitCategorias in 'UnitCategorias.pas',
  UnitMetas in 'UnitMetas.pas',
  UnitRelatorios in 'UnitRelatorios.pas',
  UnitCadastro in 'UnitCadastro.pas',
  UnitSalario in 'UnitSalario.pas',
  UnitRecorrentes in 'UnitRecorrentes.pas',
  UnitGuardado in 'UnitGuardado.pas';


{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMDB, DMDB);
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TLogin, Login);

  { O usuário deve começar pela tela de login. }
  Principal.Hide;
  Login.Show;

  Application.Run;
end.
