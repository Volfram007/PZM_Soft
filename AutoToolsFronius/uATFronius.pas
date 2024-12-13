unit uATFronius;

{ Если мобильник не найден
  1) Запустите CMD promt от имени администратора.
  2) Введите команду "netsh winsock reset"
  3) перезагрузите компьютер, если это необходимо

  Если компиляция с ошибками
  Удалить блоки из ХХХ.dproj
  <EnabledSysJars> ... </EnabledSysJars>

  Для отключения splash image на Android в Delphi FMX, выполните следующие шаги:
  Отключение splash_image_def.xml в Deployment Manager:
  В вашем проекте перейдите в раздел Project > Deployment, чтобы открыть "Deployment Manager".
  В "Deployment Manager" выберите конфигурацию "Debug configuration – Android platform". Отключите splash_image_def.xml.
  Этот файл указывает Android, как разместить изображение Splash на основе опций "Splash tile mode" и "Splash gravity",
  установленных в настройках проекта Android. После отключения этого файла, эти опции будут проигнорированы, и изображение
  будет отображаться, заполняя экран​1​.
  Снятие флажка "Include splash image":
  В некоторых источниках утверждается, что для отключения splash screen необходимо снять флажок "Include splash image" в настройках проекта
}
interface

uses

{$IF defined(MSWINDOWS)}  // FMX.Grid.Style, FMX.Grid,  System.Variants,
  Winapi.Windows, Winapi.ShellAPI,
{$ELSEIF Defined(ANDROID)}
  Androidapi.JNI.GraphicsContentViewText, Androidapi.Helpers, Androidapi.JNI.Os,
  FMX.DialogService.Async,

{$ELSEIF defined(IOS)} // and NOT defined(CPUARM)
  // FMX.Helpers.iOS, iOSapi.Foundation,
{$ENDIF}
  {System.Diagnostics,}   {FMX.Grid.Style, FMX.Grid}
  System.Types, System.Rtti, System.Classes, System.Actions, System.JSON,
  FMX.DialogService, System.Permissions,

  System.Math, System.UITypes, FMX.Dialogs, FMX.Forms, System.Masks,
  System.NetEncoding, System.SysUtils, System.IOUtils, FMX.Platform,
  FMX.Memo.Types, FMX.TabControl, FMX.ActnList, FMX.Types, FMX.Gestures,
  FMX.Controls, FMX.Effects, FMX.StdCtrls, FMX.ListBox, FMX.Edit, FMX.ComboEdit,
  FMX.ScrollBox, FMX.Memo, FMX.NumberBox, FMX.EditBox, FMX.SpinBox, FMX.Layouts,
  FMX.Controls.Presentation;

