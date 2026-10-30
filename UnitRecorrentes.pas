unit UnitRecorrentes;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Graphics, Vcl.DBCtrls, Vcl.DBGrids, Data.DB, FireDAC.Comp.Client,
  UnitDMDB;

type
  TFormRecorrentes = class(TForm)
  private
    FTabela: TFDTable;
    FSource: TDataSource;
    FDescricao, FValor, FDia: TDBEdit;
    procedure Novo(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Excluir(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FormRecorrentes: TFormRecorrentes;

implementation

constructor TFormRecorrentes.Create(AOwner: TComponent);
var
  Titulo, LDescricao, LValor, LDia: TLabel;
  BNovo, BSalvar, BExcluir: TButton;
  Grid: TDBGrid;
  Navigator: TDBNavigator;
begin
  inherited Create(AOwner);
  Caption := 'GranaFlow - Gastos recorrentes';
  Width := 850;
  Height := 520;
  Position := poScreenCenter;

  FTabela := TFDTable.Create(Self);
  FTabela.Connection := DMDB.DB;
  FTabela.TableName := 'gastos_recorrentes';
  FTabela.Active := True;

  FSource := TDataSource.Create(Self);
  FSource.DataSet := FTabela;

  Titulo := TLabel.Create(Self);
  Titulo.Parent := Self;
  Titulo.SetBounds(16, 16, 600, 35);
  Titulo.Caption := 'Gastos recorrentes';
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
  FDescricao.DataField := 'descricao';

  LValor := TLabel.Create(Self);
  LValor.Parent := Self;
  LValor.SetBounds(292, 58, 100, 20);
  LValor.Caption := 'Valor';
  FValor := TDBEdit.Create(Self);
  FValor.Parent := Self;
  FValor.SetBounds(292, 78, 120, 24);
  FValor.DataSource := FSource;
  FValor.DataField := 'valor';

  LDia := TLabel.Create(Self);
  LDia.Parent := Self;
  LDia.SetBounds(428, 58, 120, 20);
  LDia.Caption := 'Dia de vencimento';
  FDia := TDBEdit.Create(Self);
  FDia.Parent := Self;
  FDia.SetBounds(428, 78, 120, 24);
  FDia.DataSource := FSource;
  FDia.DataField := 'dia_vencimento';

  BNovo := TButton.Create(Self);
  BNovo.Parent := Self;
  BNovo.SetBounds(565, 76, 80, 28);
  BNovo.Caption := 'Novo';
  BNovo.OnClick := Novo;
  BSalvar := TButton.Create(Self);
  BSalvar.Parent := Self;
  BSalvar.SetBounds(651, 76, 80, 28);
  BSalvar.Caption := 'Salvar';
  BSalvar.OnClick := Salvar;
  BExcluir := TButton.Create(Self);
  BExcluir.Parent := Self;
  BExcluir.SetBounds(737, 76, 80, 28);
  BExcluir.Caption := 'Excluir';
  BExcluir.OnClick := Excluir;

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
  if FTabela.State in dsEditModes then
    FTabela.Post;
end;

procedure TFormRecorrentes.Excluir(Sender: TObject);
begin
  if not FTabela.IsEmpty then
    FTabela.Delete;
end;

end.
