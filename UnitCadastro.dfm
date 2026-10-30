object FormCadastro: TFormCadastro
  Caption = 'GranaFlow - Criar conta'
  ClientHeight = 330
  ClientWidth = 380
  Position = poScreenCenter
  object Titulo: TLabel
    Left = 30
    Top = 24
    Caption = 'Criar uma conta'
    Font.Style = [fsBold]
    Font.Size = 18
    ParentFont = False
  end
  object LNome: TLabel
    Left = 30
    Top = 78
    Caption = 'Nome'
  end
  object LEmail: TLabel
    Left = 30
    Top = 132
    Caption = 'E-mail'
  end
  object LSenha: TLabel
    Left = 30
    Top = 186
    Caption = 'Senha'
  end
  object ENome: TEdit
    Left = 30
    Top = 99
    Width = 300
    TabOrder = 0
  end
  object EEmail: TEdit
    Left = 30
    Top = 153
    Width = 300
    TabOrder = 1
  end
  object ESenha: TEdit
    Left = 30
    Top = 207
    Width = 300
    PasswordChar = '*'
    TabOrder = 2
  end
  object BCadastrar: TButton
    Left = 30
    Top = 250
    Width = 300
    Caption = 'Cadastrar'
    OnClick = Cadastrar
    TabOrder = 3
  end
end