type
  TfATFronius = class(TForm)
    TabControl: TTabControl;
    TabFronius1: TTabItem;
    F1Control1: TTabControl;
    TabItem1: TTabItem;
    ToolBar1: TToolBar;
    TitleStatus1: TLabel;
    btnNext1: TSpeedButton;
    TabItem2: TTabItem;
    ToolBar2: TToolBar;
    lblTitle1: TLabel;
    btnBack: TSpeedButton;
    TabFronius2: TTabItem;
    TabTools: TTabItem;
    TabAbout: TTabItem;
    ToolBar5: TToolBar;
    TitleAbout: TLabel;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    Fronius1Next: TNextTabAction;
    Fronius1Back: TPreviousTabAction;
    GetUpdate: TSpeedButton;
    ScrollBox1: TScrollBox;
    ScrollBox3: TScrollBox;
    F2Control1: TTabControl;
    TabItem3: TTabItem;
    ToolBar6: TToolBar;
    TitleStatus2: TLabel;
    btnNext2: TSpeedButton;
    ScrollBox2: TScrollBox;
    TabItem4: TTabItem;
    ToolBar7: TToolBar;
    lblTitle2: TLabel;
    SpeedButton2: TSpeedButton;
    BlurEffect: TBlurEffect;
    FlowLayout1: TFlowLayout;
    Label1: TLabel;
    ProductAngle: TSpinBox;
    Label2: TLabel;
    LabDiameter: TLabel;
    FinishedDiameter: TLabel;
    Diameter: TSpinBox;
    Label4: TLabel;
    Label5: TLabel;
    SpdWeld: TSpinBox;
    Label6: TLabel;
    Label7: TLabel;
    Thickness: TSpinBox;
    Label8: TLabel;
    Label9: TLabel;
    ArcLength: TSpinBox;
    Label10: TLabel;
    Label11: TLabel;
    NewStep: TLabel;
    StepSize: TSpinBox;
    Label12: TLabel;
    Label13: TLabel;
    Scales: TSpinBox;
    Label14: TLabel;
    Label15: TLabel;
    DeltaCurrent: TSpinBox;
    Label16: TLabel;
    Label17: TLabel;
    LinearEnergy: TSpinBox;
    Label18: TLabel;
    FlowLayout2: TFlowLayout;
    FlowLayout3: TFlowLayout;
    Label100: TLabel;
    ProductAngle2: TSpinBox;
    Label101: TLabel;
    LabDiameter2: TLabel;
    FinishedDiameter2: TLabel;
    Diameter2: TSpinBox;
    Label103: TLabel;
    Label104: TLabel;
    SpdWeld2: TSpinBox;
    Label105: TLabel;
    Label106: TLabel;
    Thickness2: TSpinBox;
    Label107: TLabel;
    Label108: TLabel;
    ArcLength2: TSpinBox;
    Label109: TLabel;
    Label110: TLabel;
    NewStep2: TLabel;
    StepSize2: TSpinBox;
    Label111: TLabel;
    Label112: TLabel;
    Scales2: TSpinBox;
    Label113: TLabel;
    Label114: TLabel;
    DeltaCurrent2: TSpinBox;
    Label115: TLabel;
    Label116: TLabel;
    LinearEnergy2: TSpinBox;
    Label117: TLabel;
    FlowLayout9: TFlowLayout;
    Label39: TLabel;
    sDeltaWire: TSpinBox;
    Label40: TLabel;
    Label139: TLabel;
    sDeltaWire2: TSpinBox;
    Label140: TLabel;
    mAbout: TMemo;
    mLog: TMemo;
    Splitter1: TSplitter;
    ScrollBox4: TScrollBox;
    FlowLayout4: TFlowLayout;
    Label46: TLabel;
    ThicknessCoefficient: TSpinBox;
    Label47: TLabel;
    PulseTimeToBackground: TSpinBox;
    Label48: TLabel;
    Label49: TLabel;
    RippleFrequency: TSpinBox;
    Label50: TLabel;
    Label51: TLabel;
    DeltaWire: TSpinBox;
    Label52: TLabel;
    Label53: TLabel;
    DeltaWireHeating: TSpinBox;
    Label54: TLabel;
    GroupBox1: TGroupBox;
    FeedCoeff: TSpinBox;
    Label55: TLabel;
    LabWire: TLabel;
    Wire: TComboEdit;
    Label56: TLabel;
    ScrollBox5: TScrollBox;
    FlowLayout12: TFlowLayout;
    Label93: TLabel;
    ThicknessCoefficient2: TSpinBox;
    Label96: TLabel;
    PulseTimeToBackground2: TSpinBox;
    Label97: TLabel;
    Label98: TLabel;
    RippleFrequency2: TSpinBox;
    Label99: TLabel;
    Label57: TLabel;
    DeltaWire2: TSpinBox;
    Label58: TLabel;
    Label59: TLabel;
    DeltaWireHeating2: TSpinBox;
    Label60: TLabel;
    Save2: TButton;
    GroupBox2: TGroupBox;
    FeedCoeff2: TSpinBox;
    Label61: TLabel;
    Label62: TLabel;
    Wire2: TComboEdit;
    Label63: TLabel;
    PanelComment: TPanel;
    Comment: TMemo;
    Panel8: TPanel;
    SaveMacros: TButton;
    bClose: TButton;
    Panel5: TPanel;
    Label64: TLabel;
    Diametr: TSpinBox;
    Label65: TLabel;
    Dlina: TSpinBox;
    Label3: TLabel;
    flowRateGas: TSpinBox;
    ResultGas: TLabel;
    Label92: TLabel;
    Panel7: TPanel;
    ListBox: TListBox;
    Memo: TMemo;
    Fronius2Next: TNextTabAction;
    Fronius2Back: TPreviousTabAction;
    ShowLogging: TCheckBox;
    ShowLogging2: TCheckBox;
    Label19: TLabel;
    Outward: TSwitch;
    lblWeldType: TLabel;
    WeldingType: TSwitch;
    Label21: TLabel;
    Voltage: TNumberBox;
    Label22: TLabel;
    Label23: TLabel;
    CurrentPulse: TNumberBox;
    Label24: TLabel;
    Label25: TLabel;
    CurrentBackground: TNumberBox;
    Label26: TLabel;
    Label27: TLabel;
    PulseTime: TNumberBox;
    Label28: TLabel;
    Label29: TLabel;
    BackgroundTime: TNumberBox;
    Label30: TLabel;
    Label31: TLabel;
    WirePulse: TNumberBox;
    Label32: TLabel;
    Label33: TLabel;
    WireBackground: TNumberBox;
    Label34: TLabel;
    Label35: TLabel;
    HeatingPulse: TNumberBox;
    Label36: TLabel;
    Label37: TLabel;
    HeatingBackground: TNumberBox;
    Label38: TLabel;
    Label118: TLabel;
    Outward2: TSwitch;
    lblWeldType2: TLabel;
    WeldingType2: TSwitch;
    Label120: TLabel;
    TwoSources: TSwitch;
    Label121: TLabel;
    Voltage2: TNumberBox;
    Label122: TLabel;
    Label123: TLabel;
    CurrentPulse2: TNumberBox;
    Label124: TLabel;
    Label125: TLabel;
    CurrentBackground2: TNumberBox;
    Label126: TLabel;
    Label127: TLabel;
    PulseTime2: TNumberBox;
    Label128: TLabel;
    Label129: TLabel;
    BackgroundTime2: TNumberBox;
    Label130: TLabel;
    Label131: TLabel;
    WirePulse2: TNumberBox;
    Label132: TLabel;
    Label133: TLabel;
    WireBackground2: TNumberBox;
    Label134: TLabel;
    Label135: TLabel;
    HeatingPulse2: TNumberBox;
    Label136: TLabel;
    Label137: TLabel;
    HeatingBackground2: TNumberBox;
    Label138: TLabel;
    SpeedButton1: TSpeedButton;
    cbStopwatch: TCheckBox;
    cbStopwatch2: TCheckBox;
    BrandElectrode: TComboBox;
    BrandElectrode2: TComboBox;
    Panel1: TPanel;
    Label20: TLabel;
    sbD1: TSpinBox;
    Label69: TLabel;
    sbD2: TSpinBox;
    Label71: TLabel;
    sbL: TSpinBox;
    Label70: TLabel;
    AverageСurrent: TSpinBox;
    Label41: TLabel;
    WireAverage: TNumberBox;
    Label42: TLabel;
    AveragePuls: TNumberBox;
    Label43: TLabel;
    HeatingMedium: TNumberBox;
    Label44: TLabel;
    NumberPasses: TSpinBox;
    Label45: TLabel;
    F1: TSpinBox;
    LabF1: TLabel;
    D1: TSpinBox;
    LabD1: TLabel;
    EnergyCurrent: TSwitch;
    Label66: TLabel;
    SaveWeldSettings: TComboBox;
    bSave: TButton;
    bDel: TButton;
    AddComment: TButton;
    AverageСurrent2: TSpinBox;
    Label141: TLabel;
    WireAverage2: TNumberBox;
    Label142: TLabel;
    AveragePuls2: TNumberBox;
    Label143: TLabel;
    HeatingMedium2: TNumberBox;
    Label144: TLabel;
    NumberPasses2: TSpinBox;
    Label145: TLabel;
    F2: TSpinBox;
    LabF2: TLabel;
    D2: TSpinBox;
    LabD2: TLabel;
    EnergyCurrent2: TSwitch;
    Label68: TLabel;
    SaveWeldSettings2: TComboBox;
    bSave2: TButton;
    bDel2: TButton;
    AddComment2: TButton;
    mAdd2: TMemo;
    GroupBox4: TGroupBox;
    EditCurrents: TEdit;
    EditVoltages: TEdit;
    Label72: TLabel;
    Label73: TLabel;
    GroupBox3: TGroupBox;
    EditCurrents2: TEdit;
    EditVoltages2: TEdit;
    Label74: TLabel;
    Label75: TLabel;
    SpinLinearEnergy: TSpinBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label76: TLabel;
    SpinLinearEnergy2: TSpinBox;
    FindLinearEnergy: TLabel;
    Save1: TButton;
    Button5: TButton;
    mAdd: TMemo;
    PasteSimvol1: TButton;
    PasteSimvol2: TButton;
    StyleBook1: TStyleBook;
    procedure CopyTextToClipboard(const AText: string);
    procedure UpdateFronius1;
    procedure UpdateFronius2;
    Procedure mLogAdd(LogText: String; NumbFronius: Byte);
    Procedure LoadWeldSettings;
    procedure DirSearch(Dir: String; Mask: String; SL: TStrings);
    procedure ProductAngleClick(Sender: TObject);
    procedure SaveWeldSettingsChange(Sender: TObject);
    procedure DiameterClick(Sender: TObject);
    procedure DiameterDblClick(Sender: TObject);
    procedure SpdWeldClick(Sender: TObject);
    procedure ThicknessClick(Sender: TObject);
    procedure ArcLengthClick(Sender: TObject);
    procedure StepSizeClick(Sender: TObject);
    procedure ScalesClick(Sender: TObject);
    procedure DeltaCurrentClick(Sender: TObject);
    procedure LinearEnergyClick(Sender: TObject);
    procedure NumberPassesClick(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure SaveWeldSettingsClosePopup(Sender: TObject);
    procedure SaveWeldSettingsPopup(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure AddCommentClick(Sender: TObject);
    procedure sDeltaWireClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ThicknessCoefficientClick(Sender: TObject);
    procedure DeltaWireClick(Sender: TObject);
    procedure DeltaWireHeatingClick(Sender: TObject);
    procedure FeedCoeffClick(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormSaveState(Sender: TObject);
    procedure ProductAngle2Click(Sender: TObject);
    procedure Diameter2Click(Sender: TObject);
    procedure SpdWeld2Click(Sender: TObject);
    procedure Thickness2Click(Sender: TObject);
    procedure ArcLength2Click(Sender: TObject);
    procedure StepSize2Click(Sender: TObject);
    procedure Scales2Click(Sender: TObject);
    procedure DeltaCurrent2Click(Sender: TObject);
    procedure LinearEnergy2Click(Sender: TObject);
    procedure SaveWeldSettings2ClosePopup(Sender: TObject);
    procedure SaveWeldSettings2Popup(Sender: TObject);
    procedure DiametrClick(Sender: TObject);
    procedure DlinaClick(Sender: TObject);
    procedure DiametrChange(Sender: TObject);
    procedure ListBoxItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure mLogDblClick(Sender: TObject);
    procedure GetUpdateClick(Sender: TObject);
    procedure AverageСurrentEnter(Sender: TObject);
    procedure AverageСurrent2Click(Sender: TObject);
    procedure bSave2Click(Sender: TObject);
    procedure bDel2Click(Sender: TObject);
    procedure SaveWeldSettings2Change(Sender: TObject);
    procedure AddComment2Click(Sender: TObject);
    procedure SaveMacrosClick(Sender: TObject);
    procedure AverageСurrentClick(Sender: TObject);
    procedure F2Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure NumberPasses2Click(Sender: TObject);
    procedure FormTouch(Sender: TObject; const Touches: TTouches;
      const Action: TTouchAction);
    procedure TitleAboutClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure AverageСurrent2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure AverageСurrent2Enter(Sender: TObject);
    procedure ProductAngle2Change(Sender: TObject);
    procedure ProductAngleChange(Sender: TObject);
    procedure AverageСurrentMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure MemoViewportPositionChange(Sender: TObject;
      const OldViewportPosition, NewViewportPosition: TPointF;
      const ContentSizeChanged: Boolean);
    procedure sbD1Change(Sender: TObject);
    procedure sbD1Click(Sender: TObject);
    procedure sbD2Click(Sender: TObject);
    procedure sbLClick(Sender: TObject);
    procedure SaveWeldSettingsDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EditCurrentsClick(Sender: TObject);
    procedure EditVoltagesClick(Sender: TObject);
    procedure EditCurrents2Click(Sender: TObject);
    procedure EditVoltages2Click(Sender: TObject);
    procedure ShowLoggingClick(Sender: TObject);
    procedure ShowLogging2Click(Sender: TObject);
    procedure flowRateGasClick(Sender: TObject);
    procedure PasteSimvol1Click(Sender: TObject);
    procedure PasteSimvol2Click(Sender: TObject);
  private
  { Private declarations }
    Const
    // License = '2025'; // Лицензия работы программы
    Epsilon = 0.03;

  Var
    // LicBool: Boolean;
    FDirPath: String;
    LoadErr: String;
    Run: Boolean;
  public
    { Public declarations }
  end;

var
  fATFronius: TfATFronius;

implementation

{$R *.fmx}

// Процедура для копирования текста в буфер обмена
procedure TfATFronius.CopyTextToClipboard(const AText: string);
// Объявление переменной для работы с сервисом буфера обмена
var
  ClipboardSvc: IFMXClipboardService;
begin
  // Проверка наличия поддержки сервиса буфера обмена в текущей платформе
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService,
    ClipboardSvc) then
  begin
    // Копирование текста в буфер обмена, если сервис доступен
    ClipboardSvc.SetClipboard(AText);
  end;
end;

// Процедура для добавления свойства в объект JSON, если значение свойства не пустое
procedure AddJsonProperty(JSONObject: TJSONObject;
  const PropertyName, PropertyValue: string);
begin
  // Проверка, что значение свойства не пустое
  if PropertyValue <> '' then
    // Добавление пары имя/значение свойства в объект JSON
    JSONObject.AddPair(PropertyName, PropertyValue);
end;

// Функция для извлечения значения из файла JSON по заданному имени поля
function GetValueFromJSONFile(const FileName, FieldName: string): string;
var
  JSONString: string; // Переменная для хранения содержимого файла JSON
begin
  Result := ''; // Инициализация результата пустой строкой

  // Проверка существования файла
  if not TFile.Exists(FileName) then
    Exit; // Выход из функции, если файл не существует

  // Чтение содержимого файла JSON в строку
  JSONString := TFile.ReadAllText(FileName);

  // Разбор содержимого файла JSON и извлечение значения заданного поля
  with TJSONObject.ParseJSONValue(JSONString) do
    try
      // Получение значения заданного поля и присвоение его результату
      Result := GetValue<string>(FieldName);
    finally
      // Освобождение ресурсов, занятых объектом JSON
      Free;
    end;
end;

function CalculatePenetrationDepth(I, K, V, S: Double): String;
begin
  Result := FloatToStrF((I * K * 6) / (V * S), ffNumber, 4, 3);
end;

function DepthOfPenetration(I, V, K: Double): String;
begin
  Result := FloatToStrF(K * Sqrt(I / V), ffNumber, 4, 3);
end;

function CalcSteps(InnerDiameter, OuterDiameter, StepSize: Double): Integer;
begin
  Result := Abs(Ceil((OuterDiameter - InnerDiameter) / 2 / StepSize));
end;

// Процедура для добавления текста в лог в зависимости от значения параметра NumbFronius
Procedure TfATFronius.mLogAdd(LogText: String; NumbFronius: Byte);
Begin
  // Начало обновления компонента многострочного текста
  mLog.Lines.BeginUpdate;

  // Выбор действия в зависимости от значения параметра NumbFronius
  case NumbFronius of
    1:
      Begin
        // Выход из процедуры, если чекбокс ShowLogging не отмечен
        if not ShowLogging.IsChecked then
          Exit;

        // Вставка текста LogText в начало многострочного компонента
        mLog.Lines.Insert(0, LogText);

        // Установка курсора на начало текста
        mLog.SelStart := 1;
      End;
    2:
      Begin
        // Выход из процедуры, если чекбокс ShowLogging2 не отмечен
        if not ShowLogging2.IsChecked then
          Exit;

        // Вставка текста LogText в начало многострочного компонента (аналогично случаю 1)
        mLog.Lines.Insert(0, LogText);

        // Установка курсора на начало текста (аналогично случаю 1)
        mLog.SelStart := 1;
      End;
  end;

  // Завершение обновления компонента многострочного текста
  mLog.Lines.EndUpdate;
End;

procedure TfATFronius.mLogDblClick(Sender: TObject);
begin
  mLog.Lines.Clear;
end;

procedure TfATFronius.NumberPasses2Click(Sender: TObject);
begin
  NumberPasses2.SelectAll;
end;

procedure TfATFronius.NumberPassesClick(Sender: TObject);
begin
  NumberPasses.SelectAll;
end;

procedure TfATFronius.Save1Click(Sender: TObject);
// Объявление объекта для записи в двоичный поток
// var
// W: TBinaryWriter;
begin
  EditCurrents.Text := '30 80 90 100 125 150 200 250';
  EditVoltages.Text := '8.7 9.2 9.4 9.5 10.6 10.9 12.8 14.6';
  EditCurrents2.Text := '100 150 200 250 300 350 400 450';
  EditVoltages2.Text := '9.3 9.9 11 12.1 13 14.2 15.2 16.4';
  Save1.SetFocus;
  Save2.SetFocus;
  { // Очистка потока перед записью
    SaveState.Stream.Clear;
    // Создание объекта для записи в поток
    W := TBinaryWriter.Create(SaveState.Stream);
    try
    // Сохранение параметров в поток
    W.Write(LoadErr); // Загрузка ошибки
    W.Write(Diameter.Text);
    W.Write(SpdWeld.Text);
    W.Write(Thickness.Text);
    W.Write(StepSize.Text);
    W.Write(ArcLength.Text);
    W.Write(DeltaCurrent.Text);
    W.Write(LinearEnergy.Text);
    W.Write(Wire.Items.Text);
    W.Write(ThicknessCoefficient.Text);
    W.Write(Scales.Text);
    W.Write(lblWeldType.Text);
    W.Write(WeldingType.IsChecked);
    W.Write(F1.Value);
    W.Write(D1.Value);
    W.Write(FeedCoeff.Value);
    W.Write(Comment.Text);
    // Настройки контроля высоты
    W.Write('30 80 90 100 125 150 200 250 250 250 250');
    W.Write('8.7 9.2 9.4 9.5 10.6 10.9 12.8 14.6 14.6 14.6 14.6');
    // Сохранение параметров сварки для второго набора параметров
    W.Write(Diameter2.Text);
    W.Write(SpdWeld2.Text);
    W.Write(Thickness2.Text);
    W.Write(StepSize2.Text);
    W.Write(ArcLength2.Text);
    W.Write(DeltaCurrent2.Text);
    W.Write(LinearEnergy2.Text);
    W.Write(Wire2.Items.Text);
    W.Write(ThicknessCoefficient2.Text);
    W.Write(Scales2.Text);
    W.Write(lblWeldType2.Text);
    W.Write(WeldingType2.IsChecked);
    W.Write(F2.Value);
    W.Write(D2.Value);
    W.Write(FeedCoeff.Value);
    W.Write(Comment.Text);

    // Настройки контроля высоты
    W.Write('100 150 200 250 300 350 400 450 450 450 450');
    W.Write('9.3 9.9 11 12.1 13 14.2 15.2 16.4 16.4 16.4 16.4');
    finally
    // Освобождение ресурсов, занятых объектом для записи
    W.Free;
    end; }
end;

// Процедура для рекурсивного поиска файлов в директории с заданным маской
procedure TfATFronius.DirSearch(Dir: String; Mask: String; SL: TStrings);
var
  // Структура для хранения информации о найденном файле/директории
  SearchRec: TSearchRec;
begin
  // Убедиться, что путь заканчивается обратным слешем
  Dir := IncludeTrailingBackSlash(Dir);
  // Начать поиск всех файлов и директорий
  if FindFirst(Dir + '*.*', faAnyFile, SearchRec) = 0 then
    repeat
      // Обработать сообщения приложения (например, для предотвращения "зависания")
      Application.ProcessMessages;

      // Если найденный элемент является директорией
      if (SearchRec.Attr and faDirectory) <> 0 then
      begin
        // Исключить текущую и родительскую директории
        if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
          // Рекурсивный вызов для поиска в поддиректории
          DirSearch(Dir + SearchRec.name, Mask, SL)
      end
      else // Если найденный элемент соответствует маске
        if MatchesMask(ExtractFileName(SearchRec.name), Mask) then
        Begin
          // Добавить имя найденного файла (без расширения) в список
          SL.Add(ChangeFileExt(SearchRec.name, ''));
        End;
      // Продолжать, пока есть что искать
    until FindNext(SearchRec) <> 0;
  FindClose(SearchRec); // Закрыть поиск
end;

// Процедура для загрузки настроек сварки из файлов в указанной директории
Procedure TfATFronius.LoadWeldSettings;
var
  // Функция сравнения для сортировки
  Compare: TFMXObjectSortCompare;
Begin
  // Сортировка списка в ListBox по алфавиту
  Compare := function(Item1, Item2: TFmxObject): Integer
    begin
      if TListBoxItem(Item1).Text = TListBoxItem(Item2).Text then
        Result := 0
      else if TListBoxItem(Item1).Text > TListBoxItem(Item2).Text then
        Result := 1
      else
        Result := -1;
    end;

  // Загрузка и сортировка настроек для первого набора параметров
  SaveWeldSettings.Clear;
  DirSearch(FDirPath, '*.fr1', SaveWeldSettings.Items);
  SaveWeldSettings.Sort(Compare);

  // Загрузка и сортировка настроек для второго набора параметров
  SaveWeldSettings2.Clear;
  DirSearch(FDirPath, '*.fr2', SaveWeldSettings2.Items);
  SaveWeldSettings2.Sort(Compare);
End;

// Процедура для сохранения текущих настроек сварки в файл
procedure TfATFronius.SaveMacrosClick(Sender: TObject);
Var
  // Строка для хранения имени файла или других временных данных
  Str: String;
  // Объект для формирования JSON-структуры настроек
  JSONObject: TJSONObject;
begin
  // Сохранение настроек для первого набора параметров (если активна соответствующая вкладка)
  if TabControl.ActiveTab.Text = 'Fronius 1' then
  Begin
    if SaveWeldSettings.ItemIndex < 0 then
      Str := ''
    else
      Str := SaveWeldSettings.Items.Strings[SaveWeldSettings.ItemIndex];

    InputBox('Сохранение настроек программы', 'Название настроек', Str,
      procedure(const AResult: TModalResult; const AValue: String)
      begin
        if (AValue <> '') and (AResult = mrOk) then
        Begin
          JSONObject := TJSONObject.Create;
          try
            // Наклон изделия
            JSONObject.AddPair(TJSONPair.Create('ProductAngle',
              ProductAngle.Text));
            // Диаметр изделия
            JSONObject.AddPair(TJSONPair.Create('Diameter', Diameter.Text));
            // Скорость сварки
            JSONObject.AddPair(TJSONPair.Create('SpdWeld', SpdWeld.Text));
            // Толщина наплавки
            JSONObject.AddPair(TJSONPair.Create('Thickness', Thickness.Text));
            // Длинна дуги
            JSONObject.AddPair(TJSONPair.Create('ArcLength', ArcLength.Text));
            // Шаг сварки
            JSONObject.AddPair(TJSONPair.Create('StepSize', StepSize.Text));
            // Частота импульса
            JSONObject.AddPair(TJSONPair.Create('Scales', Scales.Text));
            // Дельта тока
            JSONObject.AddPair(TJSONPair.Create('DeltaCurrent',
              DeltaCurrent.Text));
            // Погонная энергия
            JSONObject.AddPair(TJSONPair.Create('LinearEnergy',
              LinearEnergy.Text));
            // Дельта подачи проволоки
            JSONObject.AddPair(TJSONPair.Create('DeltaWire', sDeltaWire.Text));
            // Средний ток
            JSONObject.AddPair(TJSONPair.Create('AverageCurrent',
              AverageСurrent.Text));
            // Движение наплавки (Из нутри/С наружи)
            JSONObject.AddPair(TJSONPair.Create('Outward',
              BoolToStr(Outward.IsChecked)));
            // Название Label Кольцевая/Линейная
            // JSONObject.AddPair(TJSONPair.Create('lblWeldType',
            // lblWeldType.Text));
            // Тип Кольцевая/Линейная
            JSONObject.AddPair(TJSONPair.Create('WeldingType',
              BoolToStr(WeldingType.IsChecked)));
            // Через (Погонная энергия/Ток)
            JSONObject.AddPair(TJSONPair.Create('EnergyCurrent',
              BoolToStr(EnergyCurrent.IsChecked)));
            // Для расчета длины
            JSONObject.AddPair(TJSONPair.Create('F1', F1.Text));
            // Для расчета ширины
            JSONObject.AddPair(TJSONPair.Create('D1', D1.Text));
            // Коэфициент положения для наплавки в положении (0,5 или 0,6)
            JSONObject.AddPair(TJSONPair.Create('ThicknessCoefficient',
              ThicknessCoefficient.Text));
            // Поправочный коэффициент при установки сторонего двигателя
            JSONObject.AddPair(TJSONPair.Create('FeedCoeff', FeedCoeff.Text));
            // Диаметр проволоки
            JSONObject.AddPair(TJSONPair.Create('Wire',
              IntToStr(Wire.ItemIndex)));
            Str := TNetEncoding.Base64.Encode(Comment.Text);
            JSONObject.AddPair(TJSONPair.Create('Comment', Str));

            // CopyTextToClipboard(JSONObject.ToString);
            TFile.WriteAllText(FDirPath + AValue + '.fr1', JSONObject.ToString);

            SaveWeldSettings.ItemIndex :=
              SaveWeldSettings.Items.IndexOf(AValue);
          finally

            JSONObject.Free;
          end;
          // TFile.WriteAllText(FDirPath + AValue + '.fr1', JSONString);

          // Обновляем список
          LoadWeldSettings;
          // Выбераем сохранённые настройки
          SaveWeldSettings.ItemIndex := SaveWeldSettings.Items.IndexOf(AValue);
          mLogAdd('Создан режим ' + AValue + '.fr1', 1);
        End;
      End);
  End;

  // Сохранение настроек для второго набора параметров (если активна соответствующая вкладка)
  if TabControl.ActiveTab.Text = 'Fronius 2' then
  Begin
    if SaveWeldSettings2.ItemIndex < 0 then
      Str := ''
    else
      Str := SaveWeldSettings2.Items.Strings[SaveWeldSettings2.ItemIndex];

    InputBox('Сохранение настроек программы', 'Название настроек', Str,
      procedure(const AResult: TModalResult; const AValue: String)
      begin
        if (AValue <> '') and (AResult = mrOk) then
        Begin
          JSONObject := TJSONObject.Create;
          try
            // Наклон изделия
            JSONObject.AddPair(TJSONPair.Create('ProductAngle',
              ProductAngle2.Text));
            // Диаметр изделия
            JSONObject.AddPair(TJSONPair.Create('Diameter', Diameter2.Text));
            // Скорость сварки
            JSONObject.AddPair(TJSONPair.Create('SpdWeld', SpdWeld2.Text));
            // Толщина наплавки
            JSONObject.AddPair(TJSONPair.Create('Thickness', Thickness2.Text));
            // Длинна дуги
            JSONObject.AddPair(TJSONPair.Create('ArcLength', ArcLength2.Text));
            // Шаг сварки
            JSONObject.AddPair(TJSONPair.Create('StepSize', StepSize2.Text));
            // Частота импульса
            JSONObject.AddPair(TJSONPair.Create('Scales', Scales2.Text));
            // Дельта тока
            JSONObject.AddPair(TJSONPair.Create('DeltaCurrent',
              DeltaCurrent2.Text));
            // Погонная энергия
            JSONObject.AddPair(TJSONPair.Create('LinearEnergy',
              LinearEnergy2.Text));
            // Дельта подачи проволоки
            JSONObject.AddPair(TJSONPair.Create('DeltaWire', sDeltaWire2.Text));
            // Средний ток
            JSONObject.AddPair(TJSONPair.Create('AverageCurrent',
              AverageСurrent2.Text));
            // Движение наплавки (Из нутри/С наружи)
            JSONObject.AddPair(TJSONPair.Create('Outward',
              BoolToStr(Outward2.IsChecked)));
            // Название Label Кольцевая/Линейная
            // JSONObject.AddPair(TJSONPair.Create('lblWeldType',
            // lblWeldType.Text));
            // Тип Кольцевая/Линейная
            JSONObject.AddPair(TJSONPair.Create('WeldingType',
              BoolToStr(WeldingType2.IsChecked)));
            // Тип головы
            JSONObject.AddPair(TJSONPair.Create('TwoSources',
              BoolToStr(TwoSources.IsChecked)));
            // Через (Погонная энергия/Ток)
            JSONObject.AddPair(TJSONPair.Create('EnergyCurrent',
              BoolToStr(EnergyCurrent2.IsChecked)));
            // Для расчета длины
            JSONObject.AddPair(TJSONPair.Create('F2', F2.Text));
            // Для расчета ширины
            JSONObject.AddPair(TJSONPair.Create('D2', D2.Text));
            // Коэфициент положения для наплавки в положении (0,5 или 0,6)
            JSONObject.AddPair(TJSONPair.Create('ThicknessCoefficient',
              ThicknessCoefficient2.Text));
            // Поправочный коэффициент при установки сторонего двигателя
            JSONObject.AddPair(TJSONPair.Create('FeedCoeff', FeedCoeff2.Text));
            // Диаметр проволоки
            JSONObject.AddPair(TJSONPair.Create('Wire',
              IntToStr(Wire2.ItemIndex)));
            Str := TNetEncoding.Base64.Encode(Comment.Text);
            JSONObject.AddPair(TJSONPair.Create('Comment', Str));

            // CopyTextToClipboard(JSONObject.ToString);
            TFile.WriteAllText(FDirPath + AValue + '.fr2', JSONObject.ToString);

            SaveWeldSettings2.ItemIndex :=
              SaveWeldSettings2.Items.IndexOf(AValue);
          finally
            JSONObject.Free;
          end;

          // Обновляем список
          LoadWeldSettings;
          // Выбераем сохранённые настройки
          SaveWeldSettings2.ItemIndex :=
            SaveWeldSettings2.Items.IndexOf(AValue);
          mLogAdd('Создан режим ' + AValue + '.fr2', 2);
        End;
      End);
  End;

  // Обновление интерфейса после сохранения настроек
  PanelComment.Visible := False;
  TabControl.Enabled := True;
  BlurEffect.Enabled := False;
end;

procedure TfATFronius.SaveWeldSettingsChange(Sender: TObject);
Var
  FFileName: String;
begin
  Run := True; // TabControl.ActiveTab.Text
  if TabControl.ActiveTab.Text = 'Fronius 1' then
  Begin
    if (SaveWeldSettings.ItemIndex > -1) then
    Begin
      if FileExists(FDirPath + SaveWeldSettings.Items
        [SaveWeldSettings.ItemIndex] + '.fr1') then
      begin
        // ShowMessage('Load');
        FFileName := FDirPath + SaveWeldSettings.Items
          [SaveWeldSettings.ItemIndex] + '.fr1';
        Try
          // Наклон изделия
          ProductAngle.Text := GetValueFromJSONFile(FFileName, 'ProductAngle');
          // Диаметр изделия
          Diameter.Text := GetValueFromJSONFile(FFileName, 'Diameter');
          // Скорость сварки
          SpdWeld.Text := GetValueFromJSONFile(FFileName, 'SpdWeld');
          // Толщина наплавки
          Thickness.Text := GetValueFromJSONFile(FFileName, 'Thickness');
          // Длинна дуги
          ArcLength.Text := GetValueFromJSONFile(FFileName, 'ArcLength');
          // Шаг сварки
          StepSize.Text := GetValueFromJSONFile(FFileName, 'StepSize');
          // Частота импульса
          Scales.Text := GetValueFromJSONFile(FFileName, 'Scales');
          // Дельта тока
          DeltaCurrent.Text := GetValueFromJSONFile(FFileName, 'DeltaCurrent');
          // Через (Погонная энергия/Ток)
          EnergyCurrent.IsChecked :=
            Strtobool(GetValueFromJSONFile(FFileName, 'EnergyCurrent'));
          if EnergyCurrent.IsChecked then
            // Средний ток
            AverageСurrent.Text := GetValueFromJSONFile(FFileName,
              'AverageCurrent')
          else
            // Погонная энергия
            LinearEnergy.Text := GetValueFromJSONFile(FFileName,
              'LinearEnergy');
          // Движение наплавки (Из нутри/С наружи)
          Outward.IsChecked :=
            Strtobool(GetValueFromJSONFile(FFileName, 'Outward'));
          // Название Label Кольцевая/Линейная
          // lblWeldType.Text := GetValueFromJSONFile(FFileName, 'lblWeldType');
          // Тип Кольцевая/Линейная
          WeldingType.IsChecked :=
            Strtobool(GetValueFromJSONFile(FFileName, 'WeldingType'));
          // Для расчета длины
          F1.Text := GetValueFromJSONFile(FFileName, 'F1');
          // Для расчета ширины
          D1.Text := GetValueFromJSONFile(FFileName, 'D1');
          // Коэфициент положения для наплавки в положении (0,5 или 0,6)
          ThicknessCoefficient.Text := GetValueFromJSONFile(FFileName,
            'ThicknessCoefficient');
          // Поправочный коэффициент при установки сторонего двигателя
          FeedCoeff.Text := GetValueFromJSONFile(FFileName, 'FeedCoeff');
          // Дельта подачи проволоки
          sDeltaWire.Max := GetValueFromJSONFile(FFileName, 'DeltaWire')
            .ToInteger;
          sDeltaWire.Text := sDeltaWire.Max.ToString;
          // Диаметр проволоки
          Wire.ItemIndex := StrToInt(GetValueFromJSONFile(FFileName, 'Wire'));
          Comment.Text := TNetEncoding.Base64.Decode
            (GetValueFromJSONFile(FFileName, 'Comment'));
        except
          on E: Exception do
            ShowMessage('Ошибка!!!' + #10 + '- Файл сохранения поврежден' + #10
              + 'или' + #10 + '- Устаревший формат' + #10 + E.Message);
        end;

        Run := False;
        UpdateFronius1;
      End;
    End;
  End;
  BlurEffect.Enabled := False;
end;

procedure TfATFronius.SaveWeldSettings2Change(Sender: TObject);
Var
  FFileName: String;
begin
  Run := True;

  if TabControl.ActiveTab.Text = 'Fronius 2' then
  Begin
    if (SaveWeldSettings2.ItemIndex > -1) then
    Begin
      if FileExists(FDirPath + SaveWeldSettings2.Items
        [SaveWeldSettings2.ItemIndex] + '.fr2') then
      begin
        FFileName := FDirPath + SaveWeldSettings2.Items
          [SaveWeldSettings2.ItemIndex] + '.fr2';
        Try
          // Наклон изделия
          ProductAngle2.Text := GetValueFromJSONFile(FFileName, 'ProductAngle');
          // Диаметр изделия
          Diameter2.Text := GetValueFromJSONFile(FFileName, 'Diameter');
          // Скорость сварки
          SpdWeld2.Text := GetValueFromJSONFile(FFileName, 'SpdWeld');
          // Толщина наплавки
          Thickness2.Text := GetValueFromJSONFile(FFileName, 'Thickness');
          // Длинна дуги
          ArcLength2.Text := GetValueFromJSONFile(FFileName, 'ArcLength');
          // Шаг сварки
          StepSize2.Text := GetValueFromJSONFile(FFileName, 'StepSize');
          // Частота импульса
          Scales2.Text := GetValueFromJSONFile(FFileName, 'Scales');
          // Дельта тока
          DeltaCurrent2.Text := GetValueFromJSONFile(FFileName, 'DeltaCurrent');

          // Через (Погонная энергия/Ток)
          EnergyCurrent2.IsChecked :=
            Strtobool(GetValueFromJSONFile(FFileName, 'EnergyCurrent'));
          if EnergyCurrent2.IsChecked then
            // Средний ток
            AverageСurrent2.Text := GetValueFromJSONFile(FFileName,
              'AverageCurrent')
          else
            // Погонная энергия
            LinearEnergy2.Text := GetValueFromJSONFile(FFileName,
              'LinearEnergy');

          // Движение наплавки (Из нутри/С наружи)
          Outward2.IsChecked :=
            Strtobool(GetValueFromJSONFile(FFileName, 'Outward'));
          // Название Label Кольцевая/Линейная
          // lblWeldType2.Text := GetValueFromJSONFile(FFileName, 'lblWeldType');
          // Тип Кольцевая/Линейная
          WeldingType2.IsChecked :=
            Strtobool(GetValueFromJSONFile(FFileName, 'WeldingType'));
          // Тип головы
          TwoSources.IsChecked :=
            Strtobool(GetValueFromJSONFile(FFileName, 'TwoSources'));
          // Для расчета длины
          F2.Text := GetValueFromJSONFile(FFileName, 'F2');
          // Для расчета ширины
          D2.Text := GetValueFromJSONFile(FFileName, 'D2');
          // Коэфициент положения для наплавки в положении (0,5 или 0,6)
          ThicknessCoefficient2.Text := GetValueFromJSONFile(FFileName,
            'ThicknessCoefficient');
          // Поправочный коэффициент при установки сторонего двигателя
          FeedCoeff2.Text := GetValueFromJSONFile(FFileName, 'FeedCoeff');
          // Дельта подачи проволоки
          sDeltaWire2.Max := GetValueFromJSONFile(FFileName, 'DeltaWire')
            .ToInteger;
          sDeltaWire2.Text := sDeltaWire2.Max.ToString;
          // Диаметр проволоки
          Wire2.ItemIndex := StrToInt(GetValueFromJSONFile(FFileName, 'Wire'));
          Comment.Text := TNetEncoding.Base64.Decode
            (GetValueFromJSONFile(FFileName, 'Comment'));
        except
          on E: Exception do
            ShowMessage('Ошибка!!!' + #10 + '- Файл сохранения поврежден' + #10
              + 'или' + #10 + '- Устаревший формат' + #10 + E.Message);
        end;

        Run := False;
        UpdateFronius2;
      End;
    End;
  End;
  BlurEffect.Enabled := False;
end;

procedure TfATFronius.SaveWeldSettings2ClosePopup(Sender: TObject);
begin
  BlurEffect.Enabled := False;
end;

procedure TfATFronius.SaveWeldSettings2Popup(Sender: TObject);
begin
  BlurEffect.Enabled := True;
end;

procedure TfATFronius.SaveWeldSettingsClosePopup(Sender: TObject);
begin
  BlurEffect.Enabled := False;
end;

procedure TfATFronius.SaveWeldSettingsDblClick(Sender: TObject);
begin
{$IF defined(MSWINDOWS)}
  ShellExecute(0, nil, 'explorer.exe', PChar('/select,"' + FDirPath + '"'), nil,
    SW_SHOWNORMAL);
{$ENDIF}
end;

procedure TfATFronius.SaveWeldSettingsPopup(Sender: TObject);
begin
  BlurEffect.Enabled := True;
end;

procedure TfATFronius.Scales2Click(Sender: TObject);
begin
  Scales2.SelectAll;
end;

procedure TfATFronius.ScalesClick(Sender: TObject);
begin
  Scales.SelectAll;
end;

procedure TfATFronius.sDeltaWireClick(Sender: TObject);
begin
  sDeltaWire.SelectAll;
end;

procedure TfATFronius.ShowLogging2Click(Sender: TObject);
begin
  If ShowLogging2.IsChecked then
    ShowLogging.IsChecked := False
  else
    ShowLogging.IsChecked := True;
end;

procedure TfATFronius.ShowLoggingClick(Sender: TObject);
begin
  If ShowLogging.IsChecked then
    ShowLogging2.IsChecked := False
  else
    ShowLogging2.IsChecked := True;
end;

procedure TfATFronius.SpdWeld2Click(Sender: TObject);
begin
  SpdWeld2.SelectAll;
end;

procedure TfATFronius.SpdWeldClick(Sender: TObject);
begin
  SpdWeld.SelectAll;
end;

procedure TfATFronius.SpeedButton1Click(Sender: TObject);
begin
  BlurEffect.Enabled := False;
end;

// Используя теорему Пифагора, можно выразить угол θ через длины радиусов r1 и r2
// (где r1- радиус меньшего круга, а r2- радиус большего круга) и длину стенки d
function CalculateAngle(r1, r2, d: Double): Double;
var
  angle_rad: Double;
begin
  // Переводим диаметр в радиус
  r1 := r1 / 2;
  r2 := r2 / 2;

  // Проверка на нулевые или отрицательные значения радиусов и длины стенки
  if (r1 <= 0) or (r2 <= 0) or (d <= 0) then
    raise Exception.Create('Радиусы и длина стенки должны быть положительными');

  // Расчет угла в радианах
  angle_rad := 2 * ArcCot(d / Abs(r2 - r1));

  // Преобразование угла из радиан в градусы
  Result := RadToDeg(angle_rad);
end;

procedure TfATFronius.sbD1Change(Sender: TObject);
var
  Angle: Double;
begin
  // Рассчитываем угол между двумя диаметрами
  Angle := CalculateAngle(sbD1.Value, sbD2.Value, sbL.Value);
  Label70.Text := Format('Угол: %.2f градусов', [Angle]);
end;

procedure TfATFronius.sbD1Click(Sender: TObject);
begin
  sbD1.SelectAll;
end;

procedure TfATFronius.sbD2Click(Sender: TObject);
begin
  sbD2.SelectAll;
end;

procedure TfATFronius.sbLClick(Sender: TObject);
begin
  sbL.SelectAll;
end;

function CalculateWeldingCurrent(Q, V, eta, gamma: real): real;
begin
  Result := (Q * V) / (eta * gamma);
end;

function CalculateEnergy(U, I, V: Double): Double;
begin
  Result := (U * I * 60) / (V * 10); // переводим скорость в метры в минуту
end;

procedure TfATFronius.StepSize2Click(Sender: TObject);
begin
  StepSize2.SelectAll;
end;

procedure TfATFronius.StepSizeClick(Sender: TObject);
begin
  StepSize.SelectAll;
end;

procedure TfATFronius.Thickness2Click(Sender: TObject);
begin
  Thickness2.SelectAll;
end;

procedure TfATFronius.ThicknessClick(Sender: TObject);
begin
  Thickness.SelectAll;
end;

procedure TfATFronius.ThicknessCoefficientClick(Sender: TObject);
begin
  ThicknessCoefficient.SelectAll;
end;

procedure TfATFronius.TitleAboutClick(Sender: TObject);
begin
end;

{$IF defined(IOS)}

// and NOT defined(CPUARM)
procedure OpenURL(Url: String);
begin
  SharedApplication.OpenURL
    (TNSURL.Wrap(TNSURL.OCClass.URLWithString(NSSTR(PChar(String(Url))))));
end;
{$ELSEIF defined(ANDROID)}

procedure OpenURL(Url: String);
var
  Intent: JIntent;
begin
  Intent := TJIntent.Create;
  Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
  Intent.setData(StrToJURI(Url));
  SharedActivity.startActivity(Intent);
end;
{$ELSE}

procedure OpenURL(Url: String);
begin
  ShellExecute(0, 'open', PWideChar(Url), nil, nil, SW_SHOW);
end;
{$ENDIF}

procedure TfATFronius.Diameter2Click(Sender: TObject);
begin
  Diameter2.SelectAll;
end;

procedure TfATFronius.DiameterClick(Sender: TObject);
begin
  Diameter.SelectAll;
end;

procedure TfATFronius.DiameterDblClick(Sender: TObject);
begin
  Diameter.Value := 0;
end;

procedure TfATFronius.DiametrChange(Sender: TObject);
var
  Radius, Height, Volume, FlowRate, TimeInMinutes, TimeInSeconds: Double;
  Minutes, Seconds: Integer;
begin
  // Преобразование диаметра в радиус и миллиметры в метры
  Radius := Diametr.Value / 2 / 1000;
  // Преобразование миллиметров в метры
  Height := Dlina.Value / 1000;
  // Расчет объема отверстия
  Volume := Pi * Sqr(Radius) * Height;
  // Преобразование литров в минуту в кубические метры в минуту
  FlowRate := flowRateGas.Value / 1000;
  // Расчет времени заполнения в минутах
  TimeInMinutes := Volume / FlowRate;
  // Преобразование времени в секунды для удобства отображения
  TimeInSeconds := TimeInMinutes * 60;
  // Определение минут и секунд
  Minutes := Trunc(TimeInSeconds / 60);
  Seconds := Round(TimeInSeconds) mod 60;
  // возвращает рассчитанное время
  ResultGas.Text := Format('%d мин : %d сек', [Minutes, Seconds]);
end;

procedure TfATFronius.DiametrClick(Sender: TObject);
begin
  Diametr.SelectAll;
end;

procedure TfATFronius.DlinaClick(Sender: TObject);
begin
  Dlina.SelectAll;
end;

procedure TfATFronius.EditCurrentsClick(Sender: TObject);
begin
  InputBox('Настройки Тока', 'Через пробел', EditCurrents.Text,
    procedure(const AResult: TModalResult; const AValue: String)
    begin
      if (AValue <> '') and (AResult = mrOk) then
      Begin
        EditCurrents.Text := AValue;
      End;
    End);
  EditCurrents.SetFocus;
end;

procedure TfATFronius.EditVoltagesClick(Sender: TObject);
begin
  InputBox('Настройки Напряжение', 'Через пробел', EditVoltages.Text,
    procedure(const AResult: TModalResult; const AValue: String)
    begin
      if (AValue <> '') and (AResult = mrOk) then
      Begin
        EditVoltages.Text := AValue;
      End;
    End);
  EditVoltages.SetFocus;
end;

procedure TfATFronius.EditCurrents2Click(Sender: TObject);
begin
  InputBox('Настройки Тока', 'Через пробел', EditCurrents2.Text,
    procedure(const AResult: TModalResult; const AValue: String)
    begin
      if (AValue <> '') and (AResult = mrOk) then
      Begin
        EditCurrents2.Text := AValue;
      End;
    End);
  EditCurrents2.SetFocus;
end;

procedure TfATFronius.EditVoltages2Click(Sender: TObject);
begin
  InputBox('Настройки Напряжения', 'Через пробел', EditVoltages2.Text,
    procedure(const AResult: TModalResult; const AValue: String)
    begin
      if (AValue <> '') and (AResult = mrOk) then
      Begin
        EditVoltages2.Text := AValue;
      End;
    End);
  EditVoltages2.SetFocus;
end;

procedure TfATFronius.F1Click(Sender: TObject);
begin
  F1.SelectAll;
end;

procedure TfATFronius.F2Click(Sender: TObject);
begin
  F2.SelectAll;
end;

procedure TfATFronius.FeedCoeffClick(Sender: TObject);
begin
  FeedCoeff.SelectAll;
end;

procedure TfATFronius.flowRateGasClick(Sender: TObject);
begin
  flowRateGas.SelectAll;
end;

procedure TfATFronius.FormCreate(Sender: TObject);
  procedure LoadHelper;
  Begin
    fATFronius.ListBox.Items.Add('Ток импульса');
    fATFronius.ListBox.Items.Add('Время импульса');
    fATFronius.ListBox.Items.Add('Напряжение');
    fATFronius.ListBox.Items.Add('Подача проволоки');
    fATFronius.ListBox.Items.Add('Скорость сварки');
    fATFronius.ListBox.Items.Add('Понятие «жесткости режима»');
  End;

Var
  R: TBinaryReader;
  ErrStr, ErrR: String;
begin
  Button5.Visible := False;
  Panel7.Visible := False;
  GetUpdate.Visible := False;
  Button2Click(nil);
  LoadHelper;
  TabControl.ActiveTab := TabFronius1;
  PanelComment.Visible := False;
  BrandElectrode.Visible := False;
  BrandElectrode2.Visible := False;

{$IF defined(ANDROID)}
  // Если файл во внутреннем накопителе то GetDocumentsPath
  // Если файл на публичном накопителе то GetPublicPath
  FDirPath := TPath.Combine(TPath.GetPublicPath, '');
  FDirPath := FDirPath + PathDelim;
{$ENDIF}
{$IF defined(MSWINDOWS)}
  FDirPath := ExtractFilePath(ParamStr(0));
{$ENDIF}
  // Выводим лог пути в About
  mAbout.Lines.Add('Загрузка программ из ' + FDirPath);
  // Отключаем обработку сварочных режимов
  Run := True;

  // SaveState.StoragePath := System.IOUtils.TPath.GetHomePath;
SaveState.StoragePath := FDirPath; // Устанавливаем путь

try
  // Проверяем наличие данных в потоке
  if SaveState.Stream.Size = 0 then
  begin
    ShowMessage('Перезагрузите программу для обновления стартовых настроек');
    Exit;
  end;

  // Открываем бинарный ридер
  R := TBinaryReader.Create(SaveState.Stream);
  try
    mLog.Lines.Add('>Load..');
    LoadErr := 'Ok';

    try
      // Чтение и проверка ключевого параметра
      ErrStr := 'LoadErr';
      ErrR := R.ReadString;
      mLog.Lines.Add(ErrStr + '=' + ErrR);
      if LoadErr <> ErrR then
      begin
        ShowMessage('Настройки сброшены.');
        Run := False;
        Exit;
      end;

        /// Код вкладки Fronius1
        ErrStr := 'ProductAngle'; // Наклон изделия
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        ProductAngle.Value := ErrR.ToDouble;
        ErrStr := 'Diameter'; // Диаметр изделия
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        Diameter.Text := ErrR;
        ErrStr := 'SpdWeld'; // Скорость сварки
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        SpdWeld.Text := ErrR;
        ErrStr := 'Thickness'; // Толщина наплавки
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        Thickness.Text := ErrR;
        ErrStr := 'ArcLength'; // Длинна дуги
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        ArcLength.Text := ErrR;
        ErrStr := 'StepSize'; // Шаг сварки
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        StepSize.Text := ErrR;
        ErrStr := 'Scales'; // Частота импульса
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        Scales.Text := ErrR;
        ErrStr := 'DeltaCurrent'; // Дельта тока
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        DeltaCurrent.Text := ErrR;
        ErrStr := 'LinearEnergy'; // Погонная энергия
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        LinearEnergy.Text := ErrR;
        ErrStr := 'sDeltaWire'; // Дельта подачи проволоки
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        sDeltaWire.Max := ErrR.ToDouble;
        sDeltaWire.Text := ErrR;
        ErrStr := 'AverageСurrent'; // Средний ток
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        AverageСurrent.Text := ErrR;
        ErrStr := 'Outward'; // Движение наплавки (Из нутри/С наружи)
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        Outward.IsChecked := Strtobool(ErrR);
        ErrStr := 'lblWeldType'; // Название Label Кольцевая/Линейная
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        lblWeldType.Text := ErrR;
        ErrStr := 'WeldingType'; // Тип Кольцевая/Линейная
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        WeldingType.IsChecked := Strtobool(ErrR);
        if WeldingType.IsChecked then
        Begin
          D1.Enabled := False;
          LabD1.Enabled := False;
        End;
        ErrStr := 'EnergyCurrent'; // Через (Погонная энергия/Ток)
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        EnergyCurrent.IsChecked := Strtobool(ErrR);
        if EnergyCurrent.IsChecked then
        Begin
          Label17.Enabled := False;
          LinearEnergy.Enabled := False;
          Label18.Enabled := False;
          AverageСurrent.Enabled := True;
          Label41.Enabled := True;
        End
        else
        Begin
          Label17.Enabled := True;
          LinearEnergy.Enabled := True;
          Label18.Enabled := True;
          AverageСurrent.Enabled := False;
          Label41.Enabled := False;
        End;

        ErrStr := 'F1'; // Для расчета длины
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        F1.Text := ErrR;
        ErrStr := 'D1'; // Для расчета ширины
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        D1.Text := ErrR;
        // Коэфициент положения для наплавки в положении (0,5 или 0,6)
        ErrStr := 'ThicknessCoefficient';
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        ThicknessCoefficient.Text := ErrR;
        // Поправочный коэффициент при установки сторонего двигателя
        ErrStr := 'FeedCoeff';
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        FeedCoeff.Text := ErrR;
        // Диаметр проволоки
        ErrStr := 'Wire';
        ErrR := IntToStr(R.ReadInteger);
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        Wire.ItemIndex := StrToInt(ErrR);
        // Режимы источника (ТОК)
        ErrStr := 'EditCurrents';
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        EditCurrents.Text := ErrR;
        // Режимы источника (Напряжение)
        ErrStr := 'EditVoltages';
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        EditVoltages.Text := ErrR;

        /// Код для второй вкладки Fronius2

        ErrStr := 'ProductAngle2'; // Наклон изделия
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        ProductAngle2.Value := ErrR.ToDouble;
        ErrStr := 'Diameter2'; // Диаметр изделия
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        Diameter2.Text := ErrR;
        ErrStr := 'SpdWeld2'; // Скорость сварки
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        SpdWeld2.Text := ErrR;
        ErrStr := 'Thickness2'; // Толщина наплавки
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        Thickness2.Text := ErrR;
        ErrStr := 'ArcLength2'; // Длинна дуги
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        ArcLength2.Text := ErrR;
        ErrStr := 'StepSize2'; // Шаг сварки
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        StepSize2.Text := ErrR;
        ErrStr := 'Scales2'; // Частота импульса
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        Scales2.Text := ErrR;
        ErrStr := 'DeltaCurrent2'; // Дельта тока
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        DeltaCurrent2.Text := ErrR;
        ErrStr := 'LinearEnergy2'; // Погонная энергия
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        LinearEnergy2.Text := ErrR;
        ErrStr := 'sDeltaWire2'; // Дельта подачи проволоки
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        sDeltaWire2.Max := ErrR.ToDouble;
        sDeltaWire2.Text := ErrR;
        ErrStr := 'AverageСurrent2'; // Средний ток
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        AverageСurrent2.Text := ErrR;
        ErrStr := 'Outward2'; // Движение наплавки
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        Outward2.IsChecked := Strtobool(ErrR);
        ErrStr := 'lblWeldType2'; // Название Label Кольцевая/Линейная
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        lblWeldType2.Text := ErrR;
        ErrStr := 'WeldingType2'; // Тип Кольцевая/Линейная
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        WeldingType2.IsChecked := Strtobool(ErrR);
        if WeldingType2.IsChecked then
        Begin
          D2.Enabled := False;
          LabD2.Enabled := False;
        End;
        ErrStr := 'TwoSources'; // Тип головы
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        TwoSources.IsChecked := Strtobool(ErrR);
        ErrStr := 'EnergyCurrent2'; // Через (Погонная энергия/Ток)
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        EnergyCurrent2.IsChecked := Strtobool(ErrR);
        if EnergyCurrent2.IsChecked then
        Begin
          Label116.Enabled := False;
          LinearEnergy2.Enabled := False;
          Label117.Enabled := False;
          AverageСurrent2.Enabled := True;
          Label141.Enabled := True;
        End
        else
        Begin
          Label116.Enabled := True;
          LinearEnergy2.Enabled := True;
          Label117.Enabled := True;
          AverageСurrent2.Enabled := False;
          Label141.Enabled := False;
        End;

        ErrStr := 'F2'; // Для расчета длины
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        F2.Text := ErrR;
        ErrStr := 'D2'; // Для расчета ширины
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        D2.Text := ErrR;
        ErrStr := 'ThicknessCoefficient2'; // Коэфициент положения
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        ThicknessCoefficient2.Text := ErrR;
        // Поправочный коэффициент при установки сторонего двигателя
        ErrStr := 'FeedCoeff2';
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        FeedCoeff2.Text := ErrR;
        // Диаметр проволоки
        ErrStr := 'Wire2';
        ErrR := IntToStr(R.ReadInteger);
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        Wire2.ItemIndex := StrToInt(ErrR);
        // Режимы источника (ТОК)
        ErrStr := 'EditCurrents2';
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        EditCurrents2.Text := ErrR;
        // Режимы источника (Напряжение)
        ErrStr := 'EditVoltages2';
        ErrR := R.ReadString;
        mLog.Lines.Add(ErrStr + '=' + ErrR);
        EditVoltages2.Text := ErrR;

    except
      on E: Exception do
      begin
        ShowMessageFmt('Ошибка при загрузке настроек! [%s=%s]. Перезапустите программу.', [ErrStr, ErrR]);
        LoadErr := 'Error';
        TabControl.ActiveTab := TabAbout;
        Exit;
      end;
      on E: EInOutError do
        ShowMessage('IO error: ' + E.Message);
      on E: EDivByZero do
        ShowMessage('Div by zero error: ' + E.Message);
      else
        ShowMessage('Unknown error occurred');
    end;

  finally
    R.Free; // Освобождаем ресурсы
  end;

except
  on E: Exception do
    ShowMessage('Не удалось загрузить настройки: ' + E.Message);
end;


//  R := TBinaryReader.Create(SaveState.Stream);
//  try
//    if SaveState.Stream.Size > 0 then
//    begin
//      LoadErr := 'Ok';
//      try
//        ErrStr := 'LoadErr';
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        if LoadErr <> ErrR then
//        Begin
//          ShowMessage('Настройки сброшены.');
//          Run := False;
//          R.Free;
//          Exit;
//        End;
//        /// Код вкладки Fronius1
//        ErrStr := 'ProductAngle'; // Наклон изделия
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        ProductAngle.Value := ErrR.ToDouble;
//        ErrStr := 'Diameter'; // Диаметр изделия
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        Diameter.Text := ErrR;
//        ErrStr := 'SpdWeld'; // Скорость сварки
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        SpdWeld.Text := ErrR;
//        ErrStr := 'Thickness'; // Толщина наплавки
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        Thickness.Text := ErrR;
//        ErrStr := 'ArcLength'; // Длинна дуги
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        ArcLength.Text := ErrR;
//        ErrStr := 'StepSize'; // Шаг сварки
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        StepSize.Text := ErrR;
//        ErrStr := 'Scales'; // Частота импульса
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        Scales.Text := ErrR;
//        ErrStr := 'DeltaCurrent'; // Дельта тока
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        DeltaCurrent.Text := ErrR;
//        ErrStr := 'LinearEnergy'; // Погонная энергия
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        LinearEnergy.Text := ErrR;
//        ErrStr := 'sDeltaWire'; // Дельта подачи проволоки
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        sDeltaWire.Max := ErrR.ToDouble;
//        sDeltaWire.Text := ErrR;
//        ErrStr := 'AverageСurrent'; // Средний ток
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        AverageСurrent.Text := ErrR;
//        ErrStr := 'Outward'; // Движение наплавки (Из нутри/С наружи)
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        Outward.IsChecked := Strtobool(ErrR);
//        ErrStr := 'lblWeldType'; // Название Label Кольцевая/Линейная
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        lblWeldType.Text := ErrR;
//        ErrStr := 'WeldingType'; // Тип Кольцевая/Линейная
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        WeldingType.IsChecked := Strtobool(ErrR);
//        if WeldingType.IsChecked then
//        Begin
//          D1.Enabled := False;
//          LabD1.Enabled := False;
//        End;
//        ErrStr := 'EnergyCurrent'; // Через (Погонная энергия/Ток)
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        EnergyCurrent.IsChecked := Strtobool(ErrR);
//        if EnergyCurrent.IsChecked then
//        Begin
//          Label17.Enabled := False;
//          LinearEnergy.Enabled := False;
//          Label18.Enabled := False;
//          AverageСurrent.Enabled := True;
//          Label41.Enabled := True;
//        End
//        else
//        Begin
//          Label17.Enabled := True;
//          LinearEnergy.Enabled := True;
//          Label18.Enabled := True;
//          AverageСurrent.Enabled := False;
//          Label41.Enabled := False;
//        End;
//
//        ErrStr := 'F1'; // Для расчета длины
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        F1.Text := ErrR;
//        ErrStr := 'D1'; // Для расчета ширины
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        D1.Text := ErrR;
//        // Коэфициент положения для наплавки в положении (0,5 или 0,6)
//        ErrStr := 'ThicknessCoefficient';
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        ThicknessCoefficient.Text := ErrR;
//        // Поправочный коэффициент при установки сторонего двигателя
//        ErrStr := 'FeedCoeff';
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        FeedCoeff.Text := ErrR;
//        // Диаметр проволоки
//        ErrStr := 'Wire';
//        ErrR := IntToStr(R.ReadInteger);
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        Wire.ItemIndex := StrToInt(ErrR);
//        // Режимы источника (ТОК)
//        ErrStr := 'EditCurrents';
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        EditCurrents.Text := ErrR;
//        // Режимы источника (Напряжение)
//        ErrStr := 'EditVoltages';
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        EditVoltages.Text := ErrR;
//
//        /// Код для второй вкладки Fronius2
//
//        ErrStr := 'ProductAngle2'; // Наклон изделия
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        ProductAngle2.Value := ErrR.ToDouble;
//        ErrStr := 'Diameter2'; // Диаметр изделия
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        Diameter2.Text := ErrR;
//        ErrStr := 'SpdWeld2'; // Скорость сварки
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        SpdWeld2.Text := ErrR;
//        ErrStr := 'Thickness2'; // Толщина наплавки
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        Thickness2.Text := ErrR;
//        ErrStr := 'ArcLength2'; // Длинна дуги
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        ArcLength2.Text := ErrR;
//        ErrStr := 'StepSize2'; // Шаг сварки
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        StepSize2.Text := ErrR;
//        ErrStr := 'Scales2'; // Частота импульса
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        Scales2.Text := ErrR;
//        ErrStr := 'DeltaCurrent2'; // Дельта тока
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        DeltaCurrent2.Text := ErrR;
//        ErrStr := 'LinearEnergy2'; // Погонная энергия
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        LinearEnergy2.Text := ErrR;
//        ErrStr := 'sDeltaWire2'; // Дельта подачи проволоки
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        sDeltaWire2.Max := ErrR.ToDouble;
//        sDeltaWire2.Text := ErrR;
//        ErrStr := 'AverageСurrent2'; // Средний ток
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        AverageСurrent2.Text := ErrR;
//        ErrStr := 'Outward2'; // Движение наплавки
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        Outward2.IsChecked := Strtobool(ErrR);
//        ErrStr := 'lblWeldType2'; // Название Label Кольцевая/Линейная
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        lblWeldType2.Text := ErrR;
//        ErrStr := 'WeldingType2'; // Тип Кольцевая/Линейная
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        WeldingType2.IsChecked := Strtobool(ErrR);
//        if WeldingType2.IsChecked then
//        Begin
//          D2.Enabled := False;
//          LabD2.Enabled := False;
//        End;
//        ErrStr := 'TwoSources'; // Тип головы
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        TwoSources.IsChecked := Strtobool(ErrR);
//        ErrStr := 'EnergyCurrent2'; // Через (Погонная энергия/Ток)
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        EnergyCurrent2.IsChecked := Strtobool(ErrR);
//        if EnergyCurrent2.IsChecked then
//        Begin
//          Label116.Enabled := False;
//          LinearEnergy2.Enabled := False;
//          Label117.Enabled := False;
//          AverageСurrent2.Enabled := True;
//          Label141.Enabled := True;
//        End
//        else
//        Begin
//          Label116.Enabled := True;
//          LinearEnergy2.Enabled := True;
//          Label117.Enabled := True;
//          AverageСurrent2.Enabled := False;
//          Label141.Enabled := False;
//        End;
//
//        ErrStr := 'F2'; // Для расчета длины
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        F2.Text := ErrR;
//        ErrStr := 'D2'; // Для расчета ширины
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        D2.Text := ErrR;
//        ErrStr := 'ThicknessCoefficient2'; // Коэфициент положения
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        ThicknessCoefficient2.Text := ErrR;
//        // Поправочный коэффициент при установки сторонего двигателя
//        ErrStr := 'FeedCoeff2';
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        FeedCoeff2.Text := ErrR;
//        // Диаметр проволоки
//        ErrStr := 'Wire2';
//        ErrR := IntToStr(R.ReadInteger);
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        Wire2.ItemIndex := StrToInt(ErrR);
//        // Режимы источника (ТОК)
//        ErrStr := 'EditCurrents2';
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        EditCurrents2.Text := ErrR;
//        // Режимы источника (Напряжение)
//        ErrStr := 'EditVoltages2';
//        ErrR := R.ReadString;
//        mLog.Lines.Add(ErrStr + '=' + ErrR);
//        EditVoltages2.Text := ErrR;
//      except
//        on E: Exception do
//        begin
//          ShowMessage('Ошибка при загрузке настроек! [' + ErrStr + '=' + ErrR +
//            ']' + ' Перазапустите программу. ');
//          LoadErr := 'Error';
//          R.Free;
//          TabControl.ActiveTab := TabAbout;
//          Exit;
//        end;
//
//        On E: EInOutError do
//          ShowMessage('IO error: ' + E.Message);
//        // Деление на ноль
//        On E: EDivByZero do
//          ShowMessage('Div by zero error: ' + E.Message);
//        // Все остальное:
//        else
//          ShowMessage('Unknown error');
//      end;
//    end
//    else
//      // Показываем предупреждение первого запуска
//      ShowMessage('Перезагрузите программу для обновления стартовых настроек');
//
//  finally
//    // Освобождаем ресурсы
//    R.Free;
//  end;

  // Загружаем макросы и сортируем
  LoadWeldSettings;
  // Включаем обработку сварочных режимов
  Run := False;

  UpdateFronius1;
  UpdateFronius2;
end;

procedure TfATFronius.FormKeyUp(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
begin
  { if Key = vkHardwareBack then
    begin
    if (TabControl.ActiveTab = TabFronius1) and
    (TabControl2.ActiveTab = TabItem6) then
    begin
    TabControl2.Previous;
    Key := 0;
    end;
    end; }
end;

procedure TfATFronius.FormSaveState(Sender: TObject);
Var
  W: TBinaryWriter;
begin
  // Очищаем поток перед записью новых данных
  SaveState.Stream.Clear;
  // Устанавливаем путь для сохранения состояния
  SaveState.StoragePath := FDirPath;
  // Создаем экземпляр TBinaryWriter для записи данных в поток
  W := TBinaryWriter.Create(SaveState.Stream);
  try
    // булево значение, указывающее, была ли загружена предыдущая конфигурация приложения успешно.
    W.Write(LoadErr);
    W.Write(ProductAngle.Text); // Наклон изделия
    W.Write(Diameter.Text); // Диаметр изделия
    W.Write(SpdWeld.Text); // Скорость сварки
    W.Write(Thickness.Text); // Толщина наплавки
    W.Write(ArcLength.Text); // Длинна дуги
    W.Write(StepSize.Text); // Шаг сварки
    W.Write(Scales.Text); // Частота импульса
    W.Write(DeltaCurrent.Text); // Дельта тока
    W.Write(LinearEnergy.Text); // Погонная энергия
    W.Write(sDeltaWire.Text); // Дельта подачи проволоки
    W.Write(AverageСurrent.Text); // Средний ток
    W.Write(BoolToStr(Outward.IsChecked, True)); // Движение наплавки
    W.Write(lblWeldType.Text); // Название Label Кольцевая/Линейная
    W.Write(BoolToStr(WeldingType.IsChecked, True)); // Тип Кольцевая/Линейная
    // Через (Погонная энергия/Ток)
    W.Write(BoolToStr(EnergyCurrent.IsChecked, True));
    W.Write(F1.Text); // Для расчета длины
    W.Write(D1.Text); // Для расчета ширины
    W.Write(ThicknessCoefficient.Text); // Коэфициент положения
    // Поправочный коэффициент при установки сторонего двигателя
    W.Write(FeedCoeff.Text);
    W.Write(Wire.ItemIndex); // Диаметр проволоки
    // Настройки контроля высоты
    W.Write(EditCurrents.Text);
    W.Write(EditVoltages.Text);
    // ========================================================================
    W.Write(ProductAngle2.Text); // Наклон изделия
    W.Write(Diameter2.Text); // Диаметр изделия
    W.Write(SpdWeld2.Text); // Скорость сварки
    W.Write(Thickness2.Text); // Толщина наплавки
    W.Write(ArcLength2.Text); // Длинна дуги
    W.Write(StepSize2.Text); // Шаг сварки
    W.Write(Scales2.Text); // Частота импульса
    W.Write(DeltaCurrent2.Text); // Дельта тока
    W.Write(LinearEnergy2.Text); // Погонная энергия
    W.Write(sDeltaWire2.Text); // Дельта подачи проволоки
    W.Write(AverageСurrent2.Text); // Средний ток
    W.Write(BoolToStr(Outward2.IsChecked, True)); // Движение наплавки
    W.Write(lblWeldType2.Text); // Название Label Кольцевая/Линейная
    W.Write(BoolToStr(WeldingType2.IsChecked, True)); // Тип Кольцевая/Линейная
    W.Write(BoolToStr(TwoSources.IsChecked, True)); // Тип головы
    // Через (Погонная энергия/Ток)
    W.Write(BoolToStr(EnergyCurrent2.IsChecked, True));
    W.Write(F2.Text); // Для расчета длины
    W.Write(D2.Text); // Для расчета ширины
    W.Write(ThicknessCoefficient2.Text); // Коэфициент положения
    // Поправочный коэффициент при установки сторонего двигателя
    W.Write(FeedCoeff2.Text);
    W.Write(Wire2.ItemIndex); // Диаметр проволоки

    // Настройки контроля высоты
    W.Write(EditCurrents2.Text);
    W.Write(EditVoltages2.Text);
  finally
    W.Free;
  end;

  // SaveState.Stream.SaveToFile('123.txt');
end;

procedure TfATFronius.FormTouch(Sender: TObject; const Touches: TTouches;
const Action: TTouchAction);
begin
  // Лицензия
  { if (License < FormatDateTime('yyyy', Now)) and (LicBool = False) then
    Begin
    LicBool := True;
    BlurEffect.Enabled := True;
    ShowMessage('Лицензия закончилась!');
    End; }
end;

procedure TfATFronius.GetUpdateClick(Sender: TObject);
begin
  OpenURL('https://disk.yandex.ru/d/n_KkzBbuvcR57g');
end;

procedure TfATFronius.LinearEnergy2Click(Sender: TObject);
begin
  LinearEnergy2.SelectAll;
end;

procedure TfATFronius.LinearEnergyClick(Sender: TObject);
begin
  LinearEnergy.SelectAll;
end;

procedure TfATFronius.ListBoxItemClick(const Sender: TCustomListBox;
const Item: TListBoxItem);
begin
  if Item.Text = 'Ток импульса' then
    Memo.Text := 'Повышение рабочего тока импульса:' + #10 +
      '- Повышается глубина пропловления' + #10 +
      '- Снижается риск несплавления' + #10 +
      '- Повышается риск утяжки корня шва  в положении 6 часов' + #10 + #10 +
      'Снижение рабочего тока импульса:' + #10 +
      '- Снижается глубина пропловления' + #10 +
      '- Повышается риск несплавления';
  if Item.Text = 'Время импульса' then
    Memo.Text := 'Повышение длительности времени рабочего импульса:' + #10 +
      '- Повышается глубина пропловления' + #10 +
      '- Снижается риск несплавления' + #10 +
      '- Повышается риск утяжки корня шва в положении 6 часов' + #10 + #10 +
      'Снижение длительности времени рабочего импульса:' + #10 +
      '- Снижается глубина проплавления' + #10 +
      '- Повышается риск несплавления' + #10 +
      '-Снижается риск утяжки корня шва в положении 6 часов' + #10 + #10 +
      'Повышение длительности времени дежурного импульса:' + #10 +
      '- Снижается глубина проплавления' + #10 +
      '- Повышается риск несплавления' + #10 + #10 +
      'Снижение длительности времени дежурного импульса:' + #10 +
      '- Повышается глубина проплавления' + #10 +
      '- Снижается риск несплавления' + #10 +
      '- Повышается риск утяжки корня шва в положении 6 часах';
  if Item.Text = 'Напряжение' then
    Memo.Text := 'Повышение напряжения:' + #10 +
      '- Уменьшается вероятность усиление шва' + #10 +
      '- Снижается риск несплавления' + #10 + #10 + 'Снижение напряжения:' + #10
      + '- Увеличивается вероятность усиления шва';
  if Item.Text = 'Подача проволоки' then
    Memo.Text := 'Увиличение скорости подачи присадки:' + #10 +
      '- Увеличивается высота усиления обратного валика' + #10 +
      '- Повышается производительность наплавки' + #10 +
      '- Снижается риск утяжки корня шва в положении 6 часов' + #10 +
      '- Повышается риск несплавления' + #10 + #10 +
      'Уменьшение скорости подачи присадки:' + #10 +
      '- Падает производительность наплавки' + #10 +
      '- Повышается риск утяжки корня шва в положении 6 часах' + #10 +
      '- Сниается риск несплавления';
  if Item.Text = 'Скорость сварки' then
    Memo.Text := 'Увеличение скорости сварки:' + #10 +
      '- Снижается глубина проплавления' + #10 +
      '- Снижается риск утяжки корня шва в положении 6 часов' + #10 +
      '- Уменьшается высота усиления обратного валика' + #10 +
      '- Повышается риск несплавления' + #10 + #10 + 'Сниение скорости:' + #10 +
      '- Повышается глубина проплавления' + #10 +
      '- Повышается риск утяжки корня шва в положении 6 часов' + #10 + '';

  if Item.Text = 'Жесткость режима сварки' then
    Memo.Text :=
      'Это параметр, который определяет стабильность и устойчивость сварочной дуги'
      + #10 + 'Большее значение жесткости указывает на более стабильную дугу и улучшенное качество сварки, особенно при работе с тонкими и чувствительными материалами'
      + #10 + 'При равных величинах длительности тока, более жестким считается режим, применяемый в соединениях с большей толщиной. Жесткий режим имеет ряд преимуществ:'
      + #10 + '- Большая производительность' + #10 + '- Экономичность' + #10 +
      '- Малые вмятины' + #10 + '- Высокая стойкость электродов';

end;

procedure TfATFronius.MemoViewportPositionChange(Sender: TObject;
const OldViewportPosition, NewViewportPosition: TPointF;
const ContentSizeChanged: Boolean);
begin
  { if (NewViewportPosition.Y <= 0) and (OldViewportPosition.Y > 0) then
    begin
    // Memo scrolled to the top
    ScrollBox3.ViewportPosition := PointF(ScrollBox3.ViewportPosition.X,
    ScrollBox3.ViewportPosition.Y - Memo.Height);
    end
    else if (NewViewportPosition.Y >= Memo.ContentBounds.Height - Memo.Height) and
    (OldViewportPosition.Y < Memo.ContentBounds.Height - Memo.Height) then
    begin
    // Memo scrolled to the bottom
    ScrollBox3.ViewportPosition := PointF(ScrollBox3.ViewportPosition.X,
    ScrollBox3.ViewportPosition.Y + Memo.Height);
    // ShowMessage('')
    ResultVolume.Text := FloatToStr(ScrollBox3.ViewportPosition.X);
    // ScrollBox3.RealignContent;
    end
    else if (NewViewportPosition.X <= 0) and (OldViewportPosition.X > 0) then
    begin
    // Memo scrolled to the left
    ScrollBox3.ViewportPosition :=
    PointF(ScrollBox3.ViewportPosition.X - Memo.Width,
    ScrollBox3.ViewportPosition.Y);
    ResultVolume.Text := 'left ' + FloatToStr(ScrollBox3.ViewportPosition.X);
    end
    else if (NewViewportPosition.X >= Memo.ContentBounds.Width - Memo.Width) and
    (OldViewportPosition.X < Memo.ContentBounds.Width - Memo.Width) then
    begin
    // Memo scrolled to the right
    ScrollBox3.ViewportPosition :=
    PointF(ScrollBox3.ViewportPosition.X + Memo.Width,
    ScrollBox3.ViewportPosition.Y);
    end; }
end;

procedure TfATFronius.UpdateFronius1;
Label 0;
// const  //Переносим эти значения в edit
// Currents: array [0 .. 7] of Double = (30, 80, 90, 100, 125, 150, 200, 250);
// Voltages: array [0 .. 7] of Double = (8.7, 9.2, 9.4, 9.5, 10.6, 10.9, 12.8, 14.6);
Var
  Currents: array of Double;
  Voltages: array of Double;
  // Currents: array [0 .. 10] of Double;
  // Voltages: array [0 .. 10] of Double;
  CurrentsStr, VoltagesStr: TStringList;
  AMass, BMass: Double; // Среднее значение массива
  Circumference, time, Speed: real;
  Distance, TimeInSeconds: Double;
  // Коэффициент настройки высоты дуги
  iСoeffVolt,
  // Шаг смещения с учетом наклона изделия
  iScales, iWirePulse, // Подача проволоки в импульсе  (мм/сек)
  iWireBackground, // Подача проволоки в фоне (мм/сек)
  iSpdWeld, // Скорость сварки (мм/сек)
  iLinearEnergy, // Погонная энергия (кДж/мм)
  iWireAverage, // Средняя подача проволоки (мм/сек)
  /// iHeatingMedium, // Средний подогрев проволоки (Амп)
  iWireFeedDelta // Дельта подачи проволоки (мм/сек)
  // iWireFeedDelta
  // iWireHeatingMedium, // Подогрев проволоки средний (Амп)
  // iDeltaWireHeating // Дельта подогрева проволоки (Амп)
    : Double; // Extended;
  I, dAngle, i0, i2, i3, iTimeWeld, tDiameter, // Начальный диаметр
  tDiameter2, // Конечный диаметр
  V, V0, V1: Double;
  tVoltNew, tLinNew, tVolt, tLin: Double;
  I5, Amp, n: Integer;
  ArrayA, ArrayB: Array of Double; // динамический массив
  InclineFactor: Double;
  Result, // Для временного сохранения результата
  tProductAngle, // Угол наклона поверхности наплавки
  iStepDegree, // Шаг с учётом угла изделия
  iLength: Double; // Длина наплавки
  TotalWeldLength: Double; // Общая длина шва
  WeldLength: Double; // Длина шва
  FinalDiameter: Double;
  Days, Hours, Minutes, Seconds: Word;
  StepCount, // Колличество валиков
  iI: Integer;
  r1, r2: Double;
  Angle, Height: Double;
  wireVolume, Density, wireVolumeHour, wireMassHour, wireLength,
    wireMassPerMinute: Double;
  wireMassPerHour: Double;
  // Stopwatch: TStopwatch;
Begin
  // Если поток запущен, завершаем этот
  if Run then
    Exit;
  Run := True;
  // Создаем объект класса TStopwatch
  // if cbStopwatch.IsChecked then
  // Stopwatch := TStopwatch.StartNew;

  // Определяем тип сварки и устанавливаем соответствующие метки
  if WeldingType.IsChecked then
    lblWeldType.Text := 'Кольцевая наплавка'
  Else
    lblWeldType.Text := 'Линейная/Нижняя наплавка';

  // Выполняем проверки на диаметр изделия
  if (WeldingType.IsChecked) and (Diameter.Value < 5) then
  Begin
    TitleStatus1.Text := 'Диаметр не может равнятся 0-4 мм';
    LabD1.Enabled := False;
    D1.Enabled := False;
    Run := False;
    Exit;
  End
  Else
  Begin
    TitleStatus1.Text := 'Стартовые режимы';
    LabF1.Text := 'Длина сварки (мм)';
    LabD1.Enabled := False;
    D1.Enabled := False;
  End;

  if (not WeldingType.IsChecked) and (Diameter.Value < 5) and
    (Diameter.Value >= 1) then
  Begin
    TitleStatus1.Text := 'Диаметр не может равнятся 1-4 мм';
    Run := False;
    Exit;
  End
  Else
  Begin
    if Diameter.Value >= 1 then
    Begin
      LabF1.Text := 'Внутренний диаметр';
      LabD1.Enabled := False;
      D1.Enabled := False;
    End
    else
    Begin
      LabF1.Text := 'Длина сварки';
      LabD1.Enabled := True;
      D1.Enabled := True;
    End;
  End;

  mLog.BeginUpdate;
  mAdd.BeginUpdate;
  mAdd.Lines.Clear;
  mLog.Lines.Clear;

  tDiameter := Diameter.Value;
  tProductAngle := ProductAngle.Value;
  iLength := F1.Value;
  WeldLength := 0;
  FinalDiameter := 0;

  mLogAdd('> UpDateFronius1 <', 1);

  // РАСЧЕТ ШАГА ПРИ НАКЛОНЕ ЗАГОТОВКИ
  // До 45° градусов
  iStepDegree := StepSize.Value;

  if tProductAngle < 45 then
    dAngle := iStepDegree * Cos(DegToRad(tProductAngle))
  else // После 45° градусов
    dAngle := iStepDegree * Sin(DegToRad(tProductAngle));

  if SimpleRoundTo(dAngle, -1) <> SimpleRoundTo(iStepDegree, -1) then
  Begin
    // Обновляем шаг для дальнейших расчетом с учетом угла
    iStepDegree := dAngle;
    mLogAdd('ШагУглаИздел ' + iStepDegree.ToString, 1);
    // Выводим скорректированный шаг для угла
    NewStep.Text := FloatToStrF(dAngle, ffNumber, 4, 1) + ' <';
    mAdd.Lines.Add('Шаг при ' + tProductAngle.ToString + '° ' + StepSize.Text +
      '=' + FloatToStrF(dAngle, ffNumber, 4, 1) + ' мм');
    mLogAdd('Шаг при ' + tProductAngle.ToString + '° ' + StepSize.Text + '=' +
      FloatToStrF(dAngle, ffNumber, 4, 1) + ' мм', 1);
  End
  else // Очищаем если изменения незаметные
    NewStep.Text := '';
  // ===========================================================================

  // Конвертируем скорость сварки (см/мин - мм/сек)
  iSpdWeld := SpdWeld.Value / 6;
  mLogAdd('Скорость сварки (мм/сек)= ' + iSpdWeld.ToString, 1);

  // Конвертируем погонную энергию (кДж/см - кДж/м)
  iLinearEnergy := LinearEnergy.Value * 100;
  mLogAdd('Погонную энергия (кДж/мм)= ' + iLinearEnergy.ToString, 1);

  if WeldingType.IsChecked then // Вертикальная сварка
    ThicknessCoefficient.Value := 0.6
  else // В нижнем положении
    ThicknessCoefficient.Value := 0.5;

  // Время пульса к фону (%)
  PulseTimeToBackground.Value := ThicknessCoefficient.Value * 100;

  // Частота пульсации =Гц
  // Угол для начала расчета вертикальной наплавки "взят с потолка"
  iScales := Scales.Value;

0:
  V0 := 0;
  V1 := 0;

  if (tProductAngle >= 40) or (tDiameter = 0) then
  Begin
    // В линейной/нижней наплавке
    RippleFrequency.Value := iSpdWeld / iScales;
  End
  else
  Begin
    // В кольцевой/вертикальной наплавке
    if Outward.IsChecked then
    Begin
      V0 := iSpdWeld * (tDiameter / (Diameter.Value + Thickness.Value * 2));
      V1 := iScales * ((Thickness.Value / (tDiameter - Thickness.Value)) + 1);
    End
    else
    Begin
      V0 := iSpdWeld * (tDiameter / (tDiameter - Thickness.Value * 2));
      V1 := iScales * ((Thickness.Value / (tDiameter - Thickness.Value)) + 1);
    End;

    RippleFrequency.Value := V0 / V1;
  End;

  // ========== РАСЧЁТ ЧАСТОТЫ ПУЛЬСА СВАРКИ ==========
  // Сварочный импульс
  PulseTime.Value := PulseTimeToBackground.Value / RippleFrequency.Value;
  // Переводим в миллисекунду
  PulseTime.Value := PulseTime.Value * 10;

  // Фоновый импульс
  BackgroundTime.Value := (100 - PulseTimeToBackground.Value) /
    RippleFrequency.Value;
  // Переводим в миллисекунду
  BackgroundTime.Value := BackgroundTime.Value * 10;

  // Расчет среднего импульса
  AveragePuls.Value := Abs(PulseTime.Value + BackgroundTime.Value) / 2;

  // Выводим шаг импульса
  V := iScales * (PulseTime.Value + BackgroundTime.Value);
  V := V / 1000;

  // ========== РАСЧЕТ ВРЕМЕНИ ИМПУЛЬСА К СКОРОСТИ ==========
  I := Scales.Value - V;
  // Если число отрицательное
  if I < 0 then
  Begin
    // Сверяем с использованием погрешности
    if Abs(I) > Epsilon then
    Begin
      iScales := iScales - 0.01;
      // mLogAdd('V= ' + FormatFloat('0.00', V) + ' << iScales= ' + FormatFloat('0.00', iScales));
      Goto 0;
    End;
  End;

  // Если число положительное
  if I > 0 then
  Begin
    // Сверяем с использованием погрешности
    if I > Epsilon then
    Begin
      iScales := iScales + 0.01;
      // mLogAdd('V= ' + FormatFloat('0.00', V) + ' << iScales= ' + FormatFloat('0.00', iScales));
      Goto 0;
    End;
  End;

  mLogAdd('Частота пульсаций ' + (V0 / V1).ToString, 2);

  mLogAdd('Импульс= ' + FormatFloat('0.00', V) + ' == iScales= ' +
    FormatFloat('0.00', iScales) + ' [' + Scales.Text + ']', 1);

  // ========== РАСЧЕТЫ ПРОВОЛОКИ ==========
  // Дельта подачи проволоки (мм/сек)   [Дельта тока/12]
  iWireFeedDelta := DeltaCurrent.Value / 12;
  // Переводим (мм/сек - см/мин)
  DeltaWire.Value := iWireFeedDelta * 6;

  // Корректировка дельты в ручную
  sDeltaWire.Max := Floor(iWireFeedDelta);
  sDeltaWire.Text := sDeltaWire.Text;
  iWireFeedDelta := iWireFeedDelta - sDeltaWire.Value;
  Label40.Text := Floor(sDeltaWire.Max).ToString + ' Δ';

  // Средняя подача проволоки (мм/сек)
  if (tDiameter = 0) or (tProductAngle >= 40) then
  Begin
    // В линейной/нижней наплавке
    iWireAverage := ((1 + (ThicknessCoefficient.Value / 3)) * Thickness.Value *
      iStepDegree * iSpdWeld) / (Pi * (Wire.Text.ToExtended / 2) *
      (Wire.Text.ToExtended / 2));
  End
  else // if > 0
  Begin // В кольцевой/вертикальной наплавке
    iWireAverage := ((1 + (ThicknessCoefficient.Value / 3)) * Thickness.Value *
      iStepDegree * iSpdWeld) / (Pi * (Wire.Text.ToExtended / 2) *
      (Wire.Text.ToExtended / 2)) /
      (1 + (Thickness.Value / (tDiameter - Thickness.Value)));
  End;

  // Коэффициент скорости подачи (из за замены двигателя с другой скоростью)
  iWireAverage := iWireAverage / FeedCoeff.Value;

  // Переводим скорость подачи проволоки (мм/сек - см/мин)
  WireAverage.Value := iWireAverage * 6;
  mLogAdd('Скорость подачи проволоки (мм/сек) ' + iWireAverage.ToString, 1);

  // Подача проволоки в импульсе
  iWirePulse := iWireAverage + iWireFeedDelta -
    (iWireFeedDelta * PulseTimeToBackground.Value / 100);
  WirePulse.Value := iWirePulse * 6;

  // Подача проволоки в фоне
  iWireBackground := iWirePulse - iWireFeedDelta;

  if iWireBackground <= 0 then
  Begin
    DeltaCurrent.ValueDec;
    Run := False;
    mLog.Lines.Clear;
    UpdateFronius1;
    Exit;
  End;
  WireBackground.Value := iWireBackground * 6;

  // ========== РАСЧЕТЫ СВАРКИ ==========
  mLogAdd('SearchArray Массив', 1);

  // Создание списков строк для разбора значений
  CurrentsStr := TStringList.Create;
  VoltagesStr := TStringList.Create;
  try
    // Используем пробел как разделитель и разбиваем строки на части
    CurrentsStr.Delimiter := ' ';
    VoltagesStr.Delimiter := ' ';
    CurrentsStr.DelimitedText := EditCurrents.Text;
    VoltagesStr.DelimitedText := EditVoltages.Text;

    // Замена точек на запятые в EditVoltages.Text
    VoltagesStr.DelimitedText := StringReplace(EditVoltages.Text, '.', ',',
      [rfReplaceAll]);

    // Динамически устанавливаем размер массивов в зависимости от количества элементов
    SetLength(Currents, CurrentsStr.Count);
    SetLength(Voltages, VoltagesStr.Count);

    // Проверка, что количество элементов в каждом массиве одинаковое
    if CurrentsStr.Count = VoltagesStr.Count then
    begin
      // Заполнение массивов Currents и Voltages
      for iI := 0 to CurrentsStr.Count - 1 do
      begin
        Currents[iI] := StrToFloat(CurrentsStr[iI]);
        Voltages[iI] := StrToFloat(VoltagesStr[iI]);
        mLogAdd(iI.ToString + '- Currents =' + CurrentsStr[iI] + ' | Voltages='
          + VoltagesStr[iI], 1);
      end;
    end
    else
      ShowMessage
        ('Неправильное количество значений в массиве Ток или Напряжение!');
  finally
    // Освобождение памяти
    CurrentsStr.Free;
    VoltagesStr.Free;
  end;

  n := Length(Currents) - 1;
  SetLength(ArrayA, n);
  SetLength(ArrayB, n);
  mLogAdd('Массив n= ' + (n).ToString, 1);

  for Amp := 0 to n - 1 do
  begin
    // Проверка на NaN
    if IsNaN((Voltages[Amp + 1] - (Currents[Amp + 1] / Currents[Amp]) *
      Voltages[Amp]) / (1 - (Currents[Amp + 1] / Currents[Amp]))) then
      Break;
    if IsNaN((Voltages[Amp] - ArrayA[Amp]) / Currents[Amp]) then
      Break;

    ArrayA[Amp] := (Voltages[Amp + 1] - (Currents[Amp + 1] / Currents[Amp]) *
      Voltages[Amp]) / (1 - (Currents[Amp + 1] / Currents[Amp]));
    ArrayB[Amp] := (Voltages[Amp] - ArrayA[Amp]) / Currents[Amp];
  end;

  AMass := Mean(ArrayA);
  BMass := Mean(ArrayB);
  mLogAdd('AMass= ' + AMass.ToString, 1);
  mLogAdd('BMass= ' + BMass.ToString, 1);

  mLogAdd('EnergyCurrent= ' + BoolToStr(EnergyCurrent.IsChecked, True), 1);
  // Через длину дуги
  // Перебераем ток
  if EnergyCurrent.IsChecked then
  Begin
    mLogAdd('[Поиск через ток]', 1);

    Amp := Round(AverageСurrent.Value);
    iLinearEnergy := 2.0;
    while iLinearEnergy <= 10.0 do
    begin
      // tVolt := Amp * BMass + AMass;
      // tLin := ((iLinearEnergy * 100) * iSpdWeld) / (0.6 * Amp);
      // tVoltNew := (Amp) * BMass + AMass;
      // tLinNew := (((iLinearEnergy + 0.1) * 100) * iSpdWeld) / (0.6 * (Amp));

      // Тестовая формула
      tVolt := Amp * BMass + AMass;
      tLin := ((iLinearEnergy * 100) * iSpdWeld) /
        (SpinLinearEnergy.Value * Amp);
      tVoltNew := (Amp) * BMass + AMass;
      tLinNew := (((iLinearEnergy + 0.1) * 100) * iSpdWeld) /
        (SpinLinearEnergy.Value * (Amp));

      // mAdd1.Lines.Add(iLinearEnergy.ToString+' '+ Abs(tLinNew - tVoltNew).ToString+' '+Abs(tLin - tVolt).ToString);
      if Abs(tLinNew - tVoltNew) > Abs(tLin - tVolt) then
      begin
        iСoeffVolt := (ArcLength.Value - 4) / 10 * 2;

        Voltage.Value := tVolt + iСoeffVolt;
        LinearEnergy.Value := iLinearEnergy;
        Break;
      end;
      iLinearEnergy := iLinearEnergy + 0.1;
    end;
    // Конвертируем погонную энергию (кДж/см - кДж/мм)
    iLinearEnergy := iLinearEnergy * 100;
  End
  else
  Begin
    mLogAdd('[Поиск через энерговложение]', 1);

    for Amp := Trunc(Currents[0]) to Trunc(Currents[n]) do
    begin
      // tVolt := Amp * BMass + AMass;
      // tLin := (iLinearEnergy * iSpdWeld) / (0.6 * Amp);
      // tVoltNew := (Amp + 1) * BMass + AMass;
      // tLinNew := (iLinearEnergy * iSpdWeld) / (0.6 * (Amp + 1));

      If Amp >= Trunc(Currents[n]) then
      Begin // Расчеты выше порога расчитываются не точно формулой
        TitleStatus1.Text := 'ПРЕВЫШЕН ЗАДАННЫЙ ПОРОГ ТОКА! Amp=' +
          Currents[n].ToString;
        mLogAdd('Превышен заданный порог тока! Amp=' + (Amp).ToString, 1);
      End;

      // Тестовая формула
      tVolt := Amp * BMass + AMass;
      tLin := (iLinearEnergy * iSpdWeld) / (SpinLinearEnergy.Value * Amp);
      tVoltNew := (Amp + 1) * BMass + AMass;
      tLinNew := (iLinearEnergy * iSpdWeld) /
        (SpinLinearEnergy.Value * (Amp + 1));

      if Abs(tLinNew - tVoltNew) > Abs(tLin - tVolt) then
      Begin
        AverageСurrent.Value := Amp;
        iСoeffVolt := (ArcLength.Value - 4) / 10 * 2;
        Voltage.Value := tVolt + iСoeffVolt;
        Break;
      End;
    End;
  End;

  mLogAdd('Lin ' + tLin.ToString, 1);
  mLogAdd('Volt ' + tVolt.ToString, 1);

  mAdd.Lines.Add('Жесткость режима ' + FloatToStrF(Voltage.Value /
    AverageСurrent.Value, ffNumber, 7, 7));

  // Ток в импульсе (Амп)
  CurrentPulse.Value := AverageСurrent.Value + DeltaCurrent.Value -
    (DeltaCurrent.Value * PulseTimeToBackground.Value / 100);
  // Ток в фоне
  CurrentBackground.Value := CurrentPulse.Value - DeltaCurrent.Value;

  // ========== ПОДОГРЕВ ПРОВОЛОКИ (Код не доделан) ==========
  // Дельта подогрева
  If ThicknessCoefficient.Value = 0.2 then
  Begin
    DeltaWireHeating.Value := DeltaCurrent.Value;
  End
  else
  Begin
    DeltaWireHeating.Value := 0;
  End;

  // Средний подогрев проволоки (Амп)
  HeatingMedium.Value := FeedCoeff.Value *
    Sqrt(1000 * iWireAverage * iSpdWeld * Wire.Text.ToDouble *
    Wire.Text.ToDouble / (iLinearEnergy / 10));

  // Подогрев в импульсе
  HeatingBackground.Value := HeatingMedium.Value +
    (DeltaWire.Value - sDeltaWire.Value) -
    (DeltaWire.Value * PulseTimeToBackground.Value / 100);

  // Подогрев в фоне
  HeatingPulse.Value := HeatingMedium.Value -
    (DeltaWire.Value - sDeltaWire.Value) +
    ((DeltaWire.Value - sDeltaWire.Value) * PulseTimeToBackground.Value / 100);

  // Если кольцевая наплавка
  if WeldingType.IsChecked then
  Begin
    // В нижнем положении
    if tProductAngle < 45 then
    Begin
      // Проверка на ошибку диаметра
      if tDiameter > 0 then
      Begin
        LabF1.Text := 'Длина наплавки (мм)';
        LabD1.Text := '';
        LabD1.Enabled := False;
        D1.Enabled := False;
        TitleStatus1.Text := 'Стартовые режимы';
      End
      else
        TitleStatus1.Text := '';
    End
    else
    Begin
      if tDiameter > 0 then
      Begin
        if Outward.IsChecked then
          LabF1.Text := 'Внешний диаметр (мм)'
        else
          LabF1.Text := 'Внутренний диаметр (мм)';
        LabD1.Text := '';
        LabD1.Enabled := False;
        D1.Enabled := False;
      End
      else
        TitleStatus1.Text := 'Диаметр должен быть >0';
    End;
    // Разблокируем кнопку "Движение на ружу"
    Label19.Enabled := True;
    Outward.Enabled := True;
  End
  else
  Begin
    LabF1.Text := 'Длина сварки (мм)';
    LabD1.Text := 'Ширина сварки (мм)';
    LabD1.Enabled := True;
    D1.Enabled := True;
    // Блокируем кнопку "Движение на ружу"
    Label19.Enabled := False;
    Outward.Enabled := False;
  End;

  // ФИНАЛЬНЫЙ РАЗМЕР НАПЛАВКИ
  // Положение наплавки кольцевая
  if WeldingType.IsChecked then
  Begin
    if tProductAngle < 45 then
    Begin // Вертикальное
      LabDiameter.Text := 'Диаметр';
      // Направление
      if Outward.IsChecked then // С наружи
        FinishedDiameter.Text := '<[' +
          FloatToStrF(tDiameter + ((Thickness.Value * 2) * NumberPasses.Value),
          ffNumber, 4, 1) + ']>'
      else
        // Внутрь
        FinishedDiameter.Text := '[>' +
          FloatToStrF(Abs(tDiameter - ((Thickness.Value * 2) *
          NumberPasses.Value)), ffNumber, 4, 1) + '<]';
    End
    else
    Begin // Нижнее
      if tDiameter = 0 then
        TitleStatus1.Text := 'Диаметр должен быть >4 мм'
      else
        LabDiameter.Text := 'Диаметр';
      FinishedDiameter.Text := '^[' +
        FloatToStrF(Thickness.Value * NumberPasses.Value, ffNumber, 4,
        1) + ']^';
    End;
  End
  else
  Begin // Нижнее
    if tDiameter = 0 then
      LabDiameter.Text := 'Линейная'
    else
      TitleStatus1.Text := 'Диаметр должен быть =0 мм';
    FinishedDiameter.Text := '^[' +
      FloatToStrF(Thickness.Value * NumberPasses.Value, ffNumber, 4, 1) + ']^';
  End;

  // Ищим количество валиков/смещений
  if WeldingType.IsChecked then
  Begin // Кольцевая наплавка
    if tProductAngle >= 45 then
    Begin // Нижнее положение наплавки
      Result := (tDiameter - iLength) / 2;
      StepCount := Ceil(Abs(Result / iStepDegree));
    End
    else // Верхнее положение наплавки
      StepCount := Ceil(Abs(iLength / iStepDegree));
  End
  else
  Begin // Если линейная наплавка
    StepCount := Ceil(Abs(D1.Value / iStepDegree));
  End;

  mAdd.Lines.Add('Кол-во валиков: ' + FloatToStrF(StepCount, ffNumber, 4,
    0) + ' шт');

  // ======== РАСХОД ПРИСАДКИ ========
  // V(в литрах)                 =Power(10, 6))=10⁶
  // V(в кубических метрах)      =Power(10, 9))=10⁹
  // V(в кубических сантиметрах) =Power(10, 3))=10³
  // V(в кубических миллиметрах) =Power(10, 0))=10⁰

  // Расход присадки в час
  Density := 7.9; // коэффициент плотности присадки
  // Переводим скорость подачи проволки
  wireLength := iWireAverage * 6 / 100; // м/мин
  // объем проволоки в м³/мин
  wireVolume := Pi * Sqr(1.2 / 2) * wireLength;
  // масса проволоки в г/мин
  wireMassPerMinute := Density * wireVolume * 1000;
  // масса проволоки в г/час
  wireMassPerHour := wireMassPerMinute * 60;
  // масса проволоки в кг/час
  wireMassHour := wireMassPerHour / 1000;

  mAdd.Lines.Add('Расход проволоки в час: ' + FormatFloat('0', wireMassHour) +
    ' г/час');

  // Ищим объём наплавленного металла
  Result := 0;
  V0 := 0;
  V1 := 0;
  If WeldingType.IsChecked then
  Begin
    V0 := (Pi * Power(tDiameter, 2) * iLength) / (4 * Power(10, 3));
    if Outward.IsChecked then
      I := tDiameter + (Thickness.Value * 2)
    else
      I := tDiameter - (Thickness.Value * 2);
    V1 := (Pi * Power(I, 2) * iLength) / (4 * Power(10, 3)); // V(см³)
    V := Abs(V0 - V1); // Результат

    // Зная коэффициент плотности
    I := V * Density;
    // Переводим граммы в кило
    Result := I / 1000;
  End;

  mAdd.Lines.Add('Расход присадки: ' + FloatToStrF(Result * StepCount, ffNumber,
    24, 3) + ' кг');

  if NumberPasses.Value > 1 then
  Begin
    I := 0;
    While I < NumberPasses.Value do
    Begin
      if Outward2.IsChecked then
        i0 := tDiameter + (Thickness.Value * 2) + (I * Thickness.Value * 2)
      else
        i0 := tDiameter - (Thickness.Value * 2) - (I * Thickness.Value * 2);
      V1 := (Pi * Power(i0, 2) * iLength) / (4 * Power(10, 3));
      I := I + 1;
    End;
    V := Abs(V0 - V1); // Результат
    // Зная коэффициент плотности
    I := V * 7.9;
    // Переводим граммы в кило
    I := I / 1000;
    mAdd.Lines.Add('Всего присадки: ' + FloatToStrF(I * StepCount, ffNumber, 4,
      3) + ' кг');
  End;

  // Ищим время работы станка
  // Вычисление конечного диаметра
  if WeldingType.IsChecked then
  Begin // Кольцевая наплавка
    // Расчет общей длины
    TotalWeldLength := 0;
    I := 0;
    Var
      tWeldLength: Double; // Длина шва для лога

    While I < NumberPasses.Value do
    Begin
      tWeldLength := 0;
      for iI := 0 to StepCount - 1 do
      begin
        // Длина валика для каждого слоя увеличивается пропорционально диаметру
        if Outward.IsChecked then
        Begin
          // Вычисляем радиус меньшего основания
          Result := (tDiameter + (I * (Thickness.Value * 2))) / 2;
          // Используя тригонометрические соотношения, вычисляем радиус большего основания
          Result := Result + (iStepDegree * iI) *
            ArcTan(DegToRad(tProductAngle));
          // Вычисляем диаметр большего основания
          Result := Result * 2;
          // Вычисляем длину окружности большего основания
          WeldLength := Result * Pi;
        End
        else
        Begin
          // Вычисляем радиус меньшего основания
          Result := (tDiameter - (I * (Thickness.Value * 2))) / 2;
          // Используя тригонометрические соотношения, вычисляем радиус большего основания
          Result := Result - (iStepDegree * iI) *
            ArcTan(DegToRad(tProductAngle));
          // Вычисляем диаметр большего основания
          Result := Result * 2;
          // Вычисляем длину окружности большего основания
          WeldLength := Result * Pi;
        End;
        tWeldLength := tWeldLength + WeldLength;
        TotalWeldLength := TotalWeldLength + WeldLength;
      end;
      mLogAdd('Слой ' + I.ToString + ' ℓ шва (м) ' + tWeldLength.ToString, 1);
      I := I + 1;
    End;

    mAdd.Lines.Add('Верхний Ø: ' + FloatToStrF(Result, ffNumber, 4, 0) + ' мм.'
      + ' → ℓ: ' + FloatToStrF(WeldLength, ffNumber, 4, 0) + ' мм');

    // Вычисление времени работы станка в секундах
    iTimeWeld := TotalWeldLength / iSpdWeld;
  End
  Else
  Begin
    // Вычисление времени прохода станка в секундах
    iTimeWeld := (F1.Value / iSpdWeld);

    // Преобразование времени работы в формат (дни, часы, минуты, секунды)
    Seconds := Round(iTimeWeld) mod 60;
    Minutes := (Round(iTimeWeld) div 60) mod 60;
    Hours := (Round(iTimeWeld) div 3600) mod 24;
    Days := Round(iTimeWeld) div 86400;

    mAdd.Lines.Add('Время прохода: ' + Format(' %d:%d:%d',
      [Hours, Minutes, Seconds]));

    // Вычисление времени работы станка в секундах
    iTimeWeld := iTimeWeld * StepCount;
  End;

  // Преобразование времени работы в формат (дни, часы, минуты, секунды)
  Seconds := Round(iTimeWeld) mod 60;
  Minutes := (Round(iTimeWeld) div 60) mod 60;
  Hours := (Round(iTimeWeld) div 3600) mod 24;
  Days := Round(iTimeWeld) div 86400;

  mAdd.Lines.Add('Время сварки: ' +
    Format('%d дней, %d:%d:%d(всего %d часов, %d минут)', [Days, Hours, Minutes,
    Seconds, Round(iTimeWeld) div 3600, (Round(iTimeWeld) div 60) mod 60]));

  // Рекомендация вольфрама
  mAdd.Lines.Add('Марка вольфрама:');
  If BrandElectrode.ItemIndex >= 0 then
  Begin
    if BrandElectrode.Selected.Text = 'Сталь' then
      mAdd.Lines.Add
        ('WL-15 [Золотой], WL-20 [Голубой], WC-20 [Серый], WY-20 [Синий]');
    if BrandElectrode.Selected.Text = 'Алюминий' then
      mAdd.Lines.Add('WZ-8 [Белый]');

    mAdd.Lines.Add('Диаметр вольфрама:');
    if BrandElectrode.Selected.Text = 'Сталь' then
    Begin
      if (Amp >= 15) and (Amp <= 70) then
        mAdd.Lines.Add('1.0 мм (15-70А)');
      if (Amp >= 70) and (Amp <= 120) then
        mAdd.Lines.Add('1.6 мм (70-120А)');
      if (Amp >= 90) and (Amp <= 150) then
        mAdd.Lines.Add('2.0 мм (90-150А)');
      if (Amp >= 110) and (Amp <= 180) then
        mAdd.Lines.Add('2.4 мм (110-180А)');
      if (Amp >= 150) and (Amp <= 220) then
        mAdd.Lines.Add('3.0 мм (150-220А)');
      if (Amp >= 180) and (Amp <= 270) then
        mAdd.Lines.Add('3.2 мм (180-270А)');
      if (Amp >= 200) and (Amp <= 350) then
        mAdd.Lines.Add('4.0 мм (200-350А)');
      if (Amp > 350) then
        mAdd.Lines.Add('Нет данных!');
    End;

    if BrandElectrode.Selected.Text = 'Алюминий' then
    Begin
      // if (Amp >= 10) and (Amp <= 60) then
      // Memo1.Lines.Add('1.0 мм');
      if (Amp >= 60) and (Amp <= 120) then
        mAdd.Lines.Add('1.6 мм (60-120А)');
      if (Amp >= 70) and (Amp <= 130) then
        mAdd.Lines.Add('2.0 мм (70-130А)');
      if (Amp >= 100) and (Amp <= 180) then
        mAdd.Lines.Add('2.4 мм (100-180А)');
      if (Amp >= 130) and (Amp <= 200) then
        mAdd.Lines.Add('3.0 мм (130-200А)');
      if (Amp >= 160) and (Amp <= 250) then
        mAdd.Lines.Add('3.2 мм (160-250А)');
      if (Amp >= 180) and (Amp <= 330) then
        mAdd.Lines.Add('4.0 мм (180-330А)');
      if (Amp > 330) then
        mAdd.Lines.Add('Нет данных!');
    End;
  End
  else
    mAdd.Lines.Add('Не выбран свариваемый материал!');

  mAdd.Lines.Add('Выходной диаметр сопла:');
  if (Amp >= 10) and (Amp <= 179) then
    mAdd.Lines.Add('6,4-9,5 мм');
  if (Amp >= 180) and (Amp <= 350) then
    mAdd.Lines.Add('9,5-12,0 мм');

  mAdd.Lines.Add('Расход аргона:');
  // mAdd.Lines.Add(FloatToStr((Amp / 400) * 100));
  // mAdd.Lines.Add(FloatToStr(Abs(Amp - 100)));
  if (Amp >= 10) and (Amp <= 59) then
    mAdd.Lines.Add('6-8 л/мин.');
  if (Amp >= 60) and (Amp <= 99) then
    mAdd.Lines.Add('8-10 л/мин.');
  if (Amp >= 100) and (Amp <= 149) then
    mAdd.Lines.Add('10-14 л/мин.');
  if (Amp >= 150) and (Amp <= 199) then
    mAdd.Lines.Add('13-15 л/мин.');
  if (Amp >= 200) and (Amp <= 259) then
    mAdd.Lines.Add('15-18 л/мин.');
  if (Amp >= 260) and (Amp <= 299) then
    mAdd.Lines.Add('18-20 л/мин.');
  if (Amp >= 300) and (Amp <= 460) then
    mAdd.Lines.Add('20-25 л/мин.');

  // mAdd.Lines.Add('Глубина проплавления: ' + CalculatePenetrationDepth
  // (AverageСurrent.Value, 0.1, SpdWeld.Value, 4));
  // mAdd.Lines.Add('Глубина проплавления: ' + DepthOfPenetration
  // (AverageСurrent.Value, Voltage.Value, 0.3));

  // Останавливаем таймер и получаем прошедшее время
  // Stopwatch.Stop;
  // mLogAdd('StopwatchFronius1 ' + Stopwatch.ElapsedMilliseconds.ToString+' миллисекунды', 1);
  mLog.EndUpdate;
  mAdd.EndUpdate;
  Run := False;
End;

function CalculateOuterDiameter(InnerDiameter, Angle, Distance: Double): Double;
var
  InnerRadius, OuterRadius, ArcLength1, ArcLength2: Double;
begin
  InnerRadius := InnerDiameter / 2;
  ArcLength1 := 2 * Pi * InnerRadius * (Angle / 360);
  ArcLength2 := ArcLength1 + Distance;
  OuterRadius := (ArcLength2 * 360) / (2 * Pi * Angle);
  Result := OuterRadius * 2;
end;

procedure TfATFronius.UpdateFronius2;
Label 0;
// const
// Currents: array [0 .. 7] of Double = (100, 150, 200, 250, 300, 350, 400, 450);
// Voltages: array [0 .. 7] of Double = (9.3, 9.9, 11, 12.1, 13, 14.2, 15.2, 16.4);

Var
  Currents: array of Double;
  Voltages: array of Double;
  CurrentsStr, VoltagesStr: TStringList;
  WeldTime: TDateTime;
  StepCount: Integer; // Количество шагов
  iCoeffAmp, iСoeffVolt, iScales, AMass, BMass, // Среднее значение массива
  RippleFrequency, // Частота пульсации
  iWirePulse, // Подача проволоки в импульсе  (мм/сек)
  iWireBackground, // Подача проволоки в фоне (мм/сек)
  iSpdWeld, // Скорость сварки (мм/сек)
  iLinearEnergy, // Погонная энергия (кДж/мм)
  iWireAverage, // Средняя подача проволоки (мм/сек)
  iHeatingMedium, // Средний подогрев проволоки (Амп)
  iWireFeedDelta, // Дельта подачи проволоки (мм/сек)
  iWireHeatingMedium, // Подогрев проволоки средний (Амп)
  iDeltaWireHeating // Дельта подогрева проволоки (Амп)
    : Double; // Extended Double;
  I, i0, i2, i3, i4, V, V0, V1: Double;
  dAngle, tVoltNew, tLinNew, tVolt, tLin, iTimeWeld, tDiameter: Double;
  WeldingTime: TDateTime;
  Amp, I5, n: Integer;
  // динамический массив
  // MasA, MasB: array of Double; // динамический массив
  ArrayA, ArrayB: array of Double;
  InclineFactor: Double;
  TotalWeldLength: Double;
  iI: Integer;
  DeltaDiameter: Double;
  TopDiameter: Double;
  DiameterEnd: Double;
  DiameterAvg: Double;
  CircumferenceAvg: Double;
  AngleStep: Double;
  FinalDiameter: Double;
  AvgDiameter: Double;
  WeldLength: Double;
  SpdWeld: Double;
  Result, // Для временного сохранения результата
  tProductAngle, // Угол наклона поверхности наплавки
  iStepDegree, // Шаг с учётом угла изделия
  iLength: Double; // Длина наплавки
  InnerRadius: Double;
  OuterRadius: Double;
  Angle, Height: Double;
  r1: Double;
  r2: Double;
  Days, Hours, Minutes, Seconds: Word;
  wireVolume, Density, wireMassHour, wireLength, wireMassPerMinute,
    wireMassPerHour: Double;
  // Stopwatch: TStopwatch;
Begin
  // Если поток запущен, завершаем этот
  if Run then
    Exit;
  Run := True;
  // Создаем объект класса TStopwatch
  // Stopwatch := TStopwatch.StartNew;

  // Выбрана бикатодная голова/или обычная
  if TwoSources.IsChecked then
    Label106.Text := 'Толщина наплавки (x2)'
  else
    Label106.Text := 'Толщина наплавки';

  // Вид наплавки
  if WeldingType2.IsChecked then
    lblWeldType2.Text := 'Кольцевая наплавка'
  else
    lblWeldType2.Text := 'Линейная/Нижняя наплавка';

  // Если выбрана кольцевая наплавка с диаметром <5 мм. предупреждаем об ошибки
  if (WeldingType2.IsChecked) and (Diameter2.Value < 5) then
  Begin
    TitleStatus2.Text := 'Диаметр не может равнятся 0-4 мм';
    LabD2.Enabled := False;
    D2.Enabled := False;
    Run := False;
    Exit;
  End
  Else
  Begin
    // Если выбрана линейная наплавка
    TitleStatus2.Text := 'Стартовые режимы';
    LabF2.Text := 'Длина сварки (мм)';
    LabD2.Enabled := False;
    D2.Enabled := False;
  End;

  // Если выбрана линейная наплавка с диаметром от 1 до 4 мм. предупреждаем об ошибки
  if (not WeldingType2.IsChecked) and (Diameter2.Value < 5) and
    (Diameter2.Value >= 1) then
  Begin
    TitleStatus2.Text := 'Диаметр не может равнятся 1-4 мм';
    Run := False;
    Exit;
  End
  Else
  Begin
    // Выводим информацию для расчетов (времени, затрат проволоки)
    if Diameter2.Value >= 1 then
    Begin
      LabF2.Text := 'Внутренний диаметр (мм)';
      LabD2.Enabled := False;
      D2.Enabled := False;
    End
    else
    Begin
      LabF2.Text := 'Длина сварки (мм)';
      LabD2.Enabled := True;
      D2.Enabled := True;
    End;
  End;

  mAdd2.BeginUpdate;
  mLog.BeginUpdate;
  mAdd2.Lines.Clear;
  mLog.Lines.Clear;

  tDiameter := Diameter2.Value;
  tProductAngle := ProductAngle2.Value;
  iLength := F2.Value;
  WeldLength := 0;
  FinalDiameter := 0;

  mLogAdd('> UpDateFronius2 <', 2);

  // РАСЧЕТ ШАГА ПРИ НАКЛОНЕ ЗАГОТОВКИ
  // До 45° градусов
  iStepDegree := StepSize2.Value;

  if ProductAngle2.Value <= 45 then
    dAngle := iStepDegree * Cos(DegToRad(tProductAngle))
  else // После 45° градусов
    dAngle := iStepDegree * Sin(DegToRad(tProductAngle));

  if SimpleRoundTo(dAngle, -1) <> SimpleRoundTo(iStepDegree, -1) then
  Begin
    // Обновляем шаг для дальнейших расчетом с учетом угла
    iStepDegree := dAngle;
    // Выводим скорректированный шаг для угла
    NewStep2.Text := FloatToStrF(dAngle, ffNumber, 4, 1) + ' <';
    mAdd2.Lines.Add('Шаг при ' + tProductAngle.ToString + '° ' + StepSize2.Text
      + '=' + FloatToStrF(dAngle, ffNumber, 4, 1) + ' мм');
    mLogAdd('Step (' + tProductAngle.ToString + '°) ' + StepSize2.Text + ' = ' +
      FloatToStrF(dAngle, ffNumber, 4, 1) + ' мм', 2);
  End
  else // Очищаем если изменения незаметные
    NewStep2.Text := '';
  // ===========================================================================

  // Конвертируем скорость сварки (см/мин - мм/сек)
  iSpdWeld := SpdWeld2.Value / 6;
  mLogAdd('Скорость сварки (мм/сек)= ' + iSpdWeld.ToString, 2);

  // Конвертируем погонную энергию (кДж/см - кДж/мм)
  iLinearEnergy := LinearEnergy2.Value * 100;
  mLogAdd('Погонную энергия (кДж/мм)= ' + iLinearEnergy.ToString, 2);

  if WeldingType2.IsChecked then // Вертикальная сварка
    ThicknessCoefficient2.Value := 0.6
  else // В нижнем положении
    ThicknessCoefficient2.Value := 0.5;

  // Время пульса к фону (%)
  PulseTimeToBackground2.Value := ThicknessCoefficient2.Value * 100;

  // Частота пульсации =Гц
  // Угол для начала расчета вертикальной наплавки
  iScales := Scales2.Value;

0:
  V0 := 0;
  V1 := 0;

  if (ProductAngle2.Value >= 40) or (tDiameter = 0) then
  Begin
    // В линейной/нижней наплавке
    RippleFrequency2.Value := iSpdWeld / iScales;
  End
  else
  Begin
    // В кольцевой/вертикальной наплавке
    if Outward.IsChecked then
    Begin
      V0 := iSpdWeld * (tDiameter / (tDiameter + Thickness2.Value * 2));
      V1 := iScales * ((Thickness2.Value / (tDiameter - Thickness2.Value)) + 1);
    End
    else
    Begin
      V0 := iSpdWeld * (tDiameter / (tDiameter - Thickness2.Value * 2));
      V1 := iScales * ((Thickness2.Value / (tDiameter - Thickness2.Value)) + 1);
    End;

    RippleFrequency2.Value := V0 / V1;
  End;

  // ========== РАСЧЁТ ЧАСТОТЫ ПУЛЬСА СВАРКИ ==========
  // Сварочный импульс
  PulseTime2.Value := PulseTimeToBackground2.Value / RippleFrequency2.Value;
  // Переводим в миллисекунду
  PulseTime2.Value := PulseTime2.Value * 10;

  // Фоновый импульс
  BackgroundTime2.Value := (100 - PulseTimeToBackground2.Value) /
    RippleFrequency2.Value;
  // Переводим в миллисекунду
  BackgroundTime2.Value := BackgroundTime2.Value * 10;

  // Расчет среднего импульса
  AveragePuls2.Value := Abs(PulseTime2.Value + BackgroundTime2.Value) / 2;

  // Выводим шаг импульса
  V := iScales * (PulseTime2.Value + BackgroundTime2.Value);
  V := V / 1000;

  // ========== РАСЧЕТ ВРЕМЕНИ ИМПУЛЬСА К СКОРОСТИ ==========
  I := Scales2.Value - V;
  // Если число отрицательное
  if I < 0 then
  Begin
    // Сверяем с использованием погрешности
    if Abs(I) > Epsilon then
    Begin
      iScales := iScales - 0.01;
      // mLogAdd('V= ' + FormatFloat('0.00', V) + ' << iScales= ' + FormatFloat('0.00', iScales));
      Goto 0;
    End;
  End;

  // Если число положительное
  if I > 0 then
  Begin
    // Сверяем с использованием погрешности
    if I > Epsilon then
    Begin
      iScales := iScales + 0.01;
      // mLogAdd('V= ' + FormatFloat('0.00', V) + ' << iScales= ' + FormatFloat('0.00', iScales));
      Goto 0;
    End;
  End;

  mLogAdd('Частота пульсаций ' + (V0 / V1).ToString, 2);

  mLogAdd('Импульс= ' + FormatFloat('0.00', V) + ' == iScales= ' +
    FormatFloat('0.00', iScales) + ' [' + Scales2.Text + ']', 2);

  // ========== РАСЧЕТЫ ПРОВОЛОКИ ==========
  // Дельта подачи проволоки (мм/сек)
  iWireFeedDelta := DeltaCurrent2.Value / 12;
  // Переводим (мм/сек - см/мин)
  DeltaWire2.Value := iWireFeedDelta * 6;

  // Корректировка дельты проволоки в ручную
  sDeltaWire2.Max := Floor(iWireFeedDelta);
  sDeltaWire2.Text := sDeltaWire2.Text;
  iWireFeedDelta := iWireFeedDelta - sDeltaWire2.Value;
  Label140.Text := Floor(sDeltaWire2.Max).ToString + ' Δ';

  // Средняя подача проволоки (мм/сек)
  if (tDiameter = 0) or (ProductAngle2.Value >= 40) then
  Begin
    // В линейной/нижней наплавке
    iWireAverage := ((1 + (ThicknessCoefficient2.Value / 4)) * Thickness2.Value
      * iStepDegree * iSpdWeld) /
      (2 * (Pi * (Wire2.Text.ToExtended / 2) * (Wire2.Text.ToExtended / 2)));
  End
  else // if > 0
  Begin // В кольцевой/вертикальной наплавке
    iWireAverage := ((1 + (ThicknessCoefficient2.Value / 3)) * Thickness2.Value
      * iStepDegree * iSpdWeld) /
      (2 * (Pi * (Wire2.Text.ToExtended / 2) * (Wire2.Text.ToExtended / 2))) /
      (1 + (Thickness2.Value / (tDiameter - Thickness2.Value)));
  End;

  // Количество подачей присадки
  If not TwoSources.IsChecked then
  Begin
    iWireAverage := iWireAverage * 2;
    mLogAdd('2 источника= True', 2);
  End;

  // Коэффициент скорости подачи (из за замены двигателя с другой скоростью)
  iWireAverage := iWireAverage / FeedCoeff2.Value;

  // Переводим скорость подачи проволоки (мм/сек - см/мин)
  WireAverage2.Value := iWireAverage * 6;
  mLogAdd('Скорость подачи проволоки (мм/сек) ' + iWireAverage.ToString, 2);

  // Подача проволоки в импульсе
  iWirePulse := iWireAverage + iWireFeedDelta -
    (iWireFeedDelta * PulseTimeToBackground2.Value / 100);
  WirePulse2.Value := iWirePulse * 6;

  // Подача проволоки в фоне
  iWireBackground := iWirePulse - iWireFeedDelta;

  if iWireBackground <= 0 then
  Begin
    DeltaCurrent2.ValueDec;
    Run := False;
    UpdateFronius2;
    Exit;
  End;
  WireBackground2.Value := iWireBackground * 6;

  // ========== РАСЧЕТЫ СВАРКИ ==========
  mLogAdd('SearchArray2 Массив', 2);

  // Создание списков строк для разбора значений
  CurrentsStr := TStringList.Create;
  VoltagesStr := TStringList.Create;
  try
    // Используем пробел как разделитель и разбиваем строки на части
    CurrentsStr.Delimiter := ' ';
    VoltagesStr.Delimiter := ' ';
    CurrentsStr.DelimitedText := EditCurrents2.Text;
    VoltagesStr.DelimitedText := EditVoltages2.Text;

    // Замена точек на запятые в EditVoltages.Text
    VoltagesStr.DelimitedText := StringReplace(EditVoltages2.Text, '.', ',',
      [rfReplaceAll]);

    // Динамически устанавливаем размер массивов в зависимости от количества элементов
    SetLength(Currents, CurrentsStr.Count);
    SetLength(Voltages, VoltagesStr.Count);

    // Проверка, что количество элементов в каждом массиве одинаковое
    if CurrentsStr.Count = VoltagesStr.Count then
    begin
      // Заполнение массивов Currents и Voltages
      for iI := 0 to CurrentsStr.Count - 1 do
      begin
        Currents[iI] := StrToFloat(CurrentsStr[iI]);
        Voltages[iI] := StrToFloat(VoltagesStr[iI]);
        // mLogAdd(iI.ToString + '- Currents =' + CurrentsStr[iI] + ' | Voltages=' + VoltagesStr[iI], 2);
      end;
    end
    else
      ShowMessage
        ('Неправильное количество значений в массиве Ток или Напряжение!');
  finally
    // Освобождение памяти
    CurrentsStr.Free;
    VoltagesStr.Free;
  end;

  n := Length(Currents) - 1;
  SetLength(ArrayA, n);
  SetLength(ArrayB, n);
  mLogAdd('Массив n= ' + n.ToString, 2);

  for Amp := 0 to n - 1 do
  begin
    // Проверка на NaN
    if IsNaN((Voltages[Amp + 1] - (Currents[Amp + 1] / Currents[Amp]) *
      Voltages[Amp]) / (1 - (Currents[Amp + 1] / Currents[Amp]))) then
      Break;
    if IsNaN((Voltages[Amp] - ArrayA[Amp]) / Currents[Amp]) then
      Break;

    ArrayA[Amp] := (Voltages[Amp + 1] - (Currents[Amp + 1] / Currents[Amp]) *
      Voltages[Amp]) / (1 - (Currents[Amp + 1] / Currents[Amp]));
    ArrayB[Amp] := (Voltages[Amp] - ArrayA[Amp]) / Currents[Amp];
  end;

  AMass := Mean(ArrayA);
  BMass := Mean(ArrayB);
  mLogAdd('AMass2= ' + AMass.ToString, 2);
  mLogAdd('BMass2= ' + BMass.ToString, 2);

  // Через длину дуги
  // Перебераем ток
  if EnergyCurrent2.IsChecked then
  Begin
    mLogAdd('[Поиск через ток]', 2);
    Amp := Round(AverageСurrent2.Value);
    iLinearEnergy := 2.0;

    while iLinearEnergy <= 10.0 do
    begin
      // tVolt := Amp * BMass + AMass;
      // // (Погонная энергия кДж/мм * Скорость сварки мм/сек) / (Коэффициент * Ампер)
      // tLin := ((iLinearEnergy * 100) * iSpdWeld) / (0.6 * Amp);
      // tVoltNew := (Amp) * BMass + AMass;
      // tLinNew := (((iLinearEnergy + 0.1) * 100) * iSpdWeld) / (0.6 * (Amp));

      // Тестовая формула
      tVolt := Amp * BMass + AMass;
      // (Погонная энергия кДж/мм * Скорость сварки мм/сек) / (Коэффициент * Ампер)
      tLin := ((iLinearEnergy * 100) * iSpdWeld) /
        (SpinLinearEnergy2.Value * Amp);
      tVoltNew := (Amp) * BMass + AMass;
      tLinNew := (((iLinearEnergy + 0.1) * 100) * iSpdWeld) /
        (SpinLinearEnergy2.Value * (Amp));
      /// /////////////////////

      // mAdd2.Lines.Add(iLinearEnergy.ToString+' '+ Abs(tLinNew - tVoltNew).ToString+' '+Abs(tLin - tVolt).ToString);
      if Abs(tLinNew - tVoltNew) > Abs(tLin - tVolt) then
      begin
        // mAdd2.Lines.Add(iLinearEnergy.ToString+' '+ Abs(tLinNew - tVoltNew).ToString+' '+Abs(tLin - tVolt).ToString);

        if TwoSources.IsChecked then
          iСoeffVolt := (ArcLength2.Value - 4) / 10 * 2.5
        else // 1.3 Коэффициент для одного электрода
          iСoeffVolt := (ArcLength2.Value - 4) / 10 * 2.5 + 1.3;

        Voltage2.Value := tVolt + iСoeffVolt;
        LinearEnergy2.Value := iLinearEnergy;

        Break;
      end;
      iLinearEnergy := iLinearEnergy + 0.1;
    end;
    // Конвертируем погонную энергию (кДж/см - кДж/мм)
    iLinearEnergy := iLinearEnergy * 100;
  End
  else
  Begin
    mLogAdd('[Поиск через энерговложение]', 2);

    for Amp := Trunc(Currents[0]) to Trunc(Currents[n]) do
    begin
      // tVolt := Amp * BMass + AMass;
      // tLin := (iLinearEnergy * iSpdWeld) / (0.6 * Amp);
      // tVoltNew := (Amp + 1) * BMass + AMass;
      // tLinNew := (iLinearEnergy * iSpdWeld) / (0.6 * (Amp + 1));

      If Amp >= Trunc(Currents[n]) then
      Begin // Расчеты выше порога расчитываются не точно формулой
        TitleStatus1.Text := 'ПРЕВЫШЕН ЗАДАННЫЙ ПОРОГ ТОКА! Amp=' +
          Currents[n].ToString;
        mLogAdd('Превышен заданный порог тока! Amp=' + (Amp).ToString, 2);
      End;

      // Тестовая формула
      tVolt := Amp * BMass + AMass;
      tLin := (iLinearEnergy * iSpdWeld) / (SpinLinearEnergy2.Value * Amp);
      tVoltNew := (Amp + 1) * BMass + AMass;
      tLinNew := (iLinearEnergy * iSpdWeld) /
        (SpinLinearEnergy2.Value * (Amp + 1));

      if Abs(tLinNew - tVoltNew) > Abs(tLin - tVolt) then
      begin
        // mAdd2.Lines.Add(LinearEnergy2.Text+' '+ Abs(tLinNew - tVoltNew).ToString+' '+Abs(tLin - tVolt).ToString);

        AverageСurrent2.Value := Amp;
        if TwoSources.IsChecked then
          iСoeffVolt := (ArcLength2.Value - 4) / 10 * 2.5
        else
          iСoeffVolt := (ArcLength2.Value - 4) / 10 * 2.5 + 1.3;
        Voltage2.Value := tVolt + iСoeffVolt;
        Break;
      end;
    end;
  End;

  mLogAdd('Lin2 ' + tLin.ToString, 2);
  mLogAdd('Volt2 ' + tVolt.ToString, 2);

  mAdd2.Lines.Add('Жесткость режима ' + FloatToStrF(Voltage2.Value /
    AverageСurrent2.Value, ffNumber, 7, 7));

  // Ток в импульсе (Амп)
  CurrentPulse2.Value := AverageСurrent2.Value + DeltaCurrent2.Value -
    (DeltaCurrent2.Value * PulseTimeToBackground2.Value / 100);
  // Ток в фоне
  CurrentBackground2.Value := CurrentPulse2.Value - DeltaCurrent2.Value;

  // ========== ПОДОГРЕВ ПРОВОЛОКИ (Код не доделан)==========
  // Дельта подогрева
  If ThicknessCoefficient2.Value = 0.2 then
  Begin
    DeltaWireHeating2.Value := DeltaCurrent2.Value;
  End
  else
  Begin
    DeltaWireHeating2.Value := 0;
  End;

  // Средний подогрев проволоки (Амп)
  HeatingMedium2.Value := FeedCoeff2.Value *
    Sqrt(1000 * iWireAverage * iSpdWeld * Wire2.Text.ToDouble *
    Wire2.Text.ToDouble / (iLinearEnergy / 10));

  HeatingBackground2.Value := HeatingMedium2.Value +
    (DeltaWire2.Value - sDeltaWire2.Value) -
    (DeltaWire2.Value * PulseTimeToBackground2.Value / 100);

  HeatingPulse2.Value := HeatingMedium2.Value -
    (DeltaWire2.Value - sDeltaWire2.Value) +
    (DeltaWire2.Value * PulseTimeToBackground2.Value / 100);

  // Если кольцевая наплавка
  if WeldingType2.IsChecked then
  Begin
    // В нижнем положении
    if tProductAngle < 45 then
    Begin
      // Проверка на ошибку диаметра
      if tDiameter > 0 then
      Begin
        LabF2.Text := 'Длина наплавки (мм)';
        LabD2.Text := '';
        LabD2.Enabled := False;
        D2.Enabled := False;
        TitleStatus2.Text := 'Стартовые режимы';
      End
      else
        TitleStatus2.Text := 'Диаметр должен быть >0 мм';
    End
    else
    Begin
      if tDiameter > 0 then
      Begin
        if Outward2.IsChecked then
          LabF2.Text := 'Внешний диаметр (мм)'
        else
          LabF2.Text := 'Внутренний диаметр (мм)';
        LabD2.Text := '';
        LabD2.Enabled := False;
        D2.Enabled := False;
      End
      else
        TitleStatus2.Text := 'Диаметр должен быть >0 мм';
    End;
    // Разблокируем кнопку "Движение на ружу"
    Label118.Enabled := True;
    Outward2.Enabled := True;
  End
  else
  Begin
    LabF2.Text := 'Длина сварки (мм)';
    LabD2.Text := 'Ширина сварки (мм)';
    LabD2.Enabled := True;
    D2.Enabled := True;
    // Блокируем кнопку "Движение на ружу"
    Label118.Enabled := False;
    Outward2.Enabled := False;
  End;

  // ФИНАЛЬНЫЙ РАЗМЕР НАПЛАВКИ
  // Положение наплавки кольцевая
  if WeldingType2.IsChecked then
  Begin
    if tProductAngle < 45 then
    Begin // Вертикальное
      LabDiameter2.Text := 'Диаметр';
      // Направление
      if Outward2.IsChecked then // С наружи
        FinishedDiameter2.Text := '<[' +
          FloatToStrF(tDiameter + ((Thickness2.Value * 2) *
          NumberPasses2.Value), ffNumber, 4, 1) + ']>'
      else
        // Внутрь
        FinishedDiameter2.Text := '[>' +
          FloatToStrF(Abs(tDiameter - ((Thickness2.Value * 2) *
          NumberPasses2.Value)), ffNumber, 4, 1) + '<]';
    End
    else
    Begin // Нижнее
      if tDiameter = 0 then
        TitleStatus2.Text := 'Диаметр должен быть >4 мм'
      else
        LabDiameter2.Text := 'Диаметр';
      FinishedDiameter2.Text := '^[' +
        FloatToStrF(Thickness2.Value * NumberPasses2.Value, ffNumber, 4,
        1) + ']^';
    End;
  End
  else
  Begin // Нижнее
    if tDiameter = 0 then
      LabDiameter2.Text := 'Линейная'
    else
      TitleStatus2.Text := 'Диаметр должен быть =0 мм';
    FinishedDiameter2.Text := '^[' +
      FloatToStrF(Thickness2.Value * NumberPasses2.Value, ffNumber, 4,
      1) + ']^';
  End;

  // Ищим количество валиков/смещений
  if WeldingType2.IsChecked then
  Begin // Кольцевая наплавка
    if tProductAngle >= 45 then
    Begin // Нижнее положение наплавки
      Result := (tDiameter - iLength) / 2;
      StepCount := Ceil(Abs(Result / iStepDegree));
    End
    else // Верхнее положение наплавки
      StepCount := Ceil(Abs(iLength / iStepDegree));
  End
  else
  Begin // Если линейная наплавка
    StepCount := Ceil(Abs(D2.Value / iStepDegree));
  End;

  mAdd2.Lines.Add('Кол-во валиков: ' + FloatToStrF(StepCount, ffNumber, 4,
    0) + ' шт');

  // ======== РАСХОД ПРИСАДКИ ========
  // V(в литрах)                 =Power(10, 6))=10⁶
  // V(в кубических метрах)      =Power(10, 9))=10⁹
  // V(в кубических сантиметрах) =Power(10, 3))=10³
  // V(в кубических миллиметрах) =Power(10, 0))=10⁰

  // Расход присадки в час
  Density := 7.9; // коэффициент плотности присадки
  // Переводим скорость подачи проволки
  wireLength := iWireAverage * 6 / 100; // м/мин
  // объем проволоки в м³/мин
  wireVolume := Pi * Sqr(1.2 / 2) * wireLength;
  // масса проволоки в г/мин
  wireMassPerMinute := Density * wireVolume * 1000;
  // масса проволоки в г/час
  wireMassPerHour := wireMassPerMinute * 60;
  // масса проволоки в кг/час
  wireMassHour := wireMassPerHour / 1000;

  mAdd2.Lines.Add('Расход проволоки в час: ' + FormatFloat('0', wireMassHour) +
    ' г/час');

  // Ищим объём наплавленного металла
  Result := 0;
  V0 := 0;
  V1 := 0;
  If WeldingType2.IsChecked then
  Begin
    V0 := (Pi * Power(tDiameter, 2) * iLength) / (4 * Power(10, 3));
    if Outward2.IsChecked then
      I := tDiameter + (Thickness2.Value * 2)
    else
      I := tDiameter - (Thickness2.Value * 2);
    V1 := (Pi * Power(I, 2) * iLength) / (4 * Power(10, 3)); // V(см³)
    V := V0 - V1; // Результат

    // Зная коэффициент плотности
    I := V * Density;
    // Переводим граммы в кило
    I := I / 1000;
  End;

  mAdd2.Lines.Add('Расход присадки: ' + FloatToStrF(I, ffNumber, 24, 3)
    + ' кг');

  if NumberPasses2.Value > 1 then
  Begin
    I := 0;
    While I < NumberPasses2.Value do
    Begin
      if Outward2.IsChecked then
        i0 := tDiameter + (Thickness2.Value * 2) + (I * Thickness2.Value * 2)
      else
        i0 := tDiameter - (Thickness2.Value * 2) - (I * Thickness2.Value * 2);
      V1 := (Pi * Power(i0, 2) * iLength) / (4 * Power(10, 3));
      I := I + 1;
    End;
    V := Abs(V0 - V1); // Результат
    // Зная коэффициент плотности
    I := V * 7.9;
    // Переводим граммы в кило
    I := I / 1000;
    mAdd2.Lines.Add('Всего присадки: ' + FloatToStrF(I, ffNumber, 4, 3)
      + ' кг');
  End;

  // Ищим время работы станка
  // Вычисление конечного диаметра
  if WeldingType2.IsChecked then
  Begin // Кольцевая наплавка
    // Расчет общей длины
    TotalWeldLength := 0;
    I := 0;
    Var
      tWeldLength: Double; // Длина шва для лога

    tWeldLength := 0;
    While I < NumberPasses2.Value do
    Begin
      for iI := 0 to StepCount - 1 do
      begin
        // Длина валика для каждого слоя увеличивается пропорционально диаметру
        if Outward2.IsChecked then
        Begin
          // Вычисляем радиус меньшего основания
          Result := (tDiameter + (I * (Thickness2.Value * 2))) / 2;
          // Result := tDiameter / 2;
          // Используя тригонометрические соотношения, вычисляем радиус большего основания
          Result := Result + (iStepDegree * iI) *
            ArcTan(DegToRad(tProductAngle));
          // Вычисляем диаметр большего основания
          Result := Result * 2;
          // Вычисляем длину окружности большего основания
          WeldLength := Result * Pi;
        End
        else
        Begin
          // Вычисляем радиус меньшего основания
          Result := (tDiameter - (I * (Thickness2.Value * 2))) / 2;
          // Result := tDiameter / 2;
          // Используя тригонометрические соотношения, вычисляем радиус большего основания
          Result := Result - (iStepDegree * iI) *
            ArcTan(DegToRad(tProductAngle));
          // Вычисляем диаметр большего основания
          Result := Result * 2;
          // Вычисляем длину окружности большего основания
          WeldLength := Result * Pi;
        End;
        tWeldLength := tWeldLength + WeldLength;
        TotalWeldLength := TotalWeldLength + WeldLength;
      end;
      mLogAdd('Слой ' + I.ToString + ' ℓ шва (м) ' + tWeldLength.ToString, 2);
      I := I + 1;
    End;

    mAdd2.Lines.Add('Верхний Ø: ' + FloatToStrF(Result, ffNumber, 4, 0) + ' мм.'
      + ' → ℓ: ' + FloatToStrF(WeldLength, ffNumber, 4, 0) + ' мм');

    // Вычисление времени работы станка в секундах
    iTimeWeld := TotalWeldLength / iSpdWeld;
  End
  Else
  Begin
    // Вычисление времени прохода станка в секундах
    iTimeWeld := (F2.Value / iSpdWeld);

    // Преобразование времени работы в формат (дни, часы, минуты, секунды)
    Seconds := Round(iTimeWeld) mod 60;
    Minutes := (Round(iTimeWeld) div 60) mod 60;
    Hours := (Round(iTimeWeld) div 3600) mod 24;
    Days := Round(iTimeWeld) div 86400;

    mAdd2.Lines.Add('Время прохода: ' + Format(' %d:%d:%d',
      [Hours, Minutes, Seconds]));

    // Вычисление времени работы станка в секундах
    iTimeWeld := iTimeWeld * StepCount;
  End;

  // Преобразование времени работы в формат (дни, часы, минуты, секунды)
  Seconds := Round(iTimeWeld) mod 60;
  Minutes := (Round(iTimeWeld) div 60) mod 60;
  Hours := (Round(iTimeWeld) div 3600) mod 24;
  Days := Round(iTimeWeld) div 86400;

  mAdd2.Lines.Add('Время сварки: ' +
    Format('%d дней, %d:%d:%d (всего %d часов, %d минут)',
    [Days, Hours, Minutes, Seconds, Round(iTimeWeld) div 3600,
    (Round(iTimeWeld) div 60) mod 60]));

  // Рекомендация вольфрама
  mAdd2.Lines.Add('Марка вольфрама:');
  If BrandElectrode.ItemIndex >= 0 then
  Begin
    if BrandElectrode2.Selected.Text = 'Сталь' then
      mAdd2.Lines.Add
        ('WL-15 [Золотой], WL-20 [Голубой], WC-20 [Серый], WY-20 [Синий]');
    if BrandElectrode2.Selected.Text = 'Алюминий' then
      mAdd2.Lines.Add('WZ-8 [Белый]');

    mAdd2.Lines.Add('Диаметр вольфрама:');
    if BrandElectrode.Selected.Text = 'Сталь' then
    Begin
      if (Amp >= 15) and (Amp <= 70) then
        mAdd2.Lines.Add('1.0 мм (15-70А)');
      if (Amp >= 70) and (Amp <= 120) then
        mAdd2.Lines.Add('1.6 мм (70-120А)');
      if (Amp >= 90) and (Amp <= 150) then
        mAdd2.Lines.Add('2.0 мм (90-150А)');
      if (Amp >= 110) and (Amp <= 180) then
        mAdd2.Lines.Add('2.4 мм (110-180А)');
      if (Amp >= 150) and (Amp <= 220) then
        mAdd2.Lines.Add('3.0 мм (150-220А)');
      if (Amp >= 180) and (Amp <= 270) then
        mAdd2.Lines.Add('3.2 мм (180-270А)');
      if (Amp >= 200) and (Amp <= 350) then
        mAdd2.Lines.Add('4.0 мм (200-350А)');
      if (Amp > 350) then
        mAdd2.Lines.Add('Нет данных!');
    End;

    if BrandElectrode.Selected.Text = 'Алюминий' then
    Begin
      // if (Amp >= 10) and (Amp <= 60) then
      // Memo1.Lines.Add('1.0 мм');
      if (Amp >= 60) and (Amp <= 120) then
        mAdd2.Lines.Add('1.6 мм (60-120А)');
      if (Amp >= 70) and (Amp <= 130) then
        mAdd2.Lines.Add('2.0 мм (70-130А)');
      if (Amp >= 100) and (Amp <= 180) then
        mAdd2.Lines.Add('2.4 мм (100-180А)');
      if (Amp >= 130) and (Amp <= 200) then
        mAdd2.Lines.Add('3.0 мм (130-200А)');
      if (Amp >= 160) and (Amp <= 250) then
        mAdd2.Lines.Add('3.2 мм (160-250А)');
      if (Amp >= 180) and (Amp <= 330) then
        mAdd2.Lines.Add('4.0 мм (180-330А)');
      if (Amp > 330) then
        mAdd2.Lines.Add('Нет данных!');
    End;
  End
  else
    mAdd.Lines.Add('Не выбран свариваемый материал!');

  mAdd2.Lines.Add('Выходной диаметр сопла:');
  if (Amp >= 10) and (Amp <= 179) then
    mAdd2.Lines.Add('6,4-9,5 мм');
  if (Amp >= 180) and (Amp <= 350) then
    mAdd2.Lines.Add('9,5-12,0 мм');

  mAdd2.Lines.Add('Расход аргона:');
  // Memo1.Lines.Add(FloatToStr((Amp / 400) * 100));
  // Memo1.Lines.Add(FloatToStr(Abs(Amp - 100)));
  if (Amp >= 10) and (Amp <= 59) then
    mAdd2.Lines.Add('6-8 л/мин.');
  if (Amp >= 60) and (Amp <= 99) then
    mAdd2.Lines.Add('8-10 л/мин.');
  if (Amp >= 100) and (Amp <= 149) then
    mAdd2.Lines.Add('10-14 л/мин.');
  if (Amp >= 150) and (Amp <= 199) then
    mAdd2.Lines.Add('13-15 л/мин.');
  if (Amp >= 200) and (Amp <= 259) then
    mAdd2.Lines.Add('15-18 л/мин.');
  if (Amp >= 260) and (Amp <= 299) then
    mAdd2.Lines.Add('18-20 л/мин.');
  if (Amp >= 300) and (Amp <= 460) then
    mAdd2.Lines.Add('20-25 л/мин.');

  // Останавливаем таймер и получаем прошедшее время
  // Stopwatch.Stop;
  // mLogAdd('StopwatchFronius2 ' + Stopwatch.ElapsedMilliseconds.ToString+' миллисекунды', 2);

  mLog.EndUpdate;
  mAdd2.EndUpdate;
  Run := False;

  { Для расчета тепловложения при аргонодуговой наплавке также можно использовать формулу:
    Q=U*I*t*K
    где:
    Q - тепловложение (Дж),
    U - напряжение дуги (В),
    I - сила тока сварочного тока (А),
    t - время сварки (с),
    K - коэффициент полезного действия (обычно примерно 0.8).
    Аргонодуговая наплавка характеризуется более низкими температурами и более
    равномерным распределением тепла, чем у обычной сварки. Однако точные значения
    параметров могут зависеть от конкретных условий и материалов.

    Тепловая мощность источника тепла P может быть вычислена как произведение напряжения дуги U на силу тока I. То есть:
    P=U*I
    где:
    P - тепловая мощность источника тепла (Вт),
    U - напряжение дуги (В),
    I - сила тока сварочного тока (А).

    Для расчета времени нагрева детали при наплавке можно использовать следующий подход:
    t= Q/P
    где:
    t - время нагрева (с),
    Q - количество теплоты, необходимое для нагрева (Дж),
    P - тепловая мощность источника тепла (Вт).
    Для точного расчета необходимо знать теплоемкость материала и его плотность.
    Также учтите, что тепловые потери за счет теплопроводности и конвекции могут
    существенно влиять на время нагрева, особенно для материалов с высокой теплопроводностью, таких как металлы.

    формула для времени нагрева примет вид:
    t=(m*C*ΔT)/P
    где:
    t - время нагрева (с),
    m - масса материала (кг),
    C - удельная теплоемкость материала (Дж/кг·°C),
    ΔT - изменение температуры (°C),
    P - тепловая мощность источника тепла (Вт).
    Масса материала m может быть вычислена как произведение его плотности ρ на объем V нагреваемой детали:
    m=ρ⋅V

    // Функция для расчета времени нагрева
    function CalculateHeatingTime(U, I, t, C, rho, deltaT: Double): Double;
    var
    P, m, Q: Double;
    begin
    // Вычисляем тепловую мощность источника тепла
    P := U * I;
    // Вычисляем массу материала
    m := rho * V; // Здесь V - объем детали, который нужно передать в функцию
    // Вычисляем количество теплоты
    Q := m * C * deltaT;
    // Вычисляем время нагрева
    Result := Q / P;
    end;
  }
End;

procedure TfATFronius.AddComment2Click(Sender: TObject);
Var
  FFileName: String;
begin
  TabControl.Enabled := False;
  PanelComment.Visible := True;
  BlurEffect.Enabled := True;
  PanelComment.Width := 396;
  PanelComment.Position.Y := TabFronius1.Height + TitleStatus1.Height;
  PanelComment.Height := 300;
  Comment.Lines.Clear;

  if (SaveWeldSettings2.ItemIndex > -1) then
  Begin
    if FileExists(FDirPath + SaveWeldSettings2.Items
      [SaveWeldSettings2.ItemIndex] + '.fr2') then
    begin
      FFileName := FDirPath + SaveWeldSettings2.Items
        [SaveWeldSettings2.ItemIndex] + '.fr2';
      Comment.Text := TNetEncoding.Base64.Decode(GetValueFromJSONFile(FFileName,
        'Comment'));
    end;
  End;
end;

procedure TfATFronius.AddCommentClick(Sender: TObject);
Var
  FFileName: String;
begin
  TabControl.Enabled := False;
  PanelComment.Visible := True;
  BlurEffect.Enabled := True;
  PanelComment.Width := 396;
  PanelComment.Position.Y := TabFronius1.Height + TitleStatus1.Height;
  PanelComment.Height := 300;
  Comment.Lines.Clear;

  if (SaveWeldSettings.ItemIndex > -1) then
  Begin
    if FileExists(FDirPath + SaveWeldSettings.Items[SaveWeldSettings.ItemIndex]
      + '.fr1') then
    begin
      FFileName := FDirPath + SaveWeldSettings.Items
        [SaveWeldSettings.ItemIndex] + '.fr1';
      Comment.Text := TNetEncoding.Base64.Decode(GetValueFromJSONFile(FFileName,
        'Comment'));
    end;
  End;
end;

procedure TfATFronius.ArcLength2Click(Sender: TObject);
begin
  ArcLength2.SelectAll;
end;

procedure TfATFronius.ArcLengthClick(Sender: TObject);
begin
  ArcLength.SelectAll;
end;

procedure TfATFronius.AverageСurrent2Click(Sender: TObject);
begin
  AverageСurrent2.SelectAll;
end;

procedure TfATFronius.AverageСurrent2Enter(Sender: TObject);
begin
  // ScrollBox2.Touch.InteractiveGestures := [];
end;

procedure TfATFronius.AverageСurrent2MouseUp(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  // if EnergyCurrent2.IsChecked then
  // Begin
  // Label116.Enabled := False;
  // LinearEnergy2.Enabled := False;
  // Label117.Enabled := False;
  // AverageСurrent2.Enabled := True;
  // Label141.Enabled := True;
  // End
  // else
  // Begin
  // Label116.Enabled := True;
  // LinearEnergy2.Enabled := True;
  // Label117.Enabled := True;
  // AverageСurrent2.Enabled := False;
  // Label141.Enabled := False;
  // End;
  //
  // {$IFDEF ANDROID}
  // Diameter2.Increment := Thickness2.Value * 2;
  // {$ENDIF}
  // if (ProductAngle2.Value = 0) or (ProductAngle2.Value = 90) then
  // NewStep2.Text := '';
  //
  // if ((SpdWeld2.Value > 4) or (SpdWeld2.Value = 0)) and (Run = False) then
  // UpdateFronius2;
  //
  // ScrollBox2.Touch.InteractiveGestures := [TInteractiveGesture.Pan];
  // AverageСurrent2.ResetFocus;
end;

procedure TfATFronius.AverageСurrentClick(Sender: TObject);
begin
  AverageСurrent.SelectAll;
end;

procedure TfATFronius.AverageСurrentEnter(Sender: TObject);
begin
  // ScrollBox1.Touch.InteractiveGestures := [];
end;

procedure TfATFronius.AverageСurrentMouseUp(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  // if EnergyCurrent.IsChecked then
  // Begin
  // Label17.Enabled := False;
  // LinearEnergy.Enabled := False;
  // Label18.Enabled := False;
  // AverageСurrent.Enabled := True;
  // Label41.Enabled := True;
  // End
  // else
  // Begin
  // Label17.Enabled := True;
  // LinearEnergy.Enabled := True;
  // Label18.Enabled := True;
  // AverageСurrent.Enabled := False;
  // Label41.Enabled := False;
  // End;
  //
  // {$IFDEF ANDROID}
  // Diameter.Increment := Thickness.Value * 2;
  // {$ENDIF}
  // if (ProductAngle.Value = 0) or (ProductAngle.Value = 90) then
  // NewStep.Text := '';
  //
  // if ((SpdWeld.Value > 4) or (SpdWeld.Value = 0)) and (Run = False) then
  // UpdateFronius1;
  //
  // ScrollBox1.Touch.InteractiveGestures := [TInteractiveGesture.Pan];
  // AverageСurrent.ResetFocus;
end;

procedure TfATFronius.bCloseClick(Sender: TObject);
begin
  PanelComment.Visible := False;
  TabControl.Enabled := True;
  BlurEffect.Enabled := False;
end;

procedure TfATFronius.bDel2Click(Sender: TObject);
begin
  if TabControl.ActiveTab.Text = 'Fronius 2' then
  Begin
    if SaveWeldSettings2.ItemIndex > -1 then
    Begin

      TFile.Delete(FDirPath + SaveWeldSettings2.Items.Strings
        [SaveWeldSettings2.ItemIndex] + '.fr2');
      mLogAdd('Макрос удалён ' + SaveWeldSettings2.Items.Strings
        [SaveWeldSettings2.ItemIndex] + '.fr2', 2);
      SaveWeldSettings2.ItemIndex := -1;
    End;
  End;

  LoadWeldSettings;
end;

procedure TfATFronius.bDelClick(Sender: TObject);
begin
  if TabControl.ActiveTab.Text = 'Fronius 1' then
  Begin
    if SaveWeldSettings.ItemIndex > -1 then
    Begin
      TFile.Delete(FDirPath + SaveWeldSettings.Items.Strings
        [SaveWeldSettings.ItemIndex] + '.fr1');
      mLogAdd('Макрос удалён ' + SaveWeldSettings.Items.Strings
        [SaveWeldSettings.ItemIndex] + '.fr1', 1);
      SaveWeldSettings.ItemIndex := -1;
    End;
  End;

  LoadWeldSettings;
end;

procedure TfATFronius.bSave2Click(Sender: TObject);
begin
  BlurEffect.Enabled := True;
  TabControl.Enabled := False;
  PanelComment.Visible := True;
  PanelComment.Width := 396;
  PanelComment.Position.Y := TabFronius1.Height + TitleStatus1.Height;
  PanelComment.Height := 300;
end;

procedure TfATFronius.bSaveClick(Sender: TObject);
begin
  BlurEffect.Enabled := True;
  TabControl.Enabled := False;
  PanelComment.Visible := True;
  PanelComment.Width := 396;
  PanelComment.Position.Y := TabFronius1.Height + TitleStatus1.Height;
  PanelComment.Height := 300;
end;

procedure TfATFronius.Button1Click(Sender: TObject);
Var
  JSONObject: TJSONObject;
begin
  if TabControl.ActiveTab.Text = 'Fronius 1' then
  Begin
    JSONObject := TJSONObject.Create;
    try
      // Режимы источника тока
      JSONObject.AddPair(TJSONPair.Create('EditCurrents', EditCurrents.Text));
      // Режимы источника напряжения
      JSONObject.AddPair(TJSONPair.Create('EditVoltages', EditVoltages.Text));

      // CopyTextToClipboard(JSONObject.ToString);
      TFile.WriteAllText(FDirPath + 'SetupFronius' + '.sfr1',
        JSONObject.ToString);
    finally
      JSONObject.Free;
    end;
  End;

  if TabControl.ActiveTab.Text = 'Fronius 2' then
  Begin
    JSONObject := TJSONObject.Create;
    try
      // Режимы источника тока
      JSONObject.AddPair(TJSONPair.Create('EditCurrents', EditCurrents2.Text));
      // Режимы источника напряжения
      JSONObject.AddPair(TJSONPair.Create('EditVoltages', EditVoltages2.Text));

      // CopyTextToClipboard(JSONObject.ToString);
      TFile.WriteAllText(FDirPath + 'SetupFronius' + '.sfr2',
        JSONObject.ToString);
    finally
      JSONObject.Free;
    end;
  End;
end;

procedure TfATFronius.Button2Click(Sender: TObject);
Var
  FFileName: String;
begin
  if TabControl.ActiveTab.Text = 'Fronius 1' then
  Begin
    if FileExists(FDirPath + 'SetupFronius' + '.sfr1') then
    begin
      FFileName := FDirPath + 'SetupFronius' + '.sfr1';
      Try
        // Режимы источника тока
        EditCurrents.Text := GetValueFromJSONFile(FFileName, 'EditCurrents');
        // Режимы источника напряжения
        EditVoltages.Text := GetValueFromJSONFile(FFileName, 'EditVoltages');
      except
        on E: Exception do
          ShowMessage('Ошибка!!!' + #10 + '- Файл сохранения поврежден' + #10 +
            'или' + #10 + '- Устаревший формат' + #10 + E.Message);
      end;
      UpdateFronius1;
    End;
  End;

  if TabControl.ActiveTab.Text = 'Fronius 2' then
  Begin
    if FileExists(FDirPath + 'SetupFronius' + '.sfr2') then
    begin
      FFileName := FDirPath + 'SetupFronius' + '.sfr2';
      Try
        // Режимы источника тока
        EditCurrents2.Text := GetValueFromJSONFile(FFileName, 'EditCurrents');
        // Режимы источника напряжения
        EditVoltages2.Text := GetValueFromJSONFile(FFileName, 'EditVoltages');
      except
        on E: Exception do
          ShowMessage('Ошибка!!!' + #10 + '- Файл сохранения поврежден' + #10 +
            'или' + #10 + '- Устаревший формат' + #10 + E.Message);
      end;
      UpdateFronius2;
    End;
  End;
end;

procedure TfATFronius.PasteSimvol1Click(Sender: TObject);
begin
  Comment.Text := Comment.Text + ' Ø';
  Comment.SetFocus;
  Comment.SelStart := Comment.Text.Length;
end;

procedure TfATFronius.PasteSimvol2Click(Sender: TObject);
begin
  Comment.Text := Comment.Text + ' ℓ';
  Comment.SetFocus;
  Comment.SelStart := Comment.Text.Length;
end;

procedure TfATFronius.D1Click(Sender: TObject);
begin
  D1.SelectAll;
end;

procedure TfATFronius.D2Click(Sender: TObject);
begin
  D2.SelectAll;
end;

procedure TfATFronius.ProductAngle2Change(Sender: TObject);
begin
  if EnergyCurrent2.IsChecked then
  Begin
    Label116.Enabled := False;
    LinearEnergy2.Enabled := False;
    Label117.Enabled := False;
    AverageСurrent2.Enabled := True;
    Label141.Enabled := True;
  End
  else
  Begin
    Label116.Enabled := True;
    LinearEnergy2.Enabled := True;
    Label117.Enabled := True;
    AverageСurrent2.Enabled := False;
    Label141.Enabled := False;
  End;

{$IF defined(ANDROID)}
  Diameter2.Increment := Thickness2.Value * 2;
{$ENDIF}
  if (ProductAngle2.Value = 0) or (ProductAngle2.Value = 90) then
    NewStep2.Text := '';

  if ((SpdWeld2.Value > 4) or (SpdWeld2.Value = 0)) and (Run = False) then
    UpdateFronius2;
end;

procedure TfATFronius.ProductAngle2Click(Sender: TObject);
begin
  ProductAngle2.SelectAll;
end;

procedure TfATFronius.ProductAngleChange(Sender: TObject);
begin
  if EnergyCurrent.IsChecked then
  Begin
    Label17.Enabled := False;
    LinearEnergy.Enabled := False;
    Label18.Enabled := False;
    AverageСurrent.Enabled := True;
    Label41.Enabled := True;
  End
  else
  Begin
    Label17.Enabled := True;
    LinearEnergy.Enabled := True;
    Label18.Enabled := True;
    AverageСurrent.Enabled := False;
    Label41.Enabled := False;
  End;

{$IF defined(ANDROID)}
  Diameter.Increment := Thickness.Value * 2;
{$ENDIF}
  if (ProductAngle.Value = 0) or (ProductAngle.Value = 90) then
    NewStep.Text := '';

  if ((SpdWeld.Value > 4) or (SpdWeld.Value = 0)) and (Run = False) then
    UpdateFronius1;
end;

procedure TfATFronius.ProductAngleClick(Sender: TObject);
begin
  ProductAngle.SelectAll;
end;

procedure TfATFronius.DeltaCurrent2Click(Sender: TObject);
begin
  DeltaCurrent2.SelectAll;
end;

procedure TfATFronius.DeltaCurrentClick(Sender: TObject);
begin
  DeltaCurrent.SelectAll;
end;

procedure TfATFronius.DeltaWireClick(Sender: TObject);
begin
  DeltaWire.SelectAll;
end;

procedure TfATFronius.DeltaWireHeatingClick(Sender: TObject);
begin
  DeltaWireHeating.SelectAll;
end;

end.
