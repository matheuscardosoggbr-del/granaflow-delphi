object DMDB: TDMDB
  OldCreateOrder = False
  Height = 392
  Width = 397
  object DB: TFDConnection
    Params.Strings = (
      'DriverID=mySQL'
      'Port=3307'
      'User_Name=root'
      'Database=granaflow')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object TbUsuarios: TFDTable
    Active = True
    IndexFieldNames = 'id_usuario'
    Connection = DB
    UpdateOptions.UpdateTableName = 'granaflow.usuarios'
    TableName = 'granaflow.usuarios'
    Left = 216
    Top = 16
    object TbUsuariosid_usuario: TFDAutoIncField
      FieldName = 'id_usuario'
      Origin = 'id_usuario'
    end
    object TbUsuariosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
    object TbUsuariosemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Required = True
      Size = 50
    end
    object TbUsuariossenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 255
    end
    object TbUsuariosid_moeda: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_moeda'
      Origin = 'id_moeda'
    end
    object TbUsuariosdata_criacao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_criacao'
      Origin = 'data_criacao'
    end
    object TbUsuariosdata_atualizacao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_atualizacao'
      Origin = 'data_atualizacao'
    end
  end
  object DsUsuarios: TDataSource
    DataSet = TbUsuarios
    Left = 216
    Top = 56
  end
  object TbGastos: TFDTable
    Active = True
    IndexFieldNames = 'id_gasto'
    Connection = DB
    UpdateOptions.UpdateTableName = 'gastos'
    TableName = 'gastos'
    Left = 72
    Top = 16
    object TbGastosid_gasto: TFDAutoIncField
      FieldName = 'id_gasto'
      Origin = 'id_gasto'
    end
    object TbGastosid_usuario: TIntegerField
      FieldName = 'id_usuario'
      Origin = 'id_usuario'
      Required = True
    end
    object TbGastosid_categoria: TIntegerField
      FieldName = 'id_categoria'
      Origin = 'id_categoria'
      Required = True
    end
    object TbGastosid_moeda: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_moeda'
      Origin = 'id_moeda'
    end
    object TbGastosdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object TbGastosvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 10
      Size = 2
      EditMask = '#,##0.00;-,##0.00;_'
    end
    object TbGastosdata_gasto: TDateField
      FieldName = 'data_gasto'
      Origin = 'data_gasto'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object TbGastosdata_criacao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_criacao'
      Origin = 'data_criacao'
    end
    object TbGastosdata_atualizacao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_atualizacao'
      Origin = 'data_atualizacao'
    end
  end
  object DsGastos: TDataSource
    DataSet = TbGastos
    Left = 72
    Top = 56
  end
  object DsSalario: TDataSource
    DataSet = TbSalario
    Left = 144
    Top = 56
  end
  object TbSalario: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = DB
    UpdateOptions.UpdateTableName = 'salarios'
    TableName = 'salarios'
    Left = 144
    Top = 16
    object TbSalarioid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
    end
    object TbSalarioid_usuario: TIntegerField
      FieldName = 'id_usuario'
      Origin = 'id_usuario'
      Required = True
    end
    object TbSalariovalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 10
      Size = 2
      EditMask = '#,##0.00;-,##0.00;_'
    end
  end
  object DataSource4: TDataSource
    Left = 144
    Top = 192
  end
  object FDTable3: TFDTable
    Connection = DB
    UpdateOptions.UpdateTableName = 'granaflow.usuarios'
    TableName = 'granaflow.usuarios'
    Left = 144
    Top = 152
  end
  object DataSource5: TDataSource
    Left = 72
    Top = 192
  end
  object FDTable4: TFDTable
    Connection = DB
    UpdateOptions.UpdateTableName = 'granaflow.usuarios'
    TableName = 'granaflow.usuarios'
    Left = 72
    Top = 152
  end
  object DsReceita: TDataSource
    DataSet = TbReceita
    Left = 280
    Top = 56
  end
  object TbReceita: TFDTable
    Active = True
    IndexFieldNames = 'id_receita'
    Connection = DB
    UpdateOptions.UpdateTableName = 'receitas'
    TableName = 'receitas'
    Left = 280
    Top = 16
    object TbReceitaid_receita: TFDAutoIncField
      FieldName = 'id_receita'
      Origin = 'id_receita'
    end
    object TbReceitaid_usuario: TIntegerField
      FieldName = 'id_usuario'
      Origin = 'id_usuario'
      Required = True
    end
    object TbReceitaid_moeda: TIntegerField
      FieldName = 'id_moeda'
      Origin = 'id_moeda'
    end
    object TbReceitadescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object TbReceitavalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 10
      Size = 2
      EditMask = '#,##0.00;-,##0.00;_'
    end
    object TbReceitadata_receita: TDateField
      FieldName = 'data_receita'
      Origin = 'data_receita'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object TbReceitadata_criacao: TDateTimeField
      FieldName = 'data_criacao'
      Origin = 'data_criacao'
    end
    object TbReceitadata_atualizacao: TDateTimeField
      FieldName = 'data_atualizacao'
      Origin = 'data_atualizacao'
    end
  end
  object DataSource7: TDataSource
    Left = 216
    Top = 192
  end
  object FDTable6: TFDTable
    Connection = DB
    UpdateOptions.UpdateTableName = 'granaflow.usuarios'
    TableName = 'granaflow.usuarios'
    Left = 216
    Top = 152
  end
  object Qusuarios: TFDQuery
    MasterSource = DsUsuarios
    Connection = DB
    SQL.Strings = (
      'SELECT id_usuario, email, senha FROM usuarios where email = :pEmail')
    Left = 216
    Top = 96
    ParamData = <
      item
        Name = 'PEMAIL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
