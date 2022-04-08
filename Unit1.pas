unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxCheckBox, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxDataUtils;

type
  TForm1 = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Cod: TIntegerField;
    ClientDataSet1Checck: TStringField;
    cxGrid1DBTableView1Cod: TcxGridDBColumn;
    cxGrid1DBTableView1Checck: TcxGridDBColumn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1ChecckPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    procedure MarcaDesmarca(Marca : String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  MarcaDesmarca('S');
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  MarcaDesmarca('N');
end;

procedure TForm1.cxGrid1DBTableView1ChecckPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  ShowMessage('Validate: ' + DisplayValue);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ClientDataSet1.AppendRecord([1, '']);
  ClientDataSet1.AppendRecord([2, '']);
  ClientDataSet1.AppendRecord([3, '']);
  ClientDataSet1.AppendRecord([4, '']);
  ClientDataSet1.AppendRecord([5, '']);
  ClientDataSet1.AppendRecord([6, '']);

  cxGrid1DBTableView1.VisibleColumns[1].Properties.OnValidate :=  cxGrid1DBTableView1ChecckPropertiesValidate;
end;

procedure TForm1.MarcaDesmarca(Marca: String);
var
  r,i: Integer;
begin
  if (not ClientDataSet1.Active) then
    Exit;

  try

    r := cxGrid1DBTableView1.DataController.FocusedRecordIndex;
    cxGrid1DBTableView1.DataController.BeginFullUpdate;
    try
      for i := 0 to cxGrid1DBTableView1.DataController.FilteredRecordCount -1 do
        begin
        cxGrid1DBTableView1.DataController.FocusedRecordIndex := cxGrid1DBTableView1.DataController.FilteredRecordIndex[i];

        cxGrid1DBTableView1.DataController.SetEditValue(cxGrid1DBTableView1Checck.Index, Marca, evsText);
       // cxGrid1DBTableView1.DataController.Post(true);
//        cxGrid1DBTableView1.DataController.Post;
      end;
    finally
      cxGrid1DBTableView1.DataController.FocusedRecordIndex := r;
      cxGrid1DBTableView1.DataController.EndFullUpdate;
    end;
  finally
  end;
end;

end.
