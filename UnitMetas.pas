unit UnitMetas;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.DBGrids, Data.DB, FireDAC.Comp.Client, UnitDMDB;

type
  TFormMetas = class(TForm)
    Titulo: TLabel;
    LDescricao: TLabel;
    LValor: TLabel;
    LGuardado: TLabel;
    LData: TLabel;
    FDescricao: TDBEdit;
    FValor: TDBEdit;
    FGuardado: TDBEdit;
    FData: TDBEdit;
    BNova: TButton;
    BSalvar: TButton;
    BExcluir: TButton;
    Navigator: TDBNavigator;
    Grid: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure NovaMeta(Sender: TObject);
    procedure SalvarMeta(Sender: TObject);
    procedure ExcluirMeta(Sender: TObject);
  private
    FMetas: TFDTable;
    FSource: TDataSource;
  public
    destructor Destroy; override;
  end;

var FormMetas: TFormMetas;

implementation

{$R *.dfm}

procedure TFormMetas.FormCreate(Sender: TObject);
begin
  FMetas := TFDTable.Create(Self);
  FMetas.Connection := DMDB.DB;
  FMetas.TableName := 'metas';
  FMetas.Active := True;
  FSource := TDataSource.Create(Self);
  FSource.DataSet := FMetas;
  FDescricao.DataSource := FSource;
  FValor.DataSource := FSource;
  FGuardado.DataSource := FSource;
  FData.DataSource := FSource;
  Navigator.DataSource := FSource;
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
  if FMetas.State in dsEditModes then FMetas.Post;
end;

procedure TFormMetas.ExcluirMeta(Sender: TObject);
begin
  if not FMetas.IsEmpty then FMetas.Delete;
end;

end.
