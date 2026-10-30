unit UnitRecorrentes;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.DBGrids, Data.DB, FireDAC.Comp.Client, UnitDMDB;

type
  TFormRecorrentes = class(TForm)
    Titulo: TLabel;
    LDescricao: TLabel;
    LValor: TLabel;
    LDia: TLabel;
    FDescricao: TDBEdit;
    FValor: TDBEdit;
    FDia: TDBEdit;
    BNovo: TButton;
    BSalvar: TButton;
    BExcluir: TButton;
    Navigator: TDBNavigator;
    Grid: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure Novo(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Excluir(Sender: TObject);
  private
    FTabela: TFDTable;
    FSource: TDataSource;
  public
    destructor Destroy; override;
  end;

var FormRecorrentes: TFormRecorrentes;

implementation

{$R *.dfm}

procedure TFormRecorrentes.FormCreate(Sender: TObject);
begin
  FTabela := TFDTable.Create(Self);
  FTabela.Connection := DMDB.DB;
  FTabela.TableName := 'gastos_recorrentes';
  FTabela.Active := True;
  FSource := TDataSource.Create(Self);
  FSource.DataSet := FTabela;
  FDescricao.DataSource := FSource;
  FValor.DataSource := FSource;
  FDia.DataSource := FSource;
  Navigator.DataSource := FSource;
  Grid.DataSource := FSource;
  FTabela.Filter := 'id_usuario = ' + IntToStr(UsuarioLogadoId);
  FTabela.Filtered := UsuarioLogadoId > 0;
end;

destructor TFormRecorrentes.Destroy;
begin
  FSource.DataSet := nil;
  FTabela.Close;
  inherited Destroy;
end;

procedure TFormRecorrentes.Novo(Sender: TObject);
begin
  FTabela.Append;
  FTabela.FieldByName('id_usuario').AsInteger := UsuarioLogadoId;
  FTabela.FieldByName('tipo').AsString := 'mensal';
  FTabela.FieldByName('ativo').AsBoolean := True;
end;

procedure TFormRecorrentes.Salvar(Sender: TObject);
begin
  if FTabela.State in dsEditModes then FTabela.Post;
end;

procedure TFormRecorrentes.Excluir(Sender: TObject);
begin
  if not FTabela.IsEmpty then FTabela.Delete;
end;

end.
