unit UnitCadastro;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Dialogs, FireDAC.Comp.Client, FireDAC.Stan.Param, UnitDMDB;

type
  TFormCadastro = class(TForm)
    Titulo: TLabel;
    LNome: TLabel;
    LEmail: TLabel;
    LSenha: TLabel;
    ENome: TEdit;
    EEmail: TEdit;
    ESenha: TEdit;
    BCadastrar: TButton;
    procedure Cadastrar(Sender: TObject);
  end;

var FormCadastro: TFormCadastro;

implementation

{$R *.dfm}

procedure TFormCadastro.Cadastrar(Sender: TObject);
var Consulta: TFDQuery;
begin
  if Trim(ENome.Text) = '' then
  begin ShowMessage('Informe seu nome.'); Exit; end;
  if Trim(EEmail.Text) = '' then
  begin ShowMessage('Informe seu e-mail.'); Exit; end;
  if ESenha.Text = '' then
  begin ShowMessage('Informe uma senha.'); Exit; end;

  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := DMDB.DB;
    Consulta.SQL.Text := 'INSERT INTO usuarios (nome, email, senha) ' +
      'VALUES (:nome, :email, :senha)';
    Consulta.ParamByName('nome').AsString := Trim(ENome.Text);
    Consulta.ParamByName('email').AsString := Trim(EEmail.Text);
    Consulta.ParamByName('senha').AsString := ESenha.Text;
    Consulta.ExecSQL;
    ShowMessage('Conta criada com sucesso.');
    Close;
  except
    on E: Exception do ShowMessage('Não foi possível criar a conta: ' + E.Message);
  end;
  Consulta.Free;
end;

end.
