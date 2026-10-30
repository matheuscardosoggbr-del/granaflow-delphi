unit UnitGastos;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.DBGrids, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, Vcl.Dialogs, UnitDMDB;

type
  TFormGastos = class(TForm)
    LTitulo: TLabel;
    LDescricao: TLabel;
    LValor: TLabel;
    LData: TLabel;
    LCategoria: TLabel;
    FDescricao: TDBEdit;
    FValor: TDBEdit;
    FData: TDBEdit;
    FCategoria: TComboBox;
    BNovo: TButton;
    BSalvar: TButton;
    BExcluir: TButton;
    FNavigator: TDBNavigator;
    FGrid: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure NovoGasto(Sender: TObject);
    procedure SalvarGasto(Sender: TObject);
    procedure ExcluirGasto(Sender: TObject);
  private
    FCategoriaIds: TStringList;
    procedure CarregarCategorias;
  public
    destructor Destroy; override;
  end;

var
  FormGastos: TFormGastos;

implementation

{$R *.dfm}

procedure TFormGastos.FormCreate(Sender: TObject);
begin
  FCategoriaIds := TStringList.Create;
  DMDB.TbGastos.Filter := 'id_usuario = ' + IntToStr(UsuarioLogadoId);
  DMDB.TbGastos.Filtered := UsuarioLogadoId > 0;
  CarregarCategorias;
end;

destructor TFormGastos.Destroy;
begin
  FCategoriaIds.Free;
  inherited Destroy;
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
var Consulta: TFDQuery;
begin
  FCategoria.Items.Clear;
  FCategoriaIds.Clear;
  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := DMDB.DB;
    Consulta.SQL.Text := 'SELECT id_categoria, nome FROM categorias ' +
      'WHERE id_usuario IS NULL OR id_usuario = :id_usuario ORDER BY nome';
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
  if FCategoria.Items.Count > 0 then FCategoria.ItemIndex := 0;
end;

procedure TFormGastos.SalvarGasto(Sender: TObject);
begin
  if Trim(DMDB.TbGastos.FieldByName('descricao').AsString) = '' then
  begin ShowMessage('Informe uma descrição para o gasto.'); Exit; end;
  if DMDB.TbGastos.FieldByName('valor').AsCurrency <= 0 then
  begin ShowMessage('Informe um valor maior que zero.'); Exit; end;
  if FCategoria.ItemIndex < 0 then
  begin ShowMessage('Escolha uma categoria.'); Exit; end;
  if DMDB.TbGastos.State in dsEditModes then DMDB.TbGastos.Post;
end;

procedure TFormGastos.ExcluirGasto(Sender: TObject);
begin
  if not DMDB.TbGastos.IsEmpty then DMDB.TbGastos.Delete;
end;

end.
