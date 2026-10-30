unit UnitGastos;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Graphics, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.DBGrids, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, UnitDMDB;

type
  TFormGastos = class(TForm)
  private
    FDescricao: TDBEdit;
    FValor: TDBEdit;
    FData: TDBEdit;
    FCategoria: TComboBox;
    FCategoriaIds: TStringList;
    FGrid: TDBGrid;
    FNavigator: TDBNavigator;
    procedure NovoGasto(Sender: TObject);
    procedure SalvarGasto(Sender: TObject);
    procedure ExcluirGasto(Sender: TObject);
    procedure PrepararNovoGasto;
    procedure CarregarCategorias;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FormGastos: TFormGastos;

implementation

constructor TFormGastos.Create(AOwner: TComponent);
var
  Titulo, LDescricao, LValor, LData, LCategoria: TLabel;
  BNovo, BSalvar, BExcluir: TButton;
begin
  inherited Create(AOwner);

  Caption := 'GranaFlow - Gastos';
  Width := 850;
  Height := 520;
  Position := poScreenCenter;

  Titulo := TLabel.Create(Self);
  Titulo.Parent := Self;
  Titulo.Left := 16;
  Titulo.Top := 16;
  Titulo.Caption := 'Meus gastos';
  Titulo.Font.Size := 18;
  Titulo.Font.Style := [fsBold];

  LDescricao := TLabel.Create(Self);
  LDescricao.Parent := Self;
  LDescricao.Left := 16;
  LDescricao.Top := 58;
  LDescricao.Caption := 'Descrição';

  FDescricao := TDBEdit.Create(Self);
  FDescricao.Parent := Self;
  FDescricao.Left := 16;
  FDescricao.Top := 78;
  FDescricao.Width := 250;
  FDescricao.DataSource := DMDB.DsGastos;
  FDescricao.DataField := 'descricao';

  LValor := TLabel.Create(Self);
  LValor.Parent := Self;
  LValor.Left := 282;
  LValor.Top := 58;
  LValor.Caption := 'Valor';

  FValor := TDBEdit.Create(Self);
  FValor.Parent := Self;
  FValor.Left := 282;
  FValor.Top := 78;
  FValor.Width := 120;
  FValor.DataSource := DMDB.DsGastos;
  FValor.DataField := 'valor';

  LData := TLabel.Create(Self);
  LData.Parent := Self;
  LData.Left := 418;
  LData.Top := 58;
  LData.Caption := 'Data';

  FData := TDBEdit.Create(Self);
  FData.Parent := Self;
  FData.Left := 418;
  FData.Top := 78;
  FData.Width := 120;
  FData.DataSource := DMDB.DsGastos;
  FData.DataField := 'data_gasto';

  LCategoria := TLabel.Create(Self);
  LCategoria.Parent := Self;
  LCategoria.SetBounds(560, 58, 120, 20);
  LCategoria.Caption := 'Categoria';
  FCategoria := TComboBox.Create(Self);
  FCategoria.Parent := Self;
  FCategoria.SetBounds(560, 78, 180, 24);
  FCategoria.Style := csDropDownList;
  FCategoriaIds := TStringList.Create;

  BNovo := TButton.Create(Self);
  BNovo.Parent := Self;
  BNovo.Left := 560;
  BNovo.Top := 76;
  BNovo.Width := 80;
  BNovo.Caption := 'Novo';
  BNovo.OnClick := NovoGasto;

  BSalvar := TButton.Create(Self);
  BSalvar.Parent := Self;
  BSalvar.Left := 646;
  BSalvar.Top := 76;
  BSalvar.Width := 80;
  BSalvar.Caption := 'Salvar';
  BSalvar.OnClick := SalvarGasto;

  BExcluir := TButton.Create(Self);
  BExcluir.Parent := Self;
  BExcluir.Left := 732;
  BExcluir.Top := 76;
  BExcluir.Width := 80;
  BExcluir.Caption := 'Excluir';
  BExcluir.OnClick := ExcluirGasto;

  FNavigator := TDBNavigator.Create(Self);
  FNavigator.Parent := Self;
  FNavigator.Left := 16;
  FNavigator.Top := 115;
  FNavigator.Width := 240;
  FNavigator.DataSource := DMDB.DsGastos;
  FNavigator.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast];

  FGrid := TDBGrid.Create(Self);
  FGrid.Parent := Self;
  FGrid.Left := 16;
  FGrid.Top := 155;
  FGrid.Width := 796;
  FGrid.Height := 300;
  FGrid.Anchors := [akLeft, akTop, akRight, akBottom];
  FGrid.DataSource := DMDB.DsGastos;

  PrepararNovoGasto;
  CarregarCategorias;
end;

destructor TFormGastos.Destroy;
begin
  FCategoriaIds.Free;
  inherited Destroy;
end;

procedure TFormGastos.PrepararNovoGasto;
begin
  DMDB.TbGastos.Filter := 'id_usuario = ' + IntToStr(UsuarioLogadoId);
  DMDB.TbGastos.Filtered := UsuarioLogadoId > 0;
end;

procedure TFormGastos.NovoGasto(Sender: TObject);
begin
  DMDB.TbGastos.Append;
  DMDB.TbGastos.FieldByName('id_usuario').AsInteger := UsuarioLogadoId;
  if FCategoria.ItemIndex >= 0 then
    DMDB.TbGastos.FieldByName('id_categoria').AsInteger :=
      StrToInt(FCategoriaIds[FCategoria.ItemIndex]);
  DMDB.TbGastos.FieldByName('data_gasto').AsDateTime := Date;
end;

procedure TFormGastos.CarregarCategorias;
var
  Consulta: TFDQuery;
begin
  FCategoria.Items.Clear;
  FCategoriaIds.Clear;
  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := DMDB.DB;
    Consulta.SQL.Text :=
      'SELECT id_categoria, nome FROM categorias ' +
      'WHERE id_usuario IS NULL OR id_usuario = :id_usuario ' +
      'ORDER BY nome';
    Consulta.ParamByName('id_usuario').AsInteger := UsuarioLogadoId;
    Consulta.Open;
    while not Consulta.Eof do
    begin
      FCategoria.Items.Add(Consulta.FieldByName('nome').AsString);
      FCategoriaIds.Add(Consulta.FieldByName('id_categoria').AsString);
      Consulta.Next;
    end;
  finally
    Consulta.Free;
  end;
  if FCategoria.Items.Count > 0 then
    FCategoria.ItemIndex := 0;
end;

procedure TFormGastos.SalvarGasto(Sender: TObject);
begin
  if DMDB.TbGastos.State in dsEditModes then
    DMDB.TbGastos.Post;
end;

procedure TFormGastos.ExcluirGasto(Sender: TObject);
begin
  if not DMDB.TbGastos.IsEmpty then
    DMDB.TbGastos.Delete;
end;

end.
