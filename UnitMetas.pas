unit UnitMetas;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Graphics, Vcl.DBCtrls, Vcl.DBGrids, Data.DB, FireDAC.Comp.Client,
  UnitDMDB;

type
  TFormMetas = class(TForm)
  private
    FMetas: TFDTable;
    FSource: TDataSource;
    FDescricao, FValor, FData: TDBEdit;
    procedure NovaMeta(Sender: TObject);
    procedure SalvarMeta(Sender: TObject);
    procedure ExcluirMeta(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FormMetas: TFormMetas;

implementation

constructor TFormMetas.Create(AOwner: TComponent);
var
  Titulo, LDescricao, LValor, LData: TLabel;
  BNova, BSalvar, BExcluir: TButton;
  Grid: TDBGrid;
  Navigator: TDBNavigator;
begin
  inherited Create(AOwner);
  Caption := 'GranaFlow - Metas';
  Width := 850;
  Height := 520;
  Position := poScreenCenter;

  FMetas := TFDTable.Create(Self);
  FMetas.Connection := DMDB.DB;
  FMetas.TableName := 'metas';
  FMetas.Active := True;

  FSource := TDataSource.Create(Self);
  FSource.DataSet := FMetas;

  Titulo := TLabel.Create(Self);
  Titulo.Parent := Self;
  Titulo.SetBounds(16, 16, 500, 35);
  Titulo.Caption := 'Minhas metas';
  Titulo.Font.Size := 18;
  Titulo.Font.Style := [fsBold];

  LDescricao := TLabel.Create(Self);
  LDescricao.Parent := Self;
  LDescricao.SetBounds(16, 58, 100, 20);
  LDescricao.Caption := 'Descrição';
  FDescricao := TDBEdit.Create(Self);
  FDescricao.Parent := Self;
  FDescricao.SetBounds(16, 78, 260, 24);
  FDescricao.DataSource := FSource;
  FDescricao.DataField := 'nome_meta';

  LValor := TLabel.Create(Self);
  LValor.Parent := Self;
  LValor.SetBounds(292, 58, 100, 20);
  LValor.Caption := 'Valor';
  FValor := TDBEdit.Create(Self);
  FValor.Parent := Self;
  FValor.SetBounds(292, 78, 120, 24);
  FValor.DataSource := FSource;
  FValor.DataField := 'valor_limite';

  LData := TLabel.Create(Self);
  LData.Parent := Self;
  LData.SetBounds(428, 58, 120, 20);
  LData.Caption := 'Data limite';
  FData := TDBEdit.Create(Self);
  FData.Parent := Self;
  FData.SetBounds(428, 78, 120, 24);
  FData.DataSource := FSource;
  FData.DataField := 'data_fim';

  BNova := TButton.Create(Self);
  BNova.Parent := Self;
  BNova.SetBounds(565, 76, 80, 28);
  BNova.Caption := 'Nova';
  BNova.OnClick := NovaMeta;
  BSalvar := TButton.Create(Self);
  BSalvar.Parent := Self;
  BSalvar.SetBounds(651, 76, 80, 28);
  BSalvar.Caption := 'Salvar';
  BSalvar.OnClick := SalvarMeta;
  BExcluir := TButton.Create(Self);
  BExcluir.Parent := Self;
  BExcluir.SetBounds(737, 76, 80, 28);
  BExcluir.Caption := 'Excluir';
  BExcluir.OnClick := ExcluirMeta;

  Navigator := TDBNavigator.Create(Self);
  Navigator.Parent := Self;
  Navigator.SetBounds(16, 115, 240, 25);
  Navigator.DataSource := FSource;
  Navigator.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast];

  Grid := TDBGrid.Create(Self);
  Grid.Parent := Self;
  Grid.SetBounds(16, 155, 801, 300);
  Grid.Anchors := [akLeft, akTop, akRight, akBottom];
  Grid.DataSource := FSource;

  FMetas.Filter := 'id_usuario = ' + IntToStr(UsuarioLogadoId);
  FMetas.Filtered := UsuarioLogadoId > 0;
end;

destructor TFormMetas.Destroy;
begin
  FSource.DataSet := nil;
  FMetas.Close;
  inherited Destroy;
end;

procedure TFormMetas.NovaMeta(Sender: TObject);
begin
  FMetas.Append;
  FMetas.FieldByName('id_usuario').AsInteger := UsuarioLogadoId;
  FMetas.FieldByName('data_inicio').AsDateTime := Date;
  FMetas.FieldByName('data_fim').AsDateTime := Date;
end;

procedure TFormMetas.SalvarMeta(Sender: TObject);
begin
  if FMetas.State in dsEditModes then
    FMetas.Post;
end;

procedure TFormMetas.ExcluirMeta(Sender: TObject);
begin
  if not FMetas.IsEmpty then
    FMetas.Delete;
end;

end.
