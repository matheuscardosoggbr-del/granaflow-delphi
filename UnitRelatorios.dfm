object FormRelatorios: TFormRelatorios
  Caption = 'GranaFlow - Relat'#243'rios'
  ClientHeight = 420
  ClientWidth = 600
  Position = poScreenCenter
  OnCreate = FormCreate
  object Titulo: TLabel
    Left = 16
    Top = 16
    Caption = 'Relat'#243'rio financeiro'
    Font.Style = [fsBold]
    Font.Size = 18
    ParentFont = False
  end
  object BAtualizar: TButton
    Left = 16
    Top = 65
    Width = 120
    Caption = 'Atualizar'
    OnClick = GerarRelatorio
    TabOrder = 0
  end
  object FTexto: TMemo
    Left = 16
    Top = 110
    Width = 550
    Height = 250
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    TabOrder = 1
  end
end
