unit UnitCategorias;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Graphics, Vcl.DBCtrls, Vcl.DBGrids, Data.DB, FireDAC.Comp.Client,
  UnitDMDB;

type
  TFormCategorias = class(TForm)
  private
    FCategorias: TFDTable;
    FCategoriasSource: TDataSource;
    FNome: TDBEdit;
    procedure NovaCategoria(Sender: TObject);
    procedure SalvarCategoria(Sender: TObject);
    procedure ExcluirCategoria(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FormCategorias: TFormCategorias;

implementation

constructor TFormCategorias.Create(AOwner: TComponent);
var
  Titulo, LNome: TLabel;
  BNova, BSalvar, BExcluir: TButton;
  Grid: TDBGrid;
  Navigator: TDBNavigator;
begin
  inherited Create(AOwner);

  Caption := 'GranaFlow - Categorias';
  Width := 650;
  Height := 450;
  Position := poScreenCenter;

  FCategorias := TFDTable.Create(Self);
  FCategorias.Connection := DMDB.DB;
  FCategorias.TableName := 'categorias';
  FCategorias.Active := True;

  FCategoriasSource := TDataSource.Create(Self);
  FCategoriasSource.DataSet := FCategorias;

  Titulo := TLabel.Create(Self);
  Titulo.Parent := Self;
  Titulo.SetBounds(16, 16, 500, 35);
  Titulo.Caption := 'Categorias de gastos';
  Titulo.Font.Size := 18;
  Titulo.Font.Style := [fsBold];

  LNome := TLabel.Create(Self);
  LNome.Parent := Self;
  LNome.SetBounds(16, 65, 100, 20);
  LNome.Caption := 'Nome';

  FNome := TDBEdit.Create(Self);
  FNome.Parent := Self;
  FNome.SetBounds(16, 86, 260, 24);
  FNome.DataSource := FCategoriasSource;
  FNome.DataField := 'nome';

  BNova := TButton.Create(Self);
  BNova.Parent := Self;
  BNova.SetBounds(300, 84, 90, 28);
  BNova.Caption := 'Nova';
  BNova.OnClick := NovaCategoria;

  BSalvar := TButton.Create(Self);
  BSalvar.Parent := Self;
  BSalvar.SetBounds(396, 84, 90, 28);
  BSalvar.Caption := 'Salvar';
  BSalvar.OnClick := SalvarCategoria;

  BExcluir := TButton.Create(Self);
  BExcluir.Parent := Self;
  BExcluir.SetBounds(492, 84, 90, 28);
  BExcluir.Caption := 'Excluir';
  BExcluir.OnClick := ExcluirCategoria;

  Navigator := TDBNavigator.Create(Self);
  Navigator.Parent := Self;
  Navigator.SetBounds(16, 125, 240, 25);
  Navigator.DataSource := FCategoriasSource;
  Navigator.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast];

  Grid := TDBGrid.Create(Self);
  Grid.Parent := Self;
  Grid.SetBounds(16, 165, 566, 230);
  Grid.Anchors := [akLeft, akTop, akRight, akBottom];
  Grid.DataSource := FCategoriasSource;

  FCategorias.Filter := '(id_usuario IS NULL) OR (id_usuario = ' +
    IntToStr(UsuarioLogadoId) + ')';
  FCategorias.Filtered := UsuarioLogadoId > 0;
end;

destructor TFormCategorias.Destroy;
begin
  FCategoriasSource.DataSet := nil;
  FCategorias.Close;
  inherited Destroy;
end;

procedure TFormCategorias.NovaCategoria(Sender: TObject);
begin
  FCategorias.Append;
  FCategorias.FieldByName('id_tipo').AsInteger := 2;
  FCategorias.FieldByName('id_usuario').AsInteger := UsuarioLogadoId;
end;

procedure TFormCategorias.SalvarCategoria(Sender: TObject);
begin
  if FCategorias.State in dsEditModes then
    FCategorias.Post;
end;

procedure TFormCategorias.ExcluirCategoria(Sender: TObject);
begin
  if not FCategorias.IsEmpty then
    FCategorias.Delete;
end;

end.
