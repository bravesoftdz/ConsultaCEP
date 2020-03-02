unit BuscaCEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Vcl.StdCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.OleCtrls, SHDocVw;

type
  TForm1 = class(TForm)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    memo: TMemo;
    Label1: TLabel;
    btnBuscar: TSpeedButton;
    edtCEP: TEdit;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    WebBrowser1: TWebBrowser;
    procedure btnBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

Uses System.JSON;
{$R *.dfm}

procedure TForm1.btnBuscarClick(Sender: TObject);
var
  Objeto: TJSONObject;
  estado: string;

begin
  edtCEP.SetFocus;
  RESTRequest.Params.AddUrlSegment('CEP', edtCEP.Text);
  RESTRequest.Execute;
  memo.Lines.Clear;

  Objeto := RESTResponse.JSONValue as TJSONObject;
  memo.Text := 'CEP: ' + edtCEP.Text;
  estado := ('Estado: ' + Objeto.GetValue('uf').Value);
  memo.Lines.Add('Bairro: ' + Objeto.GetValue('bairro').Value);
  memo.Lines.Add('Rua: ' + Objeto.GetValue('logradouro').Value);
  memo.Lines.Add('Cidade: ' + Objeto.GetValue('localidade').Value + ' - ' + estado);
  ShowMessage(Objeto.ToJSON);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
edtCEP.SetFocus;
end;

end.
