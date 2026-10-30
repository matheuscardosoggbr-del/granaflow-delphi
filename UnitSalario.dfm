object FormSalario: TFormSalario
  Caption = 'GranaFlow - Salário'
  ClientHeight = 230
  ClientWidth = 420
  Position = poScreenCenter
  OnCreate = FormCreate
  object Titulo: TLabel
    Left = 24
    Top = 20
    Caption = 'Meu salário mensal'
    Font.Style = [fsBold]
    Font.Size = 18
    ParentFont = False
  end
  object LValor: TLabel
    Left = 24
    Top = 75
    Caption = 'Valor do salário'
  end
  object EValor: TEdit
    Left = 24
    Top = 98
    Width = 250
    TabOrder = 0
  end
  object BSalvar: TButton
    Left = 24
    Top = 145
    Width = 250
    Caption = 'Salvar salário'
    OnClick = SalvarSalario
    TabOrder = 1
  end
end
