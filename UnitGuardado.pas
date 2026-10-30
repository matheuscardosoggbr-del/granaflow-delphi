unit UnitGuardado;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.DBGrids, Data.DB, FireDAC.Comp.Client, UnitDMDB;

type
  TFormGuardado = class(TForm)
    Titulo: TLabel;
    LDescricao: TLabel;
    LValor: TLabel;
    FDescricao: TDBEdit;
    FValor: TDBEdit;
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

var FormGuardado: TFormGuardado;

implementation

{$R *.dfm}

procedure TFormGuardado.FormCreate(Sender: TObject);
begin
  FTabela := TFDTable.Create(Self);
  FTabela.Connection := DMDB.DB;
  FTabela.TableName := 'dinheiro_guardado';
  FTabela.Active := True;
  FSource := TDataSource.Create(Self);
  FSource.DataSet := FTabela;
  FDescricao.DataSource := FSource;
  FValor.DataSource := FSource;
  Navigator.DataSource := FSource;
  Grid.DataSource := FSource;
  FTabela.Filter := 'id_usuario = ' + IntToStr(UsuarioLogadoId);
  FTabela.Filtered := UsuarioLogadoId > 0;
end;

destructor TFormGuardado.Destroy;
begin
  FSource.DataSet := nil;
  FTabela.Close;
  inherited Destroy;
end;

procedure TFormGuardado.Novo(Sender: TObject);
begin
  FTabela.Append;
  FTabela.FieldByName('id_usuario').AsInteger := UsuarioLogadoId;
  FTabela.FieldByName('data_registro').AsDateTime := Now;
end;

procedure TFormGuardado.Salvar(Sender: TObject);
begin
  if FTabela.State in dsEditModes then FTabela.Post;
end;

procedure TFormGuardado.Excluir(Sender: TObject);
begin
  if not FTabela.IsEmpty then FTabela.Delete;
end;

end.
