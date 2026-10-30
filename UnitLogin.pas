unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
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
  private
    { Private declarations }
  public
    { Public declarations }
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
    senha, Email: string;
begin
  senha:= Esenha.Text;
  Email:= EEmail.Text;

    DMDB.Qusuarios.Close;
    DMDB.Qusuarios.ParamByName('pEmail').AsString := trim(EEmail.Text);
    DMDB.Qusuarios.Open;

      if not (DMDB.Qusuarios.IsEmpty) then
      begin
        if DMDB.Qusuarios.FieldByName('senha').AsString = senha then
        begin
          UsuarioLogadoId := DMDB.Qusuarios.FieldByName('id_usuario').AsInteger;
          { Esconde o login e mostra o sistema após a autenticação. }
          Hide;
          Principal.Show;
        end
        else
        begin
          Showmessage('Senha Incorreta!'#13'Tente novamente');
        end;
      end
      else
      begin
        Showmessage('EMAIL Incorreto!'#13'Digite um Email Valido');
      end;

end;

procedure TLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:= caFree;

  if Assigned(principal) then
    Principal.Show;
end;

end.
