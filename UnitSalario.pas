unit UnitSalario;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Dialogs, Data.DB, Vcl.Mask, FireDAC.Comp.Client, FireDAC.Stan.Param, UnitDMDB;

type
  TFormSalario = class(TForm)
    Titulo: TLabel;
    LValor: TLabel;
    EValor: TMaskEdit;
    BSalvar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure SalvarSalario(Sender: TObject);
  private
    procedure CarregarSalario;
  end;

var FormSalario: TFormSalario;

implementation

{$R *.dfm}

procedure TFormSalario.FormCreate(Sender: TObject);
begin
  CarregarSalario;
end;

procedure TFormSalario.CarregarSalario;
var Consulta: TFDQuery;
begin
  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := DMDB.DB;
    Consulta.SQL.Text := 'SELECT valor FROM salarios WHERE id_usuario = :id_usuario';
    Consulta.ParamByName('id_usuario').AsInteger := UsuarioLogadoId;
    Consulta.Open;
    if not Consulta.IsEmpty then EValor.Text := Consulta.FieldByName('valor').AsString;
  finally
    Consulta.Free;
  end;
end;

procedure TFormSalario.SalvarSalario(Sender: TObject);
var Consulta: TFDQuery;
begin
  if Trim(EValor.Text) = '' then
  begin ShowMessage('Informe o valor do salário.'); Exit; end;
  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := DMDB.DB;
    Consulta.SQL.Text := 'UPDATE salarios SET valor = :valor WHERE id_usuario = :id_usuario';
    Consulta.ParamByName('valor').AsString := Trim(EValor.Text);
    Consulta.ParamByName('id_usuario').AsInteger := UsuarioLogadoId;
    Consulta.ExecSQL;
    if Consulta.RowsAffected = 0 then
    begin
      Consulta.SQL.Text := 'INSERT INTO salarios (id_usuario, valor) VALUES (:id_usuario, :valor)';
      Consulta.ParamByName('id_usuario').AsInteger := UsuarioLogadoId;
      Consulta.ParamByName('valor').AsString := Trim(EValor.Text);
      Consulta.ExecSQL;
    end;
    ShowMessage('Salário salvo com sucesso.');
  finally
    Consulta.Free;
  end;
end;

end.
