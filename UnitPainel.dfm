object FormPainel: TFormPainel
  Caption = 'GranaFlow - Painel'
  ClientHeight = 350
  ClientWidth = 760
  Position = poScreenCenter
  OnCreate = FormCreate
  object Titulo: TLabel
    Left = 24
    Top = 20
    Caption = 'Resumo financeiro'
    Font.Style = [fsBold]
    Font.Size = 20
    ParentFont = False
  end
  object LReceitas: TLabel
    Left = 24
    Top = 90
    Caption = 'Total de receitas'
  end
  object LTotalReceitas: TLabel
    Left = 24
    Top = 118
    Caption = 'R$ 0,00'
    Font.Style = [fsBold]
    Font.Size = 18
    ParentFont = False
  end
  object LSalario: TLabel
    Left = 210
    Top = 90
    Caption = 'Salário mensal'
  end
  object LTotalSalario: TLabel
    Left = 210
    Top = 118
    Caption = 'R$ 0,00'
    Font.Style = [fsBold]
    Font.Size = 18
    ParentFont = False
  end
  object LGastos: TLabel
    Left = 396
    Top = 90
    Caption = 'Total de gastos'
  end
  object LTotalGastos: TLabel
    Left = 396
    Top = 118
    Caption = 'R$ 0,00'
    Font.Style = [fsBold]
    Font.Size = 18
    ParentFont = False
  end
  object LSaldoTexto: TLabel
    Left = 582
    Top = 90
    Caption = 'Saldo'
  end
  object LSaldo: TLabel
    Left = 582
    Top = 118
    Caption = 'R$ 0,00'
    Font.Style = [fsBold]
    Font.Size = 18
    ParentFont = False
  end
  object BAtualizar: TButton
    Left = 24
    Top = 190
    Width = 180
    Caption = 'Atualizar valores'
    OnClick = AtualizarClick
    TabOrder = 0
  end
end
