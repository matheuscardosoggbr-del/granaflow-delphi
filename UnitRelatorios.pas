unit UnitRelatorios;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  FireDAC.Comp.Client, FireDAC.Stan.Param, UnitDMDB;

type
  TFormRelatorios = class(TForm)
    Titulo: TLabel;
    BAtualizar: TButton;
    FTexto: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure GerarRelatorio(Sender: TObject);
  private
    function TotalDaTabela(const NomeTabela: string): Currency;
  end;

var FormRelatorios: TFormRelatorios;

implementation

{$R *.dfm}

function TFormRelatorios.TotalDaTabela(const NomeTabela: string): Currency;
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

procedure TFormRelatorios.FormCreate(Sender: TObject);
begin
  GerarRelatorio(Self);
end;

procedure TFormRelatorios.GerarRelatorio(Sender: TObject);
var Receitas, Salario, Gastos: Currency;
begin
  Receitas := TotalDaTabela('receitas');
  Salario := TotalDaTabela('salarios');
  Gastos := TotalDaTabela('gastos');
  FTexto.Lines.Clear;
  FTexto.Lines.Add('RELATÓRIO FINANCEIRO');
  FTexto.Lines.Add('');
  FTexto.Lines.Add('Usuário: ' + IntToStr(UsuarioLogadoId));
  FTexto.Lines.Add('Data: ' + DateToStr(Date));
  FTexto.Lines.Add('');
  FTexto.Lines.Add('Total de receitas: ' + FormatFloat('R$ #,##0.00', Receitas));
  FTexto.Lines.Add('Salário mensal: ' + FormatFloat('R$ #,##0.00', Salario));
  FTexto.Lines.Add('Total de gastos: ' + FormatFloat('R$ #,##0.00', Gastos));
  FTexto.Lines.Add('Saldo final: ' + FormatFloat('R$ #,##0.00', Receitas + Salario - Gastos));
end;

end.
