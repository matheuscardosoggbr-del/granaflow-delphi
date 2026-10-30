object FormMetas: TFormMetas
  Caption = 'GranaFlow - Metas'
  ClientHeight = 520
  ClientWidth = 950
  Position = poScreenCenter
  OnCreate = FormCreate
  object Titulo: TLabel
    Left = 16
    Top = 16
    Caption = 'Minhas metas'
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
    Caption = 'Valor limite'
  end
  object LGuardado: TLabel
    Left = 428
    Top = 58
    Caption = 'Já guardado'
  end
  object LData: TLabel
    Left = 564
    Top = 58
    Caption = 'Data limite'
  end
  object FDescricao: TDBEdit
    Left = 16
    Top = 78
    Width = 260
    DataField = 'nome_meta'
    TabOrder = 0
  end
  object FValor: TDBEdit
    Left = 292
    Top = 78
    Width = 120
    DataField = 'valor_limite'
    TabOrder = 1
  end
  object FGuardado: TDBEdit
    Left = 428
    Top = 78
    Width = 120
    DataField = 'valor_guardado'
    TabOrder = 2
  end
  object FData: TDBEdit
    Left = 564
    Top = 78
    Width = 120
    DataField = 'data_fim'
    TabOrder = 3
  end
  object BNova: TButton
    Left = 16
    Top = 115
    Width = 80
    Caption = 'Nova'
    OnClick = NovaMeta
    TabOrder = 4
  end
  object BSalvar: TButton
    Left = 102
    Top = 115
    Width = 80
    Caption = 'Salvar'
    OnClick = SalvarMeta
    TabOrder = 5
  end
  object BExcluir: TButton
    Left = 188
    Top = 115
    Width = 80
    Caption = 'Excluir'
    OnClick = ExcluirMeta
    TabOrder = 6
  end
  object Navigator: TDBNavigator
    Left = 292
    Top = 115
    Width = 240
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 7
  end
  object Grid: TDBGrid
    Left = 16
    Top = 155
    Width = 900
    Height = 300
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 8
  end
end
