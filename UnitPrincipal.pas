unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Imaging.pngimage,
  UnitGastos, UnitReceitas, UnitPainel, UnitCategorias, UnitMetas, UnitRelatorios,
  UnitSalario, UnitRecorrentes;

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
    procedure AbrirGastos(Sender: TObject);
    procedure AbrirReceitas(Sender: TObject);
    procedure AbrirPainel(Sender: TObject);
    procedure AbrirCategorias(Sender: TObject);
    procedure AbrirMetas(Sender: TObject);
    procedure AbrirRelatorios(Sender: TObject);
    procedure SairDoSistema(Sender: TObject);
    procedure AbrirSalario(Sender: TObject);
    procedure AbrirRecorrentes(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

uses
  UnitLogin, UnitDMDB;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
  BtnGastos := TButton.Create(Self);
  BtnGastos.Parent := Panel2;
  BtnGastos.Align := alTop;
  BtnGastos.Height := 38;
  BtnGastos.Caption := 'Gastos';
  BtnGastos.OnClick := AbrirGastos;

  BtnReceitas := TButton.Create(Self);
  BtnReceitas.Parent := Panel2;
  BtnReceitas.Align := alTop;
  BtnReceitas.Height := 38;
  BtnReceitas.Caption := 'Receitas';
  BtnReceitas.OnClick := AbrirReceitas;

  BtnPainel := TButton.Create(Self);
  BtnPainel.Parent := Panel2;
  BtnPainel.Align := alTop;
  BtnPainel.Height := 38;
  BtnPainel.Caption := 'Painel';
  BtnPainel.OnClick := AbrirPainel;

  BtnCategorias := TButton.Create(Self);
  BtnCategorias.Parent := Panel2;
  BtnCategorias.Align := alTop;
  BtnCategorias.Height := 38;
  BtnCategorias.Caption := 'Categorias';
  BtnCategorias.OnClick := AbrirCategorias;

  BtnMetas := TButton.Create(Self);
  BtnMetas.Parent := Panel2;
  BtnMetas.Align := alTop;
  BtnMetas.Height := 38;
  BtnMetas.Caption := 'Metas';
  BtnMetas.OnClick := AbrirMetas;

  BtnRelatorios := TButton.Create(Self);
  BtnRelatorios.Parent := Panel2;
  BtnRelatorios.Align := alTop;
  BtnRelatorios.Height := 38;
  BtnRelatorios.Caption := 'Relatórios';
  BtnRelatorios.OnClick := AbrirRelatorios;

  BtnSair := TButton.Create(Self);
  BtnSair.Parent := Panel2;
  BtnSair.Align := alBottom;
  BtnSair.Height := 38;
  BtnSair.Caption := 'Sair';
  BtnSair.OnClick := SairDoSistema;

  BtnSalario := TButton.Create(Self);
  BtnSalario.Parent := Panel2;
  BtnSalario.Align := alTop;
  BtnSalario.Height := 38;
  BtnSalario.Caption := 'Salário';
  BtnSalario.OnClick := AbrirSalario;

  BtnRecorrentes := TButton.Create(Self);
  BtnRecorrentes.Parent := Panel2;
  BtnRecorrentes.Align := alTop;
  BtnRecorrentes.Height := 38;
  BtnRecorrentes.Caption := 'Gastos recorrentes';
  BtnRecorrentes.OnClick := AbrirRecorrentes;
end;

procedure TPrincipal.AbrirGastos(Sender: TObject);
begin
  if not Assigned(FormGastos) then
    FormGastos := TFormGastos.Create(Application);
  FormGastos.Show;
end;

procedure TPrincipal.AbrirReceitas(Sender: TObject);
begin
  if not Assigned(FormReceitas) then
    FormReceitas := TFormReceitas.Create(Application);
  FormReceitas.Show;
end;

procedure TPrincipal.AbrirPainel(Sender: TObject);
begin
  if not Assigned(FormPainel) then
    FormPainel := TFormPainel.Create(Application);
  FormPainel.Show;
end;

procedure TPrincipal.AbrirCategorias(Sender: TObject);
begin
  if not Assigned(FormCategorias) then
    FormCategorias := TFormCategorias.Create(Application);
  FormCategorias.Show;
end;

procedure TPrincipal.AbrirMetas(Sender: TObject);
begin
  if not Assigned(FormMetas) then
    FormMetas := TFormMetas.Create(Application);
  FormMetas.Show;
end;

procedure TPrincipal.AbrirRelatorios(Sender: TObject);
begin
  if not Assigned(FormRelatorios) then
    FormRelatorios := TFormRelatorios.Create(Application);
  FormRelatorios.Show;
end;

procedure TPrincipal.SairDoSistema(Sender: TObject);
begin
  if Assigned(FormGastos) then
    FreeAndNil(FormGastos);
  if Assigned(FormReceitas) then
    FreeAndNil(FormReceitas);
  if Assigned(FormCategorias) then
    FreeAndNil(FormCategorias);
  if Assigned(FormMetas) then
    FreeAndNil(FormMetas);
  if Assigned(FormPainel) then
    FreeAndNil(FormPainel);
  if Assigned(FormRelatorios) then
    FreeAndNil(FormRelatorios);
  if Assigned(FormSalario) then
    FreeAndNil(FormSalario);
  if Assigned(FormRecorrentes) then
    FreeAndNil(FormRecorrentes);

  UsuarioLogadoId := 0;
  Hide;
  Login.EEmail.Clear;
  Login.Esenha.Clear;
  Login.Show;
end;

procedure TPrincipal.AbrirSalario(Sender: TObject);
begin
  if not Assigned(FormSalario) then
    FormSalario := TFormSalario.Create(Application);
  FormSalario.Show;
end;

procedure TPrincipal.AbrirRecorrentes(Sender: TObject);
begin
  if not Assigned(FormRecorrentes) then
    FormRecorrentes := TFormRecorrentes.Create(Application);
  FormRecorrentes.Show;
end;

end.
