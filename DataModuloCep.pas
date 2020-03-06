unit DataModuloCep;

interface

uses
  System.SysUtils, System.Classes, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TmdCep = class(TDataModule)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    DataCEP: TDataSource;
    QueryCEP: TFDQuery;
    fd: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDTable: TFDTable;
    FDTableid: TFDAutoIncField;
    FDTablecep: TStringField;
    FDTableestado: TStringField;
    FDTablebairro: TStringField;
    FDTablecidade: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mdCep: TmdCep;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TmdCep.DataModuleCreate(Sender: TObject);
begin
  RESTClient.BaseURL := 'https://viacep.com.br/ws';
  fd.Connected := True;
end;

end.
