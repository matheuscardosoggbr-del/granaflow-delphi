unit UnitRelatorios;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Graphics, FireDAC.Comp.Client, FireDAC.Stan.Param, UnitDMDB;

type
  TFormRelatorios = class(TForm)
  private
    FTexto: TMemo;
    function TotalDaTabela(const NomeTabela: string): Currency;
    procedure GerarRelatorio(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FormRelatorios: TFormRelatorios;

implementation

constructor TFormRelatorios.Create(AOwner: TComponent);
var
  Titulo: TLabel;
  BAtualizar: TButton;
begin
  inherited CreateNew(AOwner);
  Caption := 'GranaFlow - Relatórios';
  Width := 600;
  Height := 420;
  Position := poScreenCenter;

  Titulo := TLabel.Create(Self);
  Titulo.Parent := Self;
  Titulo.SetBounds(16, 16, 500, 35);
  Titulo.Caption := 'Relatório financeiro';
  Titulo.Font.Size := 18;
  Titulo.Font.Style := [fsBold];

  BAtualizar := TButton.Create(Self);
  BAtualizar.Parent := Self;
  BAtualizar.SetBounds(16, 65, 120, 30);
  BAtualizar.Caption := 'Atualizar';
  BAtualizar.OnClick := GerarRelatorio;

  FTexto := TMemo.Create(Self);
  FTexto.Parent := Self;
  FTexto.SetBounds(16, 110, 550, 250);
  FTexto.Anchors := [akLeft, akTop, akRight, akBottom];
  FTexto.ReadOnly := True;
  FTexto.Font.Size := 12;

  GerarRelatorio(Self);
end;

function TFormRelatorios.TotalDaTabela(const NomeTabela: string): Currency;
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

procedure TFormRelatorios.GerarRelatorio(Sender: TObject);
var
  Receitas, Salario, Gastos: Currency;
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
