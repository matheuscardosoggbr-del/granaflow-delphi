program Granaflow;

uses
  Vcl.Forms,
  UnitDMDB in 'UnitDMDB.pas' {DMDB: TDataModule},
  UnitPrincipal in 'UnitPrincipal.pas' {Principal},
  UnitLogin in 'UnitLogin.pas' {Login},
  UnitGastos in 'UnitGastos.pas' {FormGastos},
  UnitReceitas in 'UnitReceitas.pas' {FormReceitas},
  UnitPainel in 'UnitPainel.pas' {FormPainel},
  UnitCategorias in 'UnitCategorias.pas' {FormCategorias},
  UnitMetas in 'UnitMetas.pas' {FormMetas},
  UnitRelatorios in 'UnitRelatorios.pas' {FormRelatorios},
  UnitCadastro in 'UnitCadastro.pas',
  UnitSalario in 'UnitSalario.pas' {FormSalario},
  UnitRecorrentes in 'UnitRecorrentes.pas',
  UnitGuardado in 'UnitGuardado.pas' {FormGuardado};


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
