object FormRecorrentes: TFormRecorrentes
  Caption = 'GranaFlow - Gastos recorrentes'
  ClientHeight = 520
  ClientWidth = 850
  Position = poScreenCenter
  OnCreate = FormCreate
  object Titulo: TLabel
    Left = 16
    Top = 16
    Caption = 'Gastos recorrentes'
    Font.Style = [fsBold]
    Font.Size = 18
    ParentFont = False
  end
  object LDescricao: TLabel
    Left = 16
    Top = 58
    Caption = 'Descrição'
  end
  object LValor: TLabel
    Left = 292
    Top = 58
    Caption = 'Valor'
  end
  object LDia: TLabel
    Left = 428
    Top = 58
    Caption = 'Dia de vencimento'
  end
  object FDescricao: TDBEdit
    Left = 16
    Top = 78
    Width = 260
    DataField = 'descricao'
    TabOrder = 0
  end
  object FValor: TDBEdit
    Left = 292
    Top = 78
    Width = 120
    DataField = 'valor'
    TabOrder = 1
  end
  object FDia: TDBEdit
    Left = 428
    Top = 78
    Width = 120
    DataField = 'dia_vencimento'
    TabOrder = 2
  end
  object BNovo: TButton
    Left = 565
    Top = 76
    Width = 80
    Caption = 'Novo'
    OnClick = Novo
    TabOrder = 3
  end
  object BSalvar: TButton
    Left = 651
    Top = 76
    Width = 80
    Caption = 'Salvar'
    OnClick = Salvar
    TabOrder = 4
  end
  object BExcluir: TButton
    Left = 737
    Top = 76
    Width = 80
    Caption = 'Excluir'
    OnClick = Excluir
    TabOrder = 5
  end
  object Navigator: TDBNavigator
    Left = 16
    Top = 115
    Width = 240
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 6
  end
  object Grid: TDBGrid
    Left = 16
    Top = 155
    Width = 801
    Height = 300
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 7
  end
end
