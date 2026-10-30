unit UnitCategorias;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.DBGrids, Data.DB, FireDAC.Comp.Client, UnitDMDB;

type
  TFormCategorias = class(TForm)
    Titulo: TLabel;
    LNome: TLabel;
    FNome: TDBEdit;
    BNova: TButton;
    BSalvar: TButton;
    BExcluir: TButton;
    Navigator: TDBNavigator;
    Grid: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure NovaCategoria(Sender: TObject);
    procedure SalvarCategoria(Sender: TObject);
    procedure ExcluirCategoria(Sender: TObject);
  private
    FCategorias: TFDTable;
    FCategoriasSource: TDataSource;
  public
    destructor Destroy; override;
  end;

var FormCategorias: TFormCategorias;

implementation

{$R *.dfm}

procedure TFormCategorias.FormCreate(Sender: TObject);
begin
  FCategorias := TFDTable.Create(Self);
  FCategorias.Connection := DMDB.DB;
  FCategorias.TableName := 'categorias';
  FCategorias.Active := True;
  FCategoriasSource := TDataSource.Create(Self);
  FCategoriasSource.DataSet := FCategorias;
  FNome.DataSource := FCategoriasSource;
  Navigator.DataSource := FCategoriasSource;
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
    FCategorias.FieldByName('id_usuario').AsInteger := UsuarioLogadoId;
  if FCategorias.State in dsEditModes then FCategorias.Post;
end;

procedure TFormCategorias.ExcluirCategoria(Sender: TObject);
begin
  if not FCategorias.IsEmpty then FCategorias.Delete;
end;

end.
