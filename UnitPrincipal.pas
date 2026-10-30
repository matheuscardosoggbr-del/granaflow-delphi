unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Imaging.pngimage,
  UnitGastos, UnitReceitas, UnitPainel;

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
    procedure AbrirGastos(Sender: TObject);
    procedure AbrirReceitas(Sender: TObject);
    procedure AbrirPainel(Sender: TObject);
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

end.
