object FormSalario: TFormSalario
  Caption = 'GranaFlow - Sal'#225'rio'
  ClientHeight = 230
  ClientWidth = 420
  Position = poScreenCenter
  OnCreate = FormCreate
  object Titulo: TLabel
    Left = 24
    Top = 20
    Caption = 'Meu sal'#225'rio mensal'
    Font.Style = [fsBold]
    Font.Size = 18
    ParentFont = False
  end
  object LValor: TLabel
    Left = 24
    Top = 75
    Caption = 'Valor do sal'#225'rio'
  end
  object EValor: TMaskEdit
    Left = 24
    Top = 98
    Width = 250
    EditMask = '#,##0.00;-,##0.00;_'
    TabOrder = 0
  end
  object BSalvar: TButton
    Left = 24
    Top = 145
    Width = 250
    Caption = 'Salvar sal'#225'rio'
    OnClick = SalvarSalario
    TabOrder = 1
  end
end
