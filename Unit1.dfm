object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 48
    Width = 635
    Height = 251
    Align = alBottom
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1Cod: TcxGridDBColumn
        DataBinding.FieldName = 'Cod'
      end
      object cxGrid1DBTableView1Checck: TcxGridDBColumn
        DataBinding.FieldName = 'Checck'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Properties.OnValidate = cxGrid1DBTableView1ChecckPropertiesValidate
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object BitBtn1: TBitBtn
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 75
    Height = 42
    Align = alLeft
    Caption = 'Marca'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    AlignWithMargins = True
    Left = 84
    Top = 3
    Width = 75
    Height = 42
    Align = alLeft
    Caption = 'Desmarca'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 224
    Top = 120
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      410000009619E0BD010000001800000002000000000003000000410003436F64
      04000100000000000643686563636B0100490000000100055749445448020002
      0001000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 128
    object ClientDataSet1Cod: TIntegerField
      FieldName = 'Cod'
    end
    object ClientDataSet1Checck: TStringField
      FieldName = 'Checck'
      Size = 1
    end
  end
end
