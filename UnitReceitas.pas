unit UnitReceitas;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.DBGrids, Data.DB, Vcl.Dialogs, UnitDMDB;

type
  TFormReceitas = class(TForm)
    Titulo: TLabel;
    LDescricao: TLabel;
    LValor: TLabel;
    LData: TLabel;
    FDescricao: TDBEdit;
    FValor: TDBEdit;
    FData: TDBEdit;
    BNova: TButton;
    BSalvar: TButton;
    BExcluir: TButton;
    Navigator: TDBNavigator;
    Grid: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure NovaReceita(Sender: TObject);
    procedure SalvarReceita(Sender: TObject);
    procedure ExcluirReceita(Sender: TObject);
  end;

var FormReceitas: TFormReceitas;

implementation

{$R *.dfm}

procedure TFormReceitas.FormCreate(Sender: TObject);
begin
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
  begin ShowMessage('Informe uma descrição para a receita.'); Exit; end;
  if DMDB.TbReceita.FieldByName('valor').AsCurrency <= 0 then
  begin ShowMessage('Informe um valor maior que zero.'); Exit; end;
  if DMDB.TbReceita.State in dsEditModes then DMDB.TbReceita.Post;
end;

procedure TFormReceitas.ExcluirReceita(Sender: TObject);
begin
  if not DMDB.TbReceita.IsEmpty then DMDB.TbReceita.Delete;
end;

end.
