unit UnitSalario;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Dialogs,
  Vcl.Graphics, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, UnitDMDB;

type
  TFormSalario = class(TForm)
  private
    EValor: TEdit;
    procedure SalvarSalario(Sender: TObject);
    procedure CarregarSalario;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FormSalario: TFormSalario;

implementation

constructor TFormSalario.Create(AOwner: TComponent);
var
  Titulo, LValor: TLabel;
  BSalvar: TButton;
begin
  inherited Create(AOwner);
  Caption := 'GranaFlow - Salário';
  Width := 420;
  Height := 230;
  Position := poScreenCenter;

  Titulo := TLabel.Create(Self);
  Titulo.Parent := Self;
  Titulo.SetBounds(24, 20, 350, 32);
  Titulo.Caption := 'Meu salário mensal';
  Titulo.Font.Size := 18;
  Titulo.Font.Style := [fsBold];

  LValor := TLabel.Create(Self);
  LValor.Parent := Self;
  LValor.SetBounds(24, 75, 160, 20);
  LValor.Caption := 'Valor do salário';

  EValor := TEdit.Create(Self);
  EValor.Parent := Self;
  EValor.SetBounds(24, 98, 250, 25);

  BSalvar := TButton.Create(Self);
  BSalvar.Parent := Self;
  BSalvar.SetBounds(24, 145, 250, 32);
  BSalvar.Caption := 'Salvar salário';
  BSalvar.OnClick := SalvarSalario;

  CarregarSalario;
end;

procedure TFormSalario.CarregarSalario;
var
  Consulta: TFDQuery;
begin
  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := DMDB.DB;
    Consulta.SQL.Text :=
      'SELECT valor FROM salarios WHERE id_usuario = :id_usuario';
    Consulta.ParamByName('id_usuario').AsInteger := UsuarioLogadoId;
    Consulta.Open;
    if not Consulta.IsEmpty then
      EValor.Text := Consulta.FieldByName('valor').AsString;
  finally
    Consulta.Free;
  end;
end;

procedure TFormSalario.SalvarSalario(Sender: TObject);
var
  Consulta: TFDQuery;
begin
  if Trim(EValor.Text) = '' then
  begin
    ShowMessage('Informe o valor do salário.');
    Exit;
  end;

  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := DMDB.DB;
    Consulta.SQL.Text :=
      'UPDATE salarios SET valor = :valor WHERE id_usuario = :id_usuario';
    Consulta.ParamByName('valor').AsString := Trim(EValor.Text);
    Consulta.ParamByName('id_usuario').AsInteger := UsuarioLogadoId;
    Consulta.ExecSQL;

    if Consulta.RowsAffected = 0 then
    begin
      Consulta.SQL.Text :=
        'INSERT INTO salarios (id_usuario, valor) ' +
        'VALUES (:id_usuario, :valor)';
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
