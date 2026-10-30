unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Imaging.pngimage;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

end.
