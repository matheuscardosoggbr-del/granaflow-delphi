unit UnitCadastro;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Dialogs,
  Vcl.Graphics, FireDAC.Comp.Client, FireDAC.Stan.Param, UnitDMDB;

type
  TFormCadastro = class(TForm)
  private
    ENome, EEmail, ESenha: TEdit;
    procedure Cadastrar(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FormCadastro: TFormCadastro;

implementation

constructor TFormCadastro.Create(AOwner: TComponent);
var
  Titulo, LNome, LEmail, LSenha: TLabel;
  BCadastrar: TButton;
begin
  inherited Create(AOwner);
  Caption := 'GranaFlow - Criar conta';
  Width := 380;
  Height := 330;
  Position := poScreenCenter;

  Titulo := TLabel.Create(Self);
  Titulo.Parent := Self;
  Titulo.SetBounds(30, 24, 300, 32);
  Titulo.Caption := 'Criar uma conta';
  Titulo.Font.Size := 18;
  Titulo.Font.Style := [fsBold];

  LNome := TLabel.Create(Self);
  LNome.Parent := Self;
  LNome.SetBounds(30, 78, 100, 20);
  LNome.Caption := 'Nome';
  ENome := TEdit.Create(Self);
  ENome.Parent := Self;
  ENome.SetBounds(30, 99, 300, 24);

  LEmail := TLabel.Create(Self);
  LEmail.Parent := Self;
  LEmail.SetBounds(30, 132, 100, 20);
  LEmail.Caption := 'E-mail';
  EEmail := TEdit.Create(Self);
  EEmail.Parent := Self;
  EEmail.SetBounds(30, 153, 300, 24);

  LSenha := TLabel.Create(Self);
  LSenha.Parent := Self;
  LSenha.SetBounds(30, 186, 100, 20);
  LSenha.Caption := 'Senha';
  ESenha := TEdit.Create(Self);
  ESenha.Parent := Self;
  ESenha.SetBounds(30, 207, 300, 24);
  ESenha.PasswordChar := '*';

  BCadastrar := TButton.Create(Self);
  BCadastrar.Parent := Self;
  BCadastrar.SetBounds(30, 250, 300, 32);
  BCadastrar.Caption := 'Cadastrar';
  BCadastrar.OnClick := Cadastrar;
end;

procedure TFormCadastro.Cadastrar(Sender: TObject);
var
  Consulta: TFDQuery;
begin
  if Trim(ENome.Text) = '' then
  begin
    ShowMessage('Informe seu nome.');
    Exit;
  end;

  if Trim(EEmail.Text) = '' then
  begin
    ShowMessage('Informe seu e-mail.');
    Exit;
  end;

  if ESenha.Text = '' then
  begin
    ShowMessage('Informe uma senha.');
    Exit;
  end;

  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := DMDB.DB;
    Consulta.SQL.Text :=
      'INSERT INTO usuarios (nome, email, senha) ' +
      'VALUES (:nome, :email, :senha)';
    Consulta.ParamByName('nome').AsString := Trim(ENome.Text);
    Consulta.ParamByName('email').AsString := Trim(EEmail.Text);
    Consulta.ParamByName('senha').AsString := ESenha.Text;
    Consulta.ExecSQL;
    ShowMessage('Conta criada com sucesso.');
    Close;
  except
    on E: Exception do
      ShowMessage('Não foi possível criar a conta: ' + E.Message);
  end;
  Consulta.Free;
end;

end.
