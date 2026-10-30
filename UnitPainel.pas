unit UnitPainel;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Graphics, FireDAC.Comp.Client, FireDAC.Stan.Param, UnitDMDB;

type
  TFormPainel = class(TForm)
  private
    LTotalReceitas, LTotalSalario: TLabel;
    LTotalGastos: TLabel;
    LSaldo: TLabel;
    procedure AtualizarClick(Sender: TObject);
    function BuscarTotal(const NomeTabela: string): Currency;
    procedure AtualizarValores;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FormPainel: TFormPainel;

implementation

constructor TFormPainel.Create(AOwner: TComponent);
var
  Titulo, L1, L2, L3, L4: TLabel;
  BAtualizar: TButton;
begin
  inherited CreateNew(AOwner);

  Caption := 'GranaFlow - Painel';
  Width := 760;
  Height := 350;
  Position := poScreenCenter;

  Titulo := TLabel.Create(Self);
  Titulo.Parent := Self;
  Titulo.SetBounds(24, 20, 500, 35);
  Titulo.Caption := 'Resumo financeiro';
  Titulo.Font.Size := 20;
  Titulo.Font.Style := [fsBold];

  L1 := TLabel.Create(Self);
  L1.Parent := Self;
  L1.SetBounds(24, 90, 180, 25);
  L1.Caption := 'Total de receitas';
  L1.Font.Size := 12;

  LTotalReceitas := TLabel.Create(Self);
  LTotalReceitas.Parent := Self;
  LTotalReceitas.SetBounds(24, 118, 180, 35);
  LTotalReceitas.Font.Size := 18;
  LTotalReceitas.Font.Style := [fsBold];

  L4 := TLabel.Create(Self);
  L4.Parent := Self;
  L4.SetBounds(210, 90, 180, 25);
  L4.Caption := 'Salário mensal';
  L4.Font.Size := 12;
  LTotalSalario := TLabel.Create(Self);
  LTotalSalario.Parent := Self;
  LTotalSalario.SetBounds(210, 118, 180, 35);
  LTotalSalario.Font.Size := 18;
  LTotalSalario.Font.Style := [fsBold];

  L2 := TLabel.Create(Self);
  L2.Parent := Self;
  L2.SetBounds(396, 90, 180, 25);
  L2.Caption := 'Total de gastos';
  L2.Font.Size := 12;

  LTotalGastos := TLabel.Create(Self);
  LTotalGastos.Parent := Self;
  LTotalGastos.SetBounds(396, 118, 180, 35);
  LTotalGastos.Font.Size := 18;
  LTotalGastos.Font.Style := [fsBold];

  L3 := TLabel.Create(Self);
  L3.Parent := Self;
  L3.SetBounds(582, 90, 180, 25);
  L3.Caption := 'Saldo';
  L3.Font.Size := 12;

  LSaldo := TLabel.Create(Self);
  LSaldo.Parent := Self;
  LSaldo.SetBounds(582, 118, 180, 35);
  LSaldo.Font.Size := 18;
  LSaldo.Font.Style := [fsBold];

  BAtualizar := TButton.Create(Self);
  BAtualizar.Parent := Self;
  BAtualizar.SetBounds(24, 190, 180, 32);
  BAtualizar.Caption := 'Atualizar valores';
  BAtualizar.OnClick := AtualizarClick;

  AtualizarValores;
end;

procedure TFormPainel.AtualizarClick(Sender: TObject);
begin
  AtualizarValores;
end;

function TFormPainel.BuscarTotal(const NomeTabela: string): Currency;
var
  Consulta: TFDQuery;
begin
  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := DMDB.DB;
    Consulta.SQL.Text :=
      'SELECT COALESCE(SUM(valor), 0) AS total FROM ' + NomeTabela +
      ' WHERE id_usuario = :id_usuario';
    Consulta.ParamByName('id_usuario').AsInteger := UsuarioLogadoId;
    Consulta.Open;
    Result := Consulta.FieldByName('total').AsCurrency;
  finally
    Consulta.Free;
  end;
end;

procedure TFormPainel.AtualizarValores;
var
  Receitas, Salario, Gastos: Currency;
begin
  Receitas := BuscarTotal('receitas');
  Salario := BuscarTotal('salarios');
  Gastos := BuscarTotal('gastos');
  LTotalReceitas.Caption := FormatFloat('R$ #,##0.00', Receitas);
  LTotalSalario.Caption := FormatFloat('R$ #,##0.00', Salario);
  LTotalGastos.Caption := FormatFloat('R$ #,##0.00', Gastos);
  LSaldo.Caption := FormatFloat('R$ #,##0.00', Receitas + Salario - Gastos);
end;

end.
