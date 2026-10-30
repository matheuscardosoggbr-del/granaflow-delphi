unit UnitReceitas;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Dialogs,
  Vcl.Graphics, Vcl.DBCtrls, Vcl.DBGrids, Data.DB, UnitDMDB;

type
  TFormReceitas = class(TForm)
  private
    FDescricao: TDBEdit;
    FValor: TDBEdit;
    FData: TDBEdit;
    procedure NovaReceita(Sender: TObject);
    procedure SalvarReceita(Sender: TObject);
    procedure ExcluirReceita(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FormReceitas: TFormReceitas;

implementation

constructor TFormReceitas.Create(AOwner: TComponent);
var
  Titulo, LDescricao, LValor, LData: TLabel;
  BNova, BSalvar, BExcluir: TButton;
  Grid: TDBGrid;
  Navigator: TDBNavigator;
begin
  inherited CreateNew(AOwner);

  Caption := 'GranaFlow - Receitas';
  Width := 850;
  Height := 520;
  Position := poScreenCenter;

  Titulo := TLabel.Create(Self);
  Titulo.Parent := Self;
  Titulo.Left := 16;
  Titulo.Top := 16;
  Titulo.Caption := 'Minhas receitas';
  Titulo.Font.Size := 18;
  Titulo.Font.Style := [fsBold];

  LDescricao := TLabel.Create(Self);
  LDescricao.Parent := Self;
  LDescricao.Left := 16;
  LDescricao.Top := 58;
  LDescricao.Caption := 'Descrição';

  FDescricao := TDBEdit.Create(Self);
  FDescricao.Parent := Self;
  FDescricao.SetBounds(16, 78, 250, 24);
  FDescricao.DataSource := DMDB.DsReceita;
  FDescricao.DataField := 'descricao';

  LValor := TLabel.Create(Self);
  LValor.Parent := Self;
  LValor.Left := 282;
  LValor.Top := 58;
  LValor.Caption := 'Valor';

  FValor := TDBEdit.Create(Self);
  FValor.Parent := Self;
  FValor.SetBounds(282, 78, 120, 24);
  FValor.DataSource := DMDB.DsReceita;
  FValor.DataField := 'valor';

  LData := TLabel.Create(Self);
  LData.Parent := Self;
  LData.Left := 418;
  LData.Top := 58;
  LData.Caption := 'Data';

  FData := TDBEdit.Create(Self);
  FData.Parent := Self;
  FData.SetBounds(418, 78, 120, 24);
  FData.DataSource := DMDB.DsReceita;
  FData.DataField := 'data_receita';

  BNova := TButton.Create(Self);
  BNova.Parent := Self;
  BNova.SetBounds(560, 76, 80, 28);
  BNova.Caption := 'Nova';
  BNova.OnClick := NovaReceita;

  BSalvar := TButton.Create(Self);
  BSalvar.Parent := Self;
  BSalvar.SetBounds(646, 76, 80, 28);
  BSalvar.Caption := 'Salvar';
  BSalvar.OnClick := SalvarReceita;

  BExcluir := TButton.Create(Self);
  BExcluir.Parent := Self;
  BExcluir.SetBounds(732, 76, 80, 28);
  BExcluir.Caption := 'Excluir';
  BExcluir.OnClick := ExcluirReceita;

  Navigator := TDBNavigator.Create(Self);
  Navigator.Parent := Self;
  Navigator.SetBounds(16, 115, 240, 25);
  Navigator.DataSource := DMDB.DsReceita;
  Navigator.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast];

  Grid := TDBGrid.Create(Self);
  Grid.Parent := Self;
  Grid.SetBounds(16, 155, 796, 300);
  Grid.Anchors := [akLeft, akTop, akRight, akBottom];
  Grid.DataSource := DMDB.DsReceita;

  DMDB.TbReceita.Filter := 'id_usuario = ' + IntToStr(UsuarioLogadoId);
  DMDB.TbReceita.Filtered := UsuarioLogadoId > 0;
end;

procedure TFormReceitas.NovaReceita(Sender: TObject);
begin
  DMDB.TbReceita.Append;
  DMDB.TbReceita.FieldByName('id_usuario').AsInteger := UsuarioLogadoId;
  DMDB.TbReceita.FieldByName('data_receita').AsDateTime := Date;
end;

procedure TFormReceitas.SalvarReceita(Sender: TObject);
begin
  if Trim(DMDB.TbReceita.FieldByName('descricao').AsString) = '' then
  begin
    ShowMessage('Informe uma descrição para a receita.');
    Exit;
  end;

  if DMDB.TbReceita.FieldByName('valor').AsCurrency <= 0 then
  begin
    ShowMessage('Informe um valor maior que zero.');
    Exit;
  end;

  if DMDB.TbReceita.State in dsEditModes then
    DMDB.TbReceita.Post;
end;

procedure TFormReceitas.ExcluirReceita(Sender: TObject);
begin
  if not DMDB.TbReceita.IsEmpty then
    DMDB.TbReceita.Delete;
end;

end.
