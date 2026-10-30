unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Data.DB, FireDAC.Stan.Param, UnitDMDB, UnitPrincipal,
  UnitCadastro;

type
  TLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Titulo1: TLabel;
    Titulo2: TLabel;
    Titulo3: TLabel;
    LogoGranaflow: TLabel;
    ImgLogo: TImage;
    Lemail: TLabel;
    EEmail: TEdit;
    Label1: TLabel;
    Esenha: TEdit;
    Mdescribe: TMemo;
    LLogin: TLabel;
    Bentrar: TButton;
    BCriarConta: TButton;
    procedure BentrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CriarConta(Sender: TObject);
  end;

var
  Login: TLogin;

implementation

{$R *.dfm}

procedure TLogin.CriarConta(Sender: TObject);
begin
  if not Assigned(FormCadastro) then
    FormCadastro := TFormCadastro.Create(Application);
  FormCadastro.ShowModal;
end;

procedure TLogin.BentrarClick(Sender: TObject);
var
  Senha, Email: string;
begin
  Email := Trim(EEmail.Text);
  Senha := Esenha.Text;
  if Email = '' then
  begin
    ShowMessage('Informe o e-mail.');
    EEmail.SetFocus;
    Exit;
  end;
  if Senha = '' then
  begin
    ShowMessage('Informe a senha.');
    Esenha.SetFocus;
    Exit;
  end;
  try
    DMDB.Qusuarios.Close;
    DMDB.Qusuarios.ParamByName('pEmail').AsString := Email;
    DMDB.Qusuarios.Open;
    if DMDB.Qusuarios.IsEmpty then
    begin
      ShowMessage('E-mail nao encontrado.');
      Exit;
    end;
    if DMDB.Qusuarios.FieldByName('senha').AsString <> Senha then
    begin
      ShowMessage('Senha incorreta.');
      Esenha.SetFocus;
      Exit;
    end;
    UsuarioLogadoId := DMDB.Qusuarios.FieldByName('id_usuario').AsInteger;
    Hide;
    Principal.Show;
  except
    on E: Exception do
      ShowMessage('Nao foi possivel entrar: ' + E.Message);
  end;
end;

procedure TLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

end.
