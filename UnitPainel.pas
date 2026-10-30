unit UnitPainel;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  FireDAC.Comp.Client, FireDAC.Stan.Param, UnitDMDB;

type
  TFormPainel = class(TForm)
    LTotalReceitas: TLabel;
    LTotalSalario: TLabel;
    LTotalGastos: TLabel;
    LSaldo: TLabel;
    BAtualizar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure AtualizarClick(Sender: TObject);
  private
    function BuscarTotal(const NomeTabela: string): Currency;
    procedure AtualizarValores;
  end;

var FormPainel: TFormPainel;

implementation

{$R *.dfm}

procedure TFormPainel.FormCreate(Sender: TObject);
begin
  AtualizarValores;
end;

function TFormPainel.BuscarTotal(const NomeTabela: string): Currency;
var Consulta: TFDQuery;
begin
  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := DMDB.DB;
    Consulta.SQL.Text := 'SELECT COALESCE(SUM(valor), 0) AS total FROM ' +
      NomeTabela + ' WHERE id_usuario = :id_usuario';
    Consulta.ParamByName('id_usuario').AsInteger := UsuarioLogadoId;
    Consulta.Open;
    Result := Consulta.FieldByName('total').AsCurrency;
  finally
    Consulta.Free;
  end;
end;

procedure TFormPainel.AtualizarValores;
var Receitas, Salario, Gastos: Currency;
begin
  Receitas := BuscarTotal('receitas');
  Salario := BuscarTotal('salarios');
  Gastos := BuscarTotal('gastos');
  LTotalReceitas.Caption := FormatFloat('R$ #,##0.00', Receitas);
  LTotalSalario.Caption := FormatFloat('R$ #,##0.00', Salario);
  LTotalGastos.Caption := FormatFloat('R$ #,##0.00', Gastos);
  LSaldo.Caption := FormatFloat('R$ #,##0.00', Receitas + Salario - Gastos);
end;

procedure TFormPainel.AtualizarClick(Sender: TObject);
begin
  AtualizarValores;
end;

end.
