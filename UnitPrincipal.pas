unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Imaging.pngimage,
  UnitGastos;

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
    procedure AbrirGastos(Sender: TObject);
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
end;

procedure TPrincipal.AbrirGastos(Sender: TObject);
begin
  if not Assigned(FormGastos) then
    FormGastos := TFormGastos.Create(Application);
  FormGastos.Show;
end;

end.
