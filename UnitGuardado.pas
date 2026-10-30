unit UnitGuardado;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Graphics, Vcl.DBCtrls, Vcl.DBGrids, Data.DB, FireDAC.Comp.Client,
  UnitDMDB;

type
  TFormGuardado = class(TForm)
  private
    FTabela: TFDTable;
    FSource: TDataSource;
    FDescricao, FValor: TDBEdit;
    procedure Novo(Sender: TObject);
    procedure Salvar(Sender: TObject);
    procedure Excluir(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FormGuardado: TFormGuardado;

implementation

constructor TFormGuardado.Create(AOwner: TComponent);
var
  Titulo, LDescricao, LValor: TLabel;
  BNovo, BSalvar, BExcluir: TButton;
  Grid: TDBGrid;
  Navigator: TDBNavigator;
begin
  inherited CreateNew(AOwner);
  Caption := 'GranaFlow - Dinheiro guardado';
  Width := 760;
  Height := 500;
  Position := poScreenCenter;

  FTabela := TFDTable.Create(Self);
  FTabela.Connection := DMDB.DB;
  FTabela.TableName := 'dinheiro_guardado';
  FTabela.Active := True;

  FSource := TDataSource.Create(Self);
  FSource.DataSet := FTabela;

  Titulo := TLabel.Create(Self);
  Titulo.Parent := Self;
  Titulo.SetBounds(16, 16, 600, 35);
  Titulo.Caption := 'Dinheiro guardado';
  Titulo.Font.Size := 18;
  Titulo.Font.Style := [fsBold];

  LDescricao := TLabel.Create(Self);
  LDescricao.Parent := Self;
  LDescricao.SetBounds(16, 58, 100, 20);
  LDescricao.Caption := 'Descrição';
  FDescricao := TDBEdit.Create(Self);
  FDescricao.Parent := Self;
  FDescricao.SetBounds(16, 78, 300, 24);
  FDescricao.DataSource := FSource;
  FDescricao.DataField := 'descricao';

  LValor := TLabel.Create(Self);
  LValor.Parent := Self;
  LValor.SetBounds(332, 58, 100, 20);
  LValor.Caption := 'Valor';
  FValor := TDBEdit.Create(Self);
  FValor.Parent := Self;
  FValor.SetBounds(332, 78, 140, 24);
  FValor.DataSource := FSource;
  FValor.DataField := 'valor';

  BNovo := TButton.Create(Self);
  BNovo.Parent := Self;
  BNovo.SetBounds(490, 76, 75, 28);
  BNovo.Caption := 'Novo';
  BNovo.OnClick := Novo;
  BSalvar := TButton.Create(Self);
  BSalvar.Parent := Self;
  BSalvar.SetBounds(571, 76, 75, 28);
  BSalvar.Caption := 'Salvar';
  BSalvar.OnClick := Salvar;
  BExcluir := TButton.Create(Self);
  BExcluir.Parent := Self;
  BExcluir.SetBounds(652, 76, 75, 28);
  BExcluir.Caption := 'Excluir';
  BExcluir.OnClick := Excluir;

  Navigator := TDBNavigator.Create(Self);
  Navigator.Parent := Self;
  Navigator.SetBounds(16, 115, 240, 25);
  Navigator.DataSource := FSource;
  Navigator.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast];

  Grid := TDBGrid.Create(Self);
  Grid.Parent := Self;
  Grid.SetBounds(16, 155, 711, 280);
  Grid.Anchors := [akLeft, akTop, akRight, akBottom];
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
  if FTabela.State in dsEditModes then
    FTabela.Post;
end;

procedure TFormGuardado.Excluir(Sender: TObject);
begin
  if not FTabela.IsEmpty then
    FTabela.Delete;
end;

end.
