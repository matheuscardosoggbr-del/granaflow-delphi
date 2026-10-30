object FormCategorias: TFormCategorias
  Caption = 'GranaFlow - Categorias'
  ClientHeight = 450
  ClientWidth = 650
  Position = poScreenCenter
  OnCreate = FormCreate
  object Titulo: TLabel
    Left = 16
    Top = 16
    Caption = 'Categorias de gastos'
    Font.Style = [fsBold]
    Font.Size = 18
    ParentFont = False
  end
  object LNome: TLabel
    Left = 16
    Top = 65
    Caption = 'Nome'
  end
  object FNome: TDBEdit
    Left = 16
    Top = 86
    Width = 260
    DataField = 'nome'
    TabOrder = 0
  end
  object BNova: TButton
    Left = 300
    Top = 84
    Width = 90
    Caption = 'Nova'
    OnClick = NovaCategoria
    TabOrder = 1
  end
  object BSalvar: TButton
    Left = 396
    Top = 84
    Width = 90
    Caption = 'Salvar'
    OnClick = SalvarCategoria
    TabOrder = 2
  end
  object BExcluir: TButton
    Left = 492
    Top = 84
    Width = 90
    Caption = 'Excluir'
    OnClick = ExcluirCategoria
    TabOrder = 3
  end
  object Navigator: TDBNavigator
    Left = 16
    Top = 125
    Width = 240
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 4
  end
  object Grid: TDBGrid
    Left = 16
    Top = 165
    Width = 566
    Height = 230
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    Columns = <
      item
        FieldName = 'id_categoria'
        Title.Caption = 'C'#243'digo'
      end
      item
        FieldName = 'id_usuario'
        Title.Caption = 'Usu'#225'rio'
      end
      item
        FieldName = 'nome'
        Title.Caption = 'Nome'
      end
      item
        FieldName = 'id_tipo'
        Title.Caption = 'Tipo'
      end>
  end
end
