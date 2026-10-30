unit UnitDMDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDMDB = class(TDataModule)
    DB: TFDConnection;
    TbUsuarios: TFDTable;
    DsUsuarios: TDataSource;
    TbGastos: TFDTable;
    DsGastos: TDataSource;
    DsSalario: TDataSource;
    TbSalario: TFDTable;
    DataSource4: TDataSource;
    FDTable3: TFDTable;
    DataSource5: TDataSource;
    FDTable4: TFDTable;
    DsReceita: TDataSource;
    TbReceita: TFDTable;
    DataSource7: TDataSource;
    FDTable6: TFDTable;
    TbGastosid_gasto: TFDAutoIncField;
    TbGastosid_usuario: TIntegerField;
    TbGastosid_categoria: TIntegerField;
    TbGastosid_moeda: TIntegerField;
    TbGastosdescricao: TStringField;
    TbGastosvalor: TBCDField;
    TbGastosdata_gasto: TDateField;
    TbGastosdata_criacao: TDateTimeField;
    TbGastosdata_atualizacao: TDateTimeField;
    TbUsuariosid_usuario: TFDAutoIncField;
    TbUsuariosnome: TStringField;
    TbUsuariosemail: TStringField;
    TbUsuariossenha: TStringField;
    TbUsuariosid_moeda: TIntegerField;
    TbUsuariosdata_criacao: TDateTimeField;
    TbUsuariosdata_atualizacao: TDateTimeField;
    TbReceitaid_receita: TFDAutoIncField;
    TbReceitaid_usuario: TIntegerField;
    TbReceitaid_moeda: TIntegerField;
    TbReceitadescricao: TStringField;
    TbReceitavalor: TBCDField;
    TbReceitadata_receita: TDateField;
    TbReceitadata_criacao: TDateTimeField;
    TbReceitadata_atualizacao: TDateTimeField;
    TbSalarioid: TFDAutoIncField;
    TbSalarioid_usuario: TIntegerField;
    TbSalariovalor: TBCDField;
    Qusuarios: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDB: TDMDB;
  UsuarioLogadoId: Integer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
