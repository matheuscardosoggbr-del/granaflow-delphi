object FormReceitas: TFormReceitas
  Caption = 'GranaFlow - Receitas'
  ClientHeight = 520
  ClientWidth = 850
  Position = poScreenCenter
  OnCreate = FormCreate
  object Titulo: TLabel
    Left = 16
    Top = 16
    Caption = 'Minhas receitas'
    Font.Style = [fsBold]
    Font.Size = 18
    ParentFont = False
  end
  object LDescricao: TLabel
    Left = 16
    Top = 58
    Caption = 'Descri'#231#227'o'
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
  object FDescricao: TDBEdit
    Left = 16
    Top = 78
    Width = 250
    DataField = 'descricao'
    DataSource = DMDB.DsReceita
    TabOrder = 0
  end
  object FValor: TDBEdit
    Left = 282
    Top = 78
    Width = 120
    DataField = 'valor'
    DataSource = DMDB.DsReceita
    TabOrder = 1
  end
  object FData: TDBEdit
    Left = 418
    Top = 78
    Width = 120
    DataField = 'data_receita'
    DataSource = DMDB.DsReceita
    TabOrder = 2
  end
  object BNova: TButton
    Left = 16
    Top = 115
    Width = 80
    Caption = 'Nova'
    OnClick = NovaReceita
    TabOrder = 3
  end
  object BSalvar: TButton
    Left = 102
    Top = 115
    Width = 80
    Caption = 'Salvar'
    OnClick = SalvarReceita
    TabOrder = 4
  end
  object BExcluir: TButton
    Left = 188
    Top = 115
    Width = 80
    Caption = 'Excluir'
    OnClick = ExcluirReceita
    TabOrder = 5
  end
  object Navigator: TDBNavigator
    Left = 282
    Top = 115
    Width = 240
    DataSource = DMDB.DsReceita
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 6
  end
  object Grid: TDBGrid
    Left = 16
    Top = 155
    Width = 796
    Height = 300
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DMDB.DsReceita
    TabOrder = 7
    Columns = <
      item
        FieldName = 'id_receita'
        Title.Caption = 'C'#243'digo'
      end
      item
        FieldName = 'id_usuario'
        Title.Caption = 'Usu'#225'rio'
      end
      item
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
      end
      item
        FieldName = 'valor'
        Title.Caption = 'Valor'
      end
      item
        FieldName = 'data_receita'
        Title.Caption = 'Data da receita'
      end>
  end
end
