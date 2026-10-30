object Principal: TPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Principal'
  ClientHeight = 492
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object SVAsider: TSplitView
    Left = 0
    Top = 0
    Width = 200
    Height = 492
    Color = 16377574
    OpenedWidth = 200
    Placement = svpLeft
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 200
      Height = 121
      Align = alTop
      BevelOuter = bvNone
      Color = 16377574
      ParentBackground = False
      TabOrder = 0
      object LogoGranaflow: TLabel
        Left = 52
        Top = 5
        Width = 142
        Height = 37
        Caption = 'GranaFlow'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object ImgLogo: TImage
        Left = 7
        Top = 7
        Width = 39
        Height = 35
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000260000
          0022080600000033ACABB8000000017352474200AECE1CE90000000467414D41
          0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000004
          1E4944415478DACD58594C134118FE26A59643392C552402829A688C5744B94F
          5B3431D1678D8978FBA44F1EAFBE208A47A2C6171FBC5335DE2822A08847454E
          0151B9BD620441E488A068C7EDDA967677DB9D2E68D8A499DD7FE79FFDE6FFBF
          F9E69F9245A6A79450009460B8E57EE6619BE519666B4B05ADD5EE3886737FEB
          3BB3C4F8F8DB4A8E176D3251258EB667BB8F590698ED9D9988FB4162DCE82716
          600E0699C84845CAD9EE0C847F06430684C0163F7E461539DA232500E2943A37
          117535AEADDFE247CFE8BFE494289DAC138E2929A58A1CDD92DB734E89261C53
          5C4A5938254E850B409E704AD0CF911A24B6F83955E2289417D18C3DE114C419
          20B1F75D00130C74246E06B41A35328BDE0852A14CA7E4E486C415955116C723
          B1D331D15B8DF5450DA3A253521176FA6E5C6199EB543A7CE070FC7468396099
          058DA3A353327243E20BCA298BE3A1040E98C60BEB0B9B64754A1F198855B382
          A056FD1DCF7251AE2D69E9C3D5EA6E8645C4FDE2F3CBA9DB105BED3C306F0ED8
          BD26C8E95472843F5672C0C68F53F1A0B4BE5EF0F756A1E04D2F8E3E6C67921B
          9270B782BA22A3A3E3C1C4283E951BF29B3CE2D4BA45C1583927908FDE83C63E
          1C2BEE181E1F2EB630CB7D425E85B4F20B667230D90A2CAF49C4A9B573753044
          05E0626D17EE35F6D801AE981D84CC682DDE7DFD89107F352ADF7FC7B1075FD8
          E426E94E2565D1A99CA469D0FAA8B129AFD989534B42C763474C0826685418FC
          4571AAE20B0A1B7A113DD50FDB1327A37FF0372E547EC5B6041DAA78609D929C
          12014BCCADA4A2144AE8544E4A241FB18D779AED3AE5A356212B3D1C93FCBC70
          B2BC036BE6072390E3A1B1BA0BCB6705F0608F9774A067E03776E94350F37100
          27F88831C84D726E1565A9A7725223391DF3C2E6DB2D76DBCEF850C4854DC0B9
          EA4EDCACEF46448006BBD3A6203C701C068628CE3CEF427E7D8FF41EEC8AF4B6
          77C937AB04AB527AEFCB499D86893E1CB0DC16BEDF8A991C7F16EA50F6A11F87
          1E7DB64FC4026A638C0E0DED83B858D1ADB82C2229375E5016C70369113CB02D
          B75A313BD8177B9242F1FDA71959C59FF0E9DB90879BBD7CF94452AE5753C99C
          0B74EAC0522BB01BADC83284232A4883E3A67698DAFAFF49594452AFD55016C7
          FDFA706E5572C0AEB761F5BC60F471AB2DEF758FFBBDCF8D4E394E4472E749BD
          5243A538254C49B603B0FF511691B42BB594C531DB10C6A5528DADD7DA98EA29
          4F39252CB748DAE55AA6E35BF6B230E8FCD4305675F1767E00CB9DD507365FBB
          CD6A07197EE6AEEE5E33EADEFE902D8B48FAA53ACA42C67D19615810EA8B915E
          75EF06B1D7D8295F40A61BEBE8983CBEE98D2FA922C711EA94ECB1507FE1E5D8
          3CBE19CED753458E23D42997ABD1F61DC3B9FAB1797CCB38FB8A2A711C4D4E49
          6D8924E3F42BA6E3DB68FFCD247B7C5B76EA3555E2285B4F79C82961D9F50742
          C3374794D5B70E0000000049454E44AE426082}
      end
      object DBEpesquisa: TDBEdit
        Left = 6
        Top = 48
        Width = 186
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 92
      Width = 200
      Height = 400
      Align = alBottom
      Color = 16377574
      ParentBackground = False
      TabOrder = 1
      object BtnGuardado: TButton
        Left = 0
        Top = 342
        Width = 200
        Height = 38
        Align = alTop
        Caption = 'Dinheiro guardado'
        TabOrder = 0
        OnClick = AbrirGuardado
      end
      object BtnRecorrentes: TButton
        Left = 0
        Top = 304
        Width = 200
        Height = 38
        Align = alTop
        Caption = 'Gastos recorrentes'
        TabOrder = 1
        OnClick = AbrirRecorrentes
      end
      object BtnSalario: TButton
        Left = 0
        Top = 266
        Width = 200
        Height = 38
        Align = alTop
        Caption = 'Salário'
        TabOrder = 2
        OnClick = AbrirSalario
      end
      object BtnRelatorios: TButton
        Left = 0
        Top = 228
        Width = 200
        Height = 38
        Align = alTop
        Caption = 'Relatórios'
        TabOrder = 3
        OnClick = AbrirRelatorios
      end
      object BtnMetas: TButton
        Left = 0
        Top = 190
        Width = 200
        Height = 38
        Align = alTop
        Caption = 'Metas'
        TabOrder = 4
        OnClick = AbrirMetas
      end
      object BtnCategorias: TButton
        Left = 0
        Top = 152
        Width = 200
        Height = 38
        Align = alTop
        Caption = 'Categorias'
        TabOrder = 5
        OnClick = AbrirCategorias
      end
      object BtnPainel: TButton
        Left = 0
        Top = 114
        Width = 200
        Height = 38
        Align = alTop
        Caption = 'Painel'
        TabOrder = 6
        OnClick = AbrirPainel
      end
      object BtnReceitas: TButton
        Left = 0
        Top = 76
        Width = 200
        Height = 38
        Align = alTop
        Caption = 'Receitas'
        TabOrder = 7
        OnClick = AbrirReceitas
      end
      object BtnGastos: TButton
        Left = 0
        Top = 38
        Width = 200
        Height = 38
        Align = alTop
        Caption = 'Gastos'
        TabOrder = 8
        OnClick = AbrirGastos
      end
      object BtnSair: TButton
        Left = 0
        Top = 362
        Width = 200
        Height = 38
        Align = alBottom
        Caption = 'Sair'
        TabOrder = 9
        OnClick = SairDoSistema
      end
    end
  end
  object CardPanel1: TCardPanel
    Left = 200
    Top = 0
    Width = 468
    Height = 492
    Align = alClient
    ActiveCard = CardRelatorios
    TabOrder = 1
    object CardPainel: TCard
      Left = 1
      Top = 1
      Width = 466
      Height = 490
      Caption = 'CardPainel'
      CardIndex = 0
      TabOrder = 0
    end
    object CardGastos: TCard
      Left = 1
      Top = 1
      Width = 466
      Height = 490
      Caption = 'CardGastos'
      CardIndex = 1
      TabOrder = 1
    end
    object CardReceitas: TCard
      Left = 1
      Top = 1
      Width = 466
      Height = 490
      Caption = 'CardReceitas'
      CardIndex = 2
      TabOrder = 2
    end
    object CardMetas: TCard
      Left = 1
      Top = 1
      Width = 466
      Height = 490
      Caption = 'CardMetas'
      CardIndex = 3
      TabOrder = 3
    end
    object CardCategorias: TCard
      Left = 1
      Top = 1
      Width = 466
      Height = 490
      Caption = 'CardCategorias'
      CardIndex = 4
      TabOrder = 4
    end
    object CardRelatorios: TCard
      Left = 1
      Top = 1
      Width = 466
      Height = 490
      Caption = 'CardRelatorios'
      CardIndex = 5
      TabOrder = 5
    end
  end
end
