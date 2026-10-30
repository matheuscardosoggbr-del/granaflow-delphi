object FormGastos: TFormGastos
  Caption = 'GranaFlow - Gastos'
  ClientHeight = 520
  ClientWidth = 850
  Position = poScreenCenter
  OnCreate = FormCreate
  object LTitulo: TLabel
    Left = 16
    Top = 16
    Caption = 'Meus gastos'
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
    Left = 282
    Top = 58
    Caption = 'Valor'
  end
  object LData: TLabel
    Left = 418
    Top = 58
    Caption = 'Data'
  end
  object LCategoria: TLabel
    Left = 560
    Top = 58
    Caption = 'Categoria'
  end
  object FDescricao: TDBEdit
    Left = 16
    Top = 78
    Width = 250
    DataField = 'descricao'
    DataSource = DMDB.DsGastos
    TabOrder = 0
  end
  object FValor: TDBEdit
    Left = 282
    Top = 78
    Width = 120
    DataField = 'valor'
    DataSource = DMDB.DsGastos
    TabOrder = 1
  end
  object FData: TDBEdit
    Left = 418
    Top = 78
    Width = 120
    DataField = 'data_gasto'
    DataSource = DMDB.DsGastos
    TabOrder = 2
  end
  object FCategoria: TComboBox
    Left = 560
    Top = 78
    Width = 180
    Style = csDropDownList
    TabOrder = 3
  end
  object BNovo: TButton
    Left = 16
    Top = 115
    Width = 80
    Caption = 'Novo'
    OnClick = NovoGasto
    TabOrder = 4
  end
  object BSalvar: TButton
    Left = 102
    Top = 115
    Width = 80
    Caption = 'Salvar'
    OnClick = SalvarGasto
    TabOrder = 5
  end
  object BExcluir: TButton
    Left = 188
    Top = 115
    Width = 80
    Caption = 'Excluir'
    OnClick = ExcluirGasto
    TabOrder = 6
  end
  object FNavigator: TDBNavigator
    Left = 282
    Top = 115
    Width = 240
    DataSource = DMDB.DsGastos
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 7
  end
  object FGrid: TDBGrid
    Left = 16
    Top = 155
    Width = 796
    Height = 300
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DMDB.DsGastos
    TabOrder = 8
  end
end
