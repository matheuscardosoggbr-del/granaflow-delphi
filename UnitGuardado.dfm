object FormGuardado: TFormGuardado
  Caption = 'GranaFlow - Dinheiro guardado'
  ClientHeight = 500
  ClientWidth = 760
  Position = poScreenCenter
  OnCreate = FormCreate
  object Titulo: TLabel
    Left = 16
    Top = 16
    Caption = 'Dinheiro guardado'
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
    Left = 332
    Top = 58
    Caption = 'Valor'
  end
  object FDescricao: TDBEdit
    Left = 16
    Top = 78
    Width = 300
    DataField = 'descricao'
    TabOrder = 0
  end
  object FValor: TDBEdit
    Left = 332
    Top = 78
    Width = 140
    DataField = 'valor'
    TabOrder = 1
  end
  object BNovo: TButton
    Left = 490
    Top = 76
    Width = 75
    Caption = 'Novo'
    OnClick = Novo
    TabOrder = 2
  end
  object BSalvar: TButton
    Left = 571
    Top = 76
    Width = 75
    Caption = 'Salvar'
    OnClick = Salvar
    TabOrder = 3
  end
  object BExcluir: TButton
    Left = 652
    Top = 76
    Width = 75
    Caption = 'Excluir'
    OnClick = Excluir
    TabOrder = 4
  end
  object Navigator: TDBNavigator
    Left = 16
    Top = 115
    Width = 240
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 5
  end
  object Grid: TDBGrid
    Left = 16
    Top = 155
    Width = 711
    Height = 280
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 6
  end
end
