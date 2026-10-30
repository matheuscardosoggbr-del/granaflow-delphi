unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Imaging.pngimage,
  UnitGastos, UnitReceitas, UnitPainel, UnitCategorias, UnitMetas, UnitRelatorios,
  UnitSalario, UnitRecorrentes, UnitGuardado;

type
  TPrincipal = class(TForm)
    SVAsider: TSplitView;
    CardPanel1: TCardPanel;
    CardPainel: TCard;
    CardGastos: TCard;
    CardReceitas: TCard;
    CardMetas: TCard;
    CardCategorias: TCard;
    CardRelatorios: TCard;
    CardSalario: TCard;
    CardRecorrentes: TCard;
    CardGuardado: TCard;
    Panel1: TPanel;
    Panel2: TPanel;
    DBEpesquisa: TDBEdit;
    LogoGranaflow: TLabel;
    ImgLogo: TImage;
    BtnGastos: TButton;
    BtnReceitas: TButton;
    BtnPainel: TButton;
    BtnCategorias: TButton;
    BtnMetas: TButton;
    BtnRelatorios: TButton;
    BtnSair: TButton;
    BtnSalario: TButton;
    BtnRecorrentes: TButton;
    BtnGuardado: TButton;
    procedure AbrirGastos(Sender: TObject);
    procedure AbrirReceitas(Sender: TObject);
    procedure AbrirPainel(Sender: TObject);
    procedure AbrirCategorias(Sender: TObject);
    procedure AbrirMetas(Sender: TObject);
    procedure AbrirRelatorios(Sender: TObject);
    procedure SairDoSistema(Sender: TObject);
    procedure AbrirSalario(Sender: TObject);
    procedure AbrirRecorrentes(Sender: TObject);
    procedure AbrirGuardado(Sender: TObject);
  private
    procedure MostrarTela(Tela: TForm; Cartao: TCard);
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

uses
  UnitLogin, UnitDMDB;

procedure TPrincipal.MostrarTela(Tela: TForm; Cartao: TCard);
begin
  Tela.Parent := Cartao;
  Tela.Align := alClient;
  Tela.BorderStyle := bsNone;
  Tela.Show;
  CardPanel1.ActiveCard := Cartao;
end;

procedure TPrincipal.AbrirGastos(Sender: TObject);
begin
  if not Assigned(FormGastos) then FormGastos := TFormGastos.Create(Application);
  MostrarTela(FormGastos, CardGastos);
end;

procedure TPrincipal.AbrirReceitas(Sender: TObject);
begin
  if not Assigned(FormReceitas) then FormReceitas := TFormReceitas.Create(Application);
  MostrarTela(FormReceitas, CardReceitas);
end;

procedure TPrincipal.AbrirPainel(Sender: TObject);
begin
  if not Assigned(FormPainel) then FormPainel := TFormPainel.Create(Application);
  MostrarTela(FormPainel, CardPainel);
end;

procedure TPrincipal.AbrirCategorias(Sender: TObject);
begin
  if not Assigned(FormCategorias) then FormCategorias := TFormCategorias.Create(Application);
  MostrarTela(FormCategorias, CardCategorias);
end;

procedure TPrincipal.AbrirMetas(Sender: TObject);
begin
  if not Assigned(FormMetas) then FormMetas := TFormMetas.Create(Application);
  MostrarTela(FormMetas, CardMetas);
end;

procedure TPrincipal.AbrirRelatorios(Sender: TObject);
begin
  if not Assigned(FormRelatorios) then FormRelatorios := TFormRelatorios.Create(Application);
  MostrarTela(FormRelatorios, CardRelatorios);
end;

procedure TPrincipal.SairDoSistema(Sender: TObject);
begin
  if Assigned(FormGastos) then FreeAndNil(FormGastos);
  if Assigned(FormReceitas) then FreeAndNil(FormReceitas);
  if Assigned(FormCategorias) then FreeAndNil(FormCategorias);
  if Assigned(FormMetas) then FreeAndNil(FormMetas);
  if Assigned(FormPainel) then FreeAndNil(FormPainel);
  if Assigned(FormRelatorios) then FreeAndNil(FormRelatorios);
  if Assigned(FormSalario) then FreeAndNil(FormSalario);
  if Assigned(FormRecorrentes) then FreeAndNil(FormRecorrentes);
  if Assigned(FormGuardado) then FreeAndNil(FormGuardado);
  UsuarioLogadoId := 0;
  Hide;
  Login.EEmail.Clear;
  Login.Esenha.Clear;
  Login.Show;
end;

procedure TPrincipal.AbrirSalario(Sender: TObject);
begin
  if not Assigned(FormSalario) then FormSalario := TFormSalario.Create(Application);
  MostrarTela(FormSalario, CardSalario);
end;

procedure TPrincipal.AbrirRecorrentes(Sender: TObject);
begin
  if not Assigned(FormRecorrentes) then FormRecorrentes := TFormRecorrentes.Create(Application);
  MostrarTela(FormRecorrentes, CardRecorrentes);
end;

procedure TPrincipal.AbrirGuardado(Sender: TObject);
begin
  if not Assigned(FormGuardado) then FormGuardado := TFormGuardado.Create(Application);
  MostrarTela(FormGuardado, CardGuardado);
end;

end.
