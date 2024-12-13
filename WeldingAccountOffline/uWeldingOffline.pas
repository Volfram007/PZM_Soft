unit uWeldingOffline;

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
{$IF Defined(MSWINDOWS)}
  Winapi.Windows, Winapi.ShellAPI,
{$ELSEIF Defined(ANDROID)}
  Androidapi.JNI.GraphicsContentViewText, Androidapi.Helpers,
  FMX.VirtualKeyboard,
{$ELSEIF Defined(IOS)} // and NOT defined(CPUARM)
  // FMX.Helpers.iOS, iOSapi.Foundation,
{$ENDIF} System.Types, System.Math, FireDAC.Phys.SQLite,
  System.RegularExpressions, FMX.Memo.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, FMX.Types, FMX.Gestures,
  FMX.Controls, FMX.ListBox, FMX.StdCtrls, FMX.Calendar, FMX.TreeView, FMX.Edit,
  FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.Layouts,
  FMX.TabControl, System.UITypes, System.IOUtils, System.SysUtils,
  System.Classes, FMX.Forms, FMX.Dialogs, FMX.Platform, System.Rtti,
  FMX.Calendar.Helpers, DateUtils, FireDAC.Phys.SQLiteWrapper;

{$REGION '$Уменьшение размера EXE'}
// {$WARNINGS OFF} // Отключает предупреждения компилятора.
// {$DEBUGINFO OFF}   // Отключает информацию об отладке в исполняемом файле.
// {$WEAKLINKRTTI ON}  // Включает слабое связывание RTTI (Runtime Type Information).
// {$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])} // Отключает RTTI для методов, свойств и полей.
// Устанавливает различные флаги для исполняемого файла Portable Executable (PE)
// {$SetPEFlags IMAGE_FILE_32BIT_MACHINE } {$SetPEOptFlags IMAGE_FILE_32BIT_MACHINE }//Указывает, что файл предназначен для 32-битной архитектуры.
// {$SetPEFlags IMAGE_FILE_UP_SYSTEM_ONLY } {$SetPEOptFlags IMAGE_FILE_UP_SYSTEM_ONLY }//Указывает, что файл предназначен только для однопроцессорных систем.
// {$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED } {$SetPEOptFlags IMAGE_FILE_RELOCS_STRIPPED }//Указывает, что таблица перемещения была отсечена от файла.
// {$SetPEFlags IMAGE_FILE_EXECUTABLE_IMAGE } {$SetPEOptFlags IMAGE_FILE_EXECUTABLE_IMAGE }//Указывает, что файл является исполняемым образом.
// {$SetPEFlags IMAGE_FILE_LINE_NUMS_STRIPPED } {$SetPEOptFlags IMAGE_FILE_LINE_NUMS_STRIPPED }// Указывает, что номера строк были удалены из файла.
// {$SetPEFlags IMAGE_FILE_LOCAL_SYMS_STRIPPED } {$SetPEOptFlags IMAGE_FILE_LOCAL_SYMS_STRIPPED }//Указывает, что локальные символы были удалены из файла.
// {$SetPEFlags IMAGE_FILE_AGGRESIVE_WS_TRIM } {$SetPEOptFlags IMAGE_FILE_AGGRESIVE_WS_TRIM }//Указывает, что файл был оптимизирован для уменьшения использования рабочей памяти.
// {$SetPEFlags IMAGE_FILE_LARGE_ADDRESS_AWARE } {$SetPEOptFlags IMAGE_FILE_LARGE_ADDRESS_AWARE }//Указывает, что приложение может обрабатывать адреса памяти больше 2 ГБ.
// {$SetPEFlags IMAGE_FILE_BYTES_REVERSED_LO } {$SetPEOptFlags IMAGE_FILE_BYTES_REVERSED_LO }//Указывают на порядок байтов в файле.
// {$SetPEFlags IMAGE_FILE_BYTES_REVERSED_HI } {$SetPEOptFlags IMAGE_FILE_BYTES_REVERSED_HI }//Указывают на порядок байтов в файле.
// {$SetPEFlags IMAGE_FILE_DEBUG_STRIPPED } {$SetPEOptFlags IMAGE_FILE_DEBUG_STRIPPED }//Указывает, что отладочная информация была удалена из файла.
// {$SetPEFlags IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP } {$SetPEOptFlags IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP }//Указывают на возможность запуска приложения с съемного носителя.
// {$SetPEFlags IMAGE_FILE_NET_RUN_FROM_SWAP } {$SetPEOptFlags IMAGE_FILE_NET_RUN_FROM_SWAP }//Указывают на возможность запуска приложения через сеть.
// {$SetPEFlags IMAGE_FILE_SYSTEM } {$SetPEOptFlags IMAGE_FILE_SYSTEM }//Указывает, что файл является системным.
// {$SetPEFlags IMAGE_FILE_DLL } {$SetPEOptFlags IMAGE_FILE_DLL }//Указывает, что файл является динамической библиотекой.
// Устанавливает целевую архитектуру исполняемого файла.
// {$SetPEFlags IMAGE_FILE_MACHINE_UNKNOWN } {$SetPEOptFlags IMAGE_FILE_MACHINE_UNKNOWN }//Неизвестная машина.
// {$SetPEFlags IMAGE_FILE_MACHINE_MIPS16 } {$SetPEOptFlags IMAGE_FILE_MACHINE_MIPS16 }//MIPS16 (16-бит).
// {$SetPEFlags IMAGE_FILE_MACHINE_MIPSFPU16 } {$SetPEOptFlags IMAGE_FILE_MACHINE_MIPSFPU16 }//MIPS16 с плавающей запятой (16-бит).
// {$SetPEFlags IMAGE_FILE_MACHINE_MIPSFPU } {$SetPEOptFlags IMAGE_FILE_MACHINE_MIPSFPU }//MIPS с плавающей запятой (32-бит).
// {$SetPEFlags IMAGE_FILE_MACHINE_R3000 } {$SetPEOptFlags IMAGE_FILE_MACHINE_R3000 }//MIPS R3000 (32-бит).
// {$SetPEFlags IMAGE_FILE_MACHINE_R4000 } {$SetPEOptFlags IMAGE_FILE_MACHINE_R4000 }//MIPS R4000 (32-бит).
// {$SetPEFlags IMAGE_FILE_MACHINE_R10000 } {$SetPEOptFlags IMAGE_FILE_MACHINE_R10000 }//MIPS R10000 (64-бит).
// {$SetPEFlags IMAGE_FILE_MACHINE_ALPHA } {$SetPEOptFlags IMAGE_FILE_MACHINE_ALPHA }//DEC Alpha (64-бит).
// {$SetPEFlags IMAGE_FILE_MACHINE_POWERPC } {$SetPEOptFlags IMAGE_FILE_MACHINE_POWERPC }//PowerPC (32-бит).
// {$SetPEFlags IMAGE_FILE_MACHINE_SH3 } {$SetPEOptFlags IMAGE_FILE_MACHINE_SH3 }//Hitachi SH3 (32-бит).
// {$SetPEFlags IMAGE_FILE_MACHINE_SH4 } {$SetPEOptFlags IMAGE_FILE_MACHINE_SH4 }//Hitachi SH4 (32-бит).
// {$SetPEFlags IMAGE_FILE_MACHINE_THUMB } {$SetPEOptFlags IMAGE_FILE_MACHINE_THUMB }//Thumb (32-бит).
// {$SetPEFlags IMAGE_FILE_MACHINE_M32R } {$SetPEOptFlags IMAGE_FILE_MACHINE_M32R }//Mitsubishi M32R (32-бит).

// ANDROID
{$IF Defined(ANDROID)}
{$IF Defined(CPUARM)}
// {$SETPEFLAGS IMAGE_FILE_MACHINE_ARM } {$SETPEOPTFLAGS IMAGE_FILE_MACHINE_ARM }// ARM (32-бит)
{$ENDIF}
{$IF Defined(CPUARM64)}
// {$SETPEFLAGS IMAGE_FILE_MACHINE_ARM64 } {$SETPEOPTFLAGS IMAGE_FILE_MACHINE_ARM64 }// ARM64 (64-бит).
{$ENDIF}
{$ENDIF}
// WINDOWS
{$IF Defined(MSWINDOWS)}
{$IF Defined(WIN32)}
// {$SETPEFLAGS IMAGE_FILE_MACHINE_I386 } {$SETPEOPTFLAGS IMAGE_FILE_MACHINE_I386 }// x86 (32-бит).
{$ENDIF}
{$IF Defined(WIN64)}
// {$SetPEFlags IMAGE_FILE_MACHINE_AMD64 } {$SetPEOptFlags IMAGE_FILE_MACHINE_AMD64 }//x64 (64-бит).
// {$SetPEFlags IMAGE_FILE_MACHINE_IA64 } {$SetPEOptFlags IMAGE_FILE_MACHINE_IA64 }//x64 (64-бит).
{$ENDIF}
{$ENDIF}
{$ENDREGION}

type
  TfWeldingOffline = class(TForm)
    GestureManager1: TGestureManager;
    FDConnection: TFDConnection;
    FDQuery: TFDQuery;
    FDTable: TFDTable;
    StyleBook1: TStyleBook;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    VertScrollBox: TVertScrollBox;
    Layout: TLayout;
    TabControl1: TTabControl;
    TabWork: TTabItem;
    Layout2: TLayout;
    ScrollBox1: TScrollBox;
    BtnGenerate: TButton;
    Button1: TButton;
    Button2: TButton;
    GetComment: TButton;
    CalloutPanel1: TCalloutPanel;
    Comment: TMemo;
    Label5: TLabel;
    Info: TMemo;
    PasteScharp: TButton;
    ProductNumber: TEdit;
    labProductNumber: TLabel;
    LetterOfCladding: TEdit;
    labProductSeam: TLabel;
    Save: TButton;
    TransitionLayer: TCheckBox;
    WeldingType: TComboBox;
    UpdateComm: TButton;
    CladdingNumber: TEdit;
    labWeldingNumber: TLabel;
    ToolBar3: TToolBar;
    StatusWork: TLabel;
    TabSearch: TTabItem;
    pnl1: TPanel;
    TreeExpandAll: TButton;
    CollapseAll: TButton;
    FindIndb: TButton;
    CopyReport: TButton;
    DeleteSelected: TButton;
    ProgressBar: TProgressBar;
    VisiblePanel: TButton;
    VisibleCalendar: TButton;
    tFindFiltr: TTabControl;
    TabFind: TTabItem;
    labFindProduct: TLabel;
    FindProduct: TEdit;
    FindAllBase: TEdit;
    Label2: TLabel;
    TabFindSettings: TTabItem;
    ShowDate: TCheckBox;
    DateSearch: TCheckBox;
    ToolBar4: TToolBar;
    StatusSearch: TLabel;
    TreeView: TTreeView;
    AniIndicator: TAniIndicator;
    Calendar1: TCalendar;
    TabAbout: TTabItem;
    mAbout: TMemo;
    ToolBar5: TToolBar;
    lblTitle5: TLabel;
    LinkUpgrade: TSpeedButton;
    TabSettings: TTabItem;
    Status: TLabel;
    AddCommCopBuff: TCheckBox;
    ScrollBox2: TScrollBox;
    AutoSelectAll: TCheckBox;
    ActLog: TCheckBox;
    GroupBox1: TGroupBox;
    ShiftSchedule: TRadioButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    chProductNumber: TCheckBox;
    chLetterOfCladding: TCheckBox;
    chCladdingNumber: TCheckBox;
    chWeldingType: TCheckBox;
    ListWeldingTypes: TListBox;
    mLog: TMemo;
    Splitter1: TSplitter;
    Procedure mLogAdd(const S: String);
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure PasteScharpClick(Sender: TObject);
    procedure ProductNumberClick(Sender: TObject);
    procedure LetterOfCladdingClick(Sender: TObject);
    procedure CladdingNumberClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CommentDblClick(Sender: TObject);
    procedure TreeExpandAllClick(Sender: TObject);
    procedure CollapseAllClick(Sender: TObject);
    procedure VisiblePanelClick(Sender: TObject);
    procedure BtnGenerateClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure FindIndbClick(Sender: TObject);
    procedure WeldingTypeChange(Sender: TObject);
    procedure TreeViewClick(Sender: TObject);
    procedure FindProductClick(Sender: TObject);
    procedure UpdateCommClick(Sender: TObject);
    procedure FormSaveState(Sender: TObject);
    procedure ProductNumberKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure GetCommentClick(Sender: TObject);
    procedure LinkUpgradeClick(Sender: TObject);
    procedure FindProductKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure FindAllBaseKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure CopyReportClick(Sender: TObject);
    procedure VisibleCalendarClick(Sender: TObject);
    procedure Calendar1DateSelected(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure DeleteSelectedClick(Sender: TObject);
    procedure Calendar1Change(Sender: TObject);
    procedure ProductNumberChange(Sender: TObject);
    procedure ProductNumberKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ShowDateChange(Sender: TObject);
    procedure FormFocusChanged(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure ListWeldingTypesChangeCheck(Sender: TObject);
    procedure ListWeldingTypesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ListWeldingTypesItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private

{$IF Defined(ANDROID)}
    // Поднятие компонента при появлении клавиатуры
    FService1: IFMXVirtualKeyboardToolbarService;
    FKBBounds: TRectF;
    FNeedOffset: Boolean;
    procedure CalcContentBoundsProc(Sender: TObject; var ContentBounds: TRectF);
    procedure RestorePosition;
    procedure UpdateKBBounds;
{$ENDIF}

  Const
    WeldersWorkDB = 'WeldersWork.db';
    // procedure UpdateComment(const ProductNumber, WeldingType, LetterOfCladding,      CladdingNumber, CladdingLayer, NewComment: string);
    function FindOrCreateNode(Parent: TFmxObject; const Text: string)
      : TTreeViewItem;
    procedure AddRowNumberColumn;
    procedure UpdateComment(const SelectID: Integer; NewComment: string);
    procedure FindRecordRow(const RowNumber: string);
    procedure CreateSQLiteDB;
    procedure IterateTreeViewNodes(ANode: TTreeViewItem; var AResult: string;
      var PrevChildNodes: TArray<string>);
    procedure DeleteSelectedRowFromDB(TreeView: TTreeView);
    function RegExReplace(Text: String): String;
    procedure CreateFunc_RuLower;
    procedure ru_lower(AFunc: TSQLiteFunctionInstance; AInputs: TSQLiteInputs;
      AOutput: TSQLiteOutput; var AUserData: TObject);

  Var
    FDirPath: String; // Путь к директории с базой данных
    procedure AddRecordToSQLiteDB(const ProductNumber, WeldingType,
      LetterOfCladding, CladdingNumber, CladdingLayer, Comment: string);
    Procedure HighlightDatesOnCalendar();
    procedure FindRecordsInSQLiteDB(const ProductNumberMask: string;
      TreeView: TTreeView);
    procedure FindRecordsDateInSQLiteDB(const DateTimeMask: TDate;
      TreeView: TTreeView);
    procedure FindRecordsInAllDB(const ProductMask: string;
      TreeView: TTreeView);
    // function GetCommentText(const ProductNumber, WeldingType, LetterOfCladding,       CladdingNumber, CladdingLayer: string): string;
    function GetCommentText(const SelectID: Integer): string;
    procedure ResetRecord;
  public
    /// /
    WC1: TFDPhysSQLiteDriverLink;
    SQLiteFunction: TFDSQLiteFunction;
  end;

var
  fWeldingOffline: TfWeldingOffline;
  LoadErr: String;
  SelID: Integer;
  ReadDate: Boolean;

implementation

{$R *.fmx}

Uses System.Generics.Collections, System.StrUtils;

procedure TfWeldingOffline.ResetRecord;
Begin
  SelID := -1;
  StatusWork.Text := 'Отчет выполняемой работы';
  StatusSearch.Text := 'Поиск в базе данных';
End;

function ColumnExistsInTable(const TableName, ColumnName: string;
  Connection: TFDConnection): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Connection;
    Query.SQL.Text := 'PRAGMA table_info(' + TableName + ')';
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      if Query.FieldByName('name').AsString = ColumnName then
      begin
        Result := True;
        Exit;
      end;
      Query.Next;
    end;
    Result := False;
  finally
    Query.Free;
  end;
end;

procedure TfWeldingOffline.AddRowNumberColumn();
var // Добовляем в базу таблицу
  Connection: TFDConnection;
  Transaction: TFDTransaction;
  FDGUIxWaitCursor: TFDGUIxWaitCursor;
begin
  Connection := TFDConnection.Create(nil);
  Transaction := TFDTransaction.Create(nil);
  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(nil);
  try
    Connection.DriverName := 'SQLite';
    Connection.Params.Values['Database'] := FDirPath + WeldersWorkDB;
    Connection.Connected := True;
    Transaction.Connection := Connection;
    Transaction.StartTransaction;

    if not ColumnExistsInTable('RowNumber', 'WeldersWork', Connection) then
    begin
      Connection.ExecSQL
        ('ALTER TABLE WeldersWork ADD COLUMN RowNumber INTEGER');
      Connection.ExecSQL('UPDATE WeldersWork SET RowNumber = (SELECT ' +
        'IFNULL(MAX(RowNumber), 0) + 1 ' + 'FROM WeldersWork)');
    end;

    Transaction.Commit;
  finally
    Connection.Free;
    Transaction.Free;
    FDGUIxWaitCursor.Free;
  end;
end;

// Этот код выделяет даты из базы данных SQLite на календаре TCalendar.
// Поиск выполняется в пределах NUM_MONTHS месяцев, заданных в константе.
// Объекты Connection и Query используются для подключения к базе данных и выполнения запросов.
// Результат запроса сохраняется в массиве Dates, а затем передается в качестве источника данных для календаря.
procedure TfWeldingOffline.HighlightDatesOnCalendar();
const
  SEARCH_WINDOW_DAYS = 30;
  // Окно поиска в днях с обеих сторон от выбранной даты
  DB_NOT_FOUND_MESSAGE = 'БД не найдена!';
  NIGHT_SHIFT_START = '19:30:00';
  NIGHT_SHIFT_END = '07:30:00';

var
  Connection: TFDConnection;
  // Объект для установления соединения с базой данных
  Query: TFDQuery; // Объект для выполнения SQL-запросов
  Dates: TArray<TDateTime>; // Массив для хранения дат
  i: Integer; // Счетчик цикла
  StartDate, EndDate: TDateTime; // Начальная и конечная даты для поиска

begin
  // Проверяем, есть ли уже файл "WeldersWork.db"
  if not FileExists(FDirPath + WeldersWorkDB) then
  begin
    ShowMessage(DB_NOT_FOUND_MESSAGE + #10 + FDirPath + WeldersWorkDB);
    Exit;
  end;

  Connection := TFDConnection.Create(nil);
  Query := TFDQuery.Create(nil);
  try
    // Настройка соединения с базой данных
    Connection.DriverName := 'SQLite';
    Connection.Params.Values['Database'] := FDirPath + WeldersWorkDB;
    Connection.Open;
    Query.Connection := Connection;

    // Определение начальной и конечной даты для поиска
    StartDate := Calendar1.Date - SEARCH_WINDOW_DAYS;
    EndDate := Calendar1.Date + SEARCH_WINDOW_DAYS;

    // Формирование SQL-запроса с DISTINCT для удаления повторяющихся дат
    { Query.SQL.Text :=
      'SELECT DISTINCT date(DateTime) as DateOnly FROM WeldersWork WHERE date(DateTime) BETWEEN date(:StartDate) AND date(:EndDate)';
      Query.ParamByName('StartDate').AsDateTime := StartDate;
      Query.ParamByName('EndDate').AsDateTime := EndDate;
      Query.Open; // }

    // Заполнение массива дат
    { SetLength(Dates, Query.RecordCount);
      i := 0;
      while not Query.Eof do
      begin
      Dates[i] := ISO8601ToDate(Query.FieldByName('DateOnly').AsString);
      Query.Next;
      Inc(i);
      end;  // }

    // Измененный запрос для коррекции по диапазону времени ночной смены
    Query.SQL.Text := 'SELECT DateTime FROM WeldersWork WHERE ' +
      '(DateTime BETWEEN :StartDate AND :EndDate) AND ' +
      '(time(DateTime) < :NightShiftStart OR time(DateTime) > :NightShiftEnd)';
    Query.ParamByName('StartDate').AsDateTime := StartDate;
    Query.ParamByName('EndDate').AsDateTime := EndDate;
    Query.ParamByName('NightShiftStart').AsString := NIGHT_SHIFT_START;
    Query.ParamByName('NightShiftEnd').AsString := NIGHT_SHIFT_END;
    Query.Open;

    // Обработка результатов запроса
    SetLength(Dates, 0);
    while not Query.Eof do
    begin
      var
        FullDateTime: TDateTime := Query.FieldByName('DateTime').AsDateTime;
      var
        DateOnly: TDate := Trunc(FullDateTime); // Извлекаем только дату
      var
        TimeOnly: TTime := Frac(FullDateTime); // Извлекаем только время

        // Проверка, попадает ли запись в диапазон ночной смены
      if (TimeOnly >= StrToTime(NIGHT_SHIFT_START)) or
        (TimeOnly <= StrToTime(NIGHT_SHIFT_END)) then
      begin
        // Обработка логики ночной смены
        if TimeOnly >= StrToTime(NIGHT_SHIFT_START) then
        begin
          // Если время после 19:00
          // Проверяем, не была ли эта дата уже добавлена в массив
          if (Length(Dates) = 0) or (Dates[High(Dates)] <> DateOnly) then
          begin
            SetLength(Dates, Length(Dates) + 1);
            Dates[High(Dates)] := DateOnly;
          end;
        end
        else if TimeOnly <= StrToTime(NIGHT_SHIFT_END) then
        begin
          // Если время попадает в диапазон ночной смены
          var
            ShiftDate: TDate := DateOnly;
            // Если время до 8:00, добавляем следующий день, так как это конец ночной смены
          ShiftDate := DateOnly - 1;
          if (Length(Dates) = 0) or (Dates[High(Dates)] <> ShiftDate) then
          begin
            SetLength(Dates, Length(Dates) + 1);
            Dates[High(Dates)] := ShiftDate;
          end; // }
        end;
      end
      else // Добавляем дату в массив, если она не попадает в диапазон следующей ночной смены
      begin
        // Проверяем, не была ли эта дата уже добавлена в массив
        if (Length(Dates) = 0) or (Dates[High(Dates)] <> DateOnly) then
        begin
          SetLength(Dates, Length(Dates) + 1);
          Dates[High(Dates)] := DateOnly;
        end;
      end;

      // Проверка, попадает ли запись в диапазон ночной смены следующего дня
      { var
        CurrentDate: TDateTime := ISO8601ToDate(Query.FieldByName('DateOnly')
        .AsString);
        var
        NextDayShiftStart: TDateTime := CurrentDate + 1 +
        EncodeTime(8, 0, 0, 0);
        if (CurrentDate < NextDayShiftStart) then
        begin
        // Добавляем дату в массив, если она не попадает в диапазон следующей ночной смены
        SetLength(Dates, Length(Dates) + 1);
        Dates[High(Dates)] := CurrentDate;
        end;     // }
      Query.Next;
    end;

    // Подсвечиваем даты на календаре
    Calendar1.Model.Data['Events'] := TValue.From < TArray < TDateTime
      >> (Dates);

  finally
    // Освобождаем ресурсы
    Query.Free;
    Connection.Free;
  end;
end;

{
  Код проверяет существование файла базы данных, и если файл не существует,
  создает новую базу данных SQLite и таблицу WeldersWork с определеннойструктурой
  Таблица "WeldersWork" имеет следующие поля:

  RowNumber: целочисленное значение (INTEGER)
  ProductNumber: строка длиной до 17 символов (varchar(17))
  WeldingType: строка длиной до 30 символов (varchar(30))
  LetterOfCladding: строка длиной 2 символ (varchar(2))
  CladdingNumber: строка длиной до 2 символов (varchar(3))
  CladdingLayer: строка длиной до 10 символов (varchar(10))
  DateTime: метка времени с автоматическим значением по умолчанию, равным текущему
  времени (TIMESTAMP DEFAULT (datetime(CURRENT_TIMESTAMP, 'localtime')))
  Comment: строка длиной до 255 символов (varchar(255)) }
procedure TfWeldingOffline.CreateSQLiteDB();
var
  Connection: TFDConnection;
  Transaction: TFDTransaction;
  DBFilePath: string; // Путь к файлу базы данных
begin
  // Формирование пути к файлу базы данных
  DBFilePath := FDirPath + WeldersWorkDB;
  // Проверяем существование файла базы данных перед его созданием
  if FileExists(DBFilePath) then
  Begin
    mLogAdd('БД найдена');
    Exit;
  End;

  mLogAdd('Создание БД');

  // Создаем объекты подключения и транзакции
  Connection := TFDConnection.Create(nil);
  Transaction := TFDTransaction.Create(nil);

  try
    // Настройка подключения к базе данных
    Connection.DriverName := 'SQLite';
    Connection.Params.Values['Database'] := DBFilePath;
    Connection.Connected := True;

    // Настройка и запуск транзакции
    Transaction.Connection := Connection;
    Transaction.StartTransaction;

    try
      // Выполнение SQL-запроса для создания таблицы
      Connection.ExecSQL('CREATE TABLE IF NOT EXISTS WeldersWork (' +
        // Добавлен первичный ключ и AUTOINCREMENT
        'RowNumber INTEGER PRIMARY KEY AUTOINCREMENT,' +
        'ProductNumber varchar(17), ' + 'WeldingType varchar(30), ' +
        'LetterOfCladding varchar(2), ' + 'CladdingNumber varchar(3), ' +
        'CladdingLayer varchar(10), ' +
        'DateTime TIMESTAMP DEFAULT (datetime(CURRENT_TIMESTAMP, ''localtime'')), '
        + 'Comment varchar(255))');

      // Фиксация транзакции
      Transaction.Commit;
    except
      on E: Exception do
      begin
        // Откат транзакции в случае ошибки
        Transaction.Rollback;
        // Логирование ошибки
        mLogAdd('Ошибка создания БД: ' + E.Message);
        // Проброс исключения дальше
        raise;
      end;
    end;

  finally
    // Освобождение ресурсов
    Connection.Free;
    Transaction.Free;
  end;
end;

procedure TfWeldingOffline.DeleteClick(Sender: TObject);
begin

end;

// Процедура удаляет выбранную строку из базы данных SQLite и обновляет дерево просмотра.
procedure TfWeldingOffline.DeleteSelectedRowFromDB(TreeView: TTreeView);
var
  Connection: TFDConnection; // Объект подключения к базе данных
  Query: TFDQuery; // Объект для выполнения SQL-запросов
  SelectedItem: TTreeViewItem; // Выбранный элемент дерева
  RowNumber: Integer; // Номер строки для удаления
begin
  // Получение выбранного элемента
  SelectedItem := TreeView.Selected;

  // Проверка, что выбран узел
  if SelectedItem = nil then
  begin
    ShowMessage('Пожалуйста, выберите узел для удаления.');
    ProgressBar.Visible := False;
    AniIndicator.Visible := False;
    AniIndicator.Enabled := False;
    Exit;
  end;

  // Убедитесь, что выбранный узел является листовым узлом (нет дочерних узлов)
  if SelectedItem.Count = 0 then
  begin
    // Получение номера строки из свойства TagString выбранного элемента
    RowNumber := SelectedItem.TagString.ToInteger;
  end
  else
  begin
    ShowMessage('Выбран не верный узел');
    Exit;
  end;

  // Диалоговое окно с подтверждением удаления
  MessageDlg(Format('Запись будет удалена, id: %d', [RowNumber]),
    TMsgDlgType.mtInformation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0,
    procedure(const AResult: TModalResult)
    begin
      if AResult = mrYES then
      begin
        // Создание объектов для соединения с базой данных и выполнения запросов
        Connection := TFDConnection.Create(nil);
        Query := TFDQuery.Create(nil);
        try
          // Настройка подключения к базе данных
          Connection.DriverName := 'SQLite';
          Connection.Params.Values['Database'] := FDirPath + WeldersWorkDB;
          Connection.Connected := True;
          Query.Connection := Connection;

          // Удаление записи с указанным RowNumber из таблицы WeldersWork
          Query.SQL.Text :=
            'DELETE FROM WeldersWork WHERE RowNumber = :RowNumber';
          Query.ParamByName('RowNumber').AsInteger := RowNumber;
          Query.ExecSQL;

          // Обновление id для оставшихся записей
          Query.SQL.Text :=
            'UPDATE WeldersWork SET RowNumber = RowNumber - 1 WHERE RowNumber > :RowNumber';
          Query.ParamByName('RowNumber').AsInteger := RowNumber;
          Query.ExecSQL;

        finally
          // Освобождение ресурсов
          Query.Free;
          Connection.Free;
        end;

        // Скрытие индикаторов прогресса
        ProgressBar.Visible := False;
        AniIndicator.Visible := False;
        AniIndicator.Enabled := False;
      end;
    end);
end;

procedure TfWeldingOffline.DeleteSelectedClick(Sender: TObject);
begin
  // Включаем анимацию
  AniIndicator.Visible := True;
  AniIndicator.Enabled := True;
  DeleteSelectedRowFromDB(TreeView);
  if (FindProduct.Text = '') and (FindAllBase.Text = '') then
    Calendar1DateSelected(nil)
  else
    FindIndb.OnClick(nil);
  TreeExpandAll.OnClick(nil);
  TreeView.Selected := nil;
end;

{
  Процедура ищет записи в базе данных SQLite по маске номера продукта и отображает
  результаты в дереве просмотра.
}
procedure TfWeldingOffline.FindRecordsInSQLiteDB(const ProductNumberMask
  : string; TreeView: TTreeView);
var
  i, j: Integer; // Переменные для циклов
  Connection: TFDConnection; // Переменная для соединения с базой данных
  Query: TFDQuery; // Переменная для выполнения запросов
  // Переменные для узлов дерева
  ParentNode, ChildNode1, ChildNode2: TTreeViewItem;
  // Переменные для проверки существования узлов
  ParentNodeExists, ChildNode1Exists: Boolean;
begin
  // Создаем объект для соединения с базой данных
  Connection := TFDConnection.Create(nil);
  // Создаем объект для выполнения запросов
  Query := TFDQuery.Create(nil);
  try
    // Устанавливаем драйвер SQLite
    Connection.DriverName := 'SQLite';
    // Указываем имя файла базы данных
    Connection.Params.Values['Database'] := FDirPath + WeldersWorkDB;
    // Открываем соединение с базой данных
    Connection.Connected := True;
    // Устанавливаем соединение для запроса
    Query.Connection := Connection;

    // Устанавливаем текст запроса для поиска записей
    if ShowDate.IsChecked then
      Query.SQL.Text :=
        'SELECT RowNumber, ProductNumber, WeldingType, LetterOfCladding, CladdingNumber, CladdingLayer, DateTime, Comment '
        + 'FROM WeldersWork ' + 'WHERE ProductNumber LIKE :ProductMask ' +
      // Сортировка по столбцам. Отсортировать столбец DateTime по убыванию, а остальные столбцы по возрастанию
        'ORDER BY DateTime DESC, CladdingNumber, LetterOfCladding'
    else
      Query.SQL.Text :=
        'SELECT RowNumber, ProductNumber, WeldingType, LetterOfCladding, CladdingNumber, CladdingLayer, DateTime, Comment '
        + 'FROM WeldersWork ' + 'WHERE ProductNumber LIKE :ProductMask ' +
        'ORDER BY DateTime DESC, CladdingNumber, LetterOfCladding';
    Query.ParamByName('ProductMask').AsString := '%' + ProductNumberMask + '%';
    Query.Open; // Открываем запрос

    // Найдено строк
    Status.Text := 'Строк: ' + IntToStr(Query.RecordCount);

    TreeView.BeginUpdate; // Начинаем обновление дерева
    TreeView.Clear; // Очищаем дерево
    try
      // Устанавливаем начальное значение родительского узла
      ParentNode := nil;
      // Устанавливаем начальное значение первого дочернего узла
      ChildNode1 := nil;

      // Проходимся по всем записям, полученным из запроса
      j := 0;
      while not Query.Eof do
      begin
        ProgressBar.Value := j;
        if (j mod 100 = 0) then
          Application.ProcessMessages;

        // Устанавливаем начальное значение для проверки существования родительского узла
        ParentNodeExists := False;
        // Цикл для проверки существования родительского узла
        for i := 0 to TreeView.Count - 1 do
        begin
          ParentNode := TreeView.Items[i]; // Получаем i-ый узел
          // Если текст узла совпадает с номером продукта
          if ParentNode.Text = Query.FieldByName('ProductNumber').AsString then
          begin
            // Устанавливаем флаг, что родительский узел существует
            ParentNodeExists := True;
            break; // Выходим из цикла
          end;
        end;

        if not ParentNodeExists then // Если родительский узел не существует
        begin
          // Создаем новый узел
          ParentNode := TTreeViewItem.Create(TreeView);
          // Устанавливаем родительский узел
          ParentNode.Parent := TreeView;
          // Устанавливаем текст узла
          ParentNode.Text := Query.FieldByName('ProductNumber').AsString;
        end;

        // Устанавливаем начальное значение для проверки существования первого дочернего узла
        ChildNode1Exists := False;
        // Цикл для проверки существования первого дочернего узла
        for j := 0 to ParentNode.Count - 1 do
        begin
          ChildNode1 := ParentNode.Items[j]; // Получаем j-ый узел
          // Если текст узла совпадает с типом сварки
          if ChildNode1.Text = Query.FieldByName('WeldingType').AsString then
          begin
            // Устанавливаем флаг, что первый дочерний узел существует
            ChildNode1Exists := True;
            break; // Выходим из цикла
          end;
        end;

        // Если первый дочерний узел не существует
        if not ChildNode1Exists then
        begin
          // Создаем новый узел
          ChildNode1 := TTreeViewItem.Create(TreeView);
          // Устанавливаем родительский узел
          ChildNode1.Parent := ParentNode;
          // Устанавливаем текст узла
          ChildNode1.Text := Query.FieldByName('WeldingType').AsString;
        end;

        // Создание узла для информации о облицовке
        ChildNode2 := TTreeViewItem.Create(TreeView); // Создаем новый узел
        // Устанавливаем родительский узел
        ChildNode2.Parent := ChildNode1;

        ChildNode2.Text := Query.FieldByName('LetterOfCladding').AsString +
          Query.FieldByName('CladdingNumber').AsString + ' ' +
          Query.FieldByName('CladdingLayer').AsString;

        // Добавление даты, если выбрано
        if ShowDate.IsChecked then
          ChildNode2.Text := ChildNode2.Text + ' →' +
            FormatDateTime('dd.mm.yyyy', Query.FieldByName('DateTime')
            .AsDateTime);

        // Добавление комментария, если он есть
        if Query.FieldByName('Comment').AsString <> '' then
          ChildNode2.Text := ChildNode2.Text + ' [' +
            Query.FieldByName('Comment').AsString + ']';

        // Номер строки помещаем в скрытый атрибут
        ChildNode2.TagString :=
          (Query.FieldByName('RowNumber').AsInteger).ToString;

        // Переход к следующей записи
        Query.Next;
      end;
    finally
      // Завершение обновления и скрытие индикатора прогресса
      TreeView.EndUpdate;
    end;
  finally
    ProgressBar.Visible := False;
    AniIndicator.Visible := False;
    AniIndicator.Enabled := False;
    // Освобождение ресурсов
    Query.Free;
    Connection.Free;
  end;
end;

// Описание функции сортировки элементов
// Сортировка элементов TreeView
procedure SortTreeView(TreeView: TTreeView; ParentNode: TTreeViewItem);
var
  i, j: Integer;
  TempNode: TTreeViewItem;
begin
  // Сортировка по алфавиту
  for i := 0 to ParentNode.Count - 1 do
  begin
    for j := i + 1 to ParentNode.Count - 1 do
    begin
      if CompareText(ParentNode.Items[i].Text, ParentNode.Items[j].Text) > 0
      then
      begin
        TempNode := TTreeViewItem.Create(TreeView);
        TempNode.Assign(ParentNode.Items[i]);
        ParentNode.Items[i].Assign(ParentNode.Items[j]);
        ParentNode.Items[j].Assign(TempNode);
        TempNode.DisposeOf;
      end;
    end;
  end;
end;

procedure TfWeldingOffline.FindRecordsDateInSQLiteDB(const DateTimeMask: TDate;
TreeView: TTreeView);
const
  NIGHT_SHIFT_START = '19:30:00';
  NIGHT_SHIFT_END = '07:30:00';
var
  i, tCountRecord: Integer;
  Connection: TFDConnection;
  Query: TFDQuery;
  ParentNode, ParentChildNode, ChildNode1, ChildNode2: TTreeViewItem;
  NodeText: string;
  ShiftDateTime, CurrentDateTime: TDateTime;
begin
  tCountRecord := 0;
  Connection := TFDConnection.Create(nil);
  Query := TFDQuery.Create(nil);
  try
    Connection.DriverName := 'SQLite';
    Connection.Params.Values['Database'] := FDirPath + WeldersWorkDB;
    Connection.Connected := True;

    Query.Connection := Connection;

    // Измененный запрос для учета смен
    Query.SQL.Text :=
      'SELECT RowNumber, DateTime, ProductNumber, WeldingType, LetterOfCladding, CladdingNumber, CladdingLayer, Comment '
      + 'FROM WeldersWork WHERE Date(DateTime) BETWEEN :StartDate AND :EndDate '
      + 'ORDER BY CladdingNumber, LetterOfCladding';
    Query.ParamByName('StartDate').AsDate := DateTimeMask;
    Query.ParamByName('EndDate').AsDate := DateTimeMask + 1;
    // включаем следующий день
    Query.Open;

    // Status.Text := 'Строк: ' + IntToStr(Query.RecordCount);

    TreeView.BeginUpdate;
    TreeView.Clear;

    try
      while not Query.Eof do
      begin
        CurrentDateTime := Query.FieldByName('DateTime').AsDateTime;

        // Проверяем, попадает ли запись в диапазон ночной смены
        if (Frac(CurrentDateTime) >= StrToTime(NIGHT_SHIFT_START)) or
          (Frac(CurrentDateTime) < StrToTime(NIGHT_SHIFT_END)) then
        begin
          // Если запись попадает в диапазон ночной смены, корректируем дату
          if Frac(CurrentDateTime) >= StrToTime(NIGHT_SHIFT_START) then
          Begin
            if DateTimeMask < Trunc(CurrentDateTime) then
            Begin
              Query.Next;
              Continue;
            End
            else
            Begin
              ShiftDateTime := Int(CurrentDateTime);
            end;
          end
          else if DateTimeMask = Trunc(CurrentDateTime) then
          Begin
            Query.Next;
            Continue;
          End
          else
            ShiftDateTime := Int(CurrentDateTime) - 1;
        end
        else if DateTimeMask < Trunc(CurrentDateTime) then
        Begin
          Query.Next;
          Continue;
        End
        else
          ShiftDateTime := Int(CurrentDateTime);

        // Проверяем, существует ли уже узел для этого изделия
        ParentNode := nil;
        for i := 0 to TreeView.Count - 1 do
        begin
          if TreeView.Items[i].Text = Query.FieldByName('ProductNumber').AsString
          then
          begin
            ParentNode := TreeView.Items[i];
            break;
          end;
        end;

        if ParentNode = nil then
        begin
          // Создаем новый узел для изделия, если его еще нет
          ParentNode := TTreeViewItem.Create(TreeView);
          ParentNode.Text := Query.FieldByName('ProductNumber').AsString;
          ParentNode.Parent := TreeView;
        end;

        // Проверяем, существует ли уже под узел для этого изделия
        ParentChildNode := nil;
        for i := 0 to ParentNode.Count - 1 do
        begin
          ChildNode1 := ParentNode.Items[i];
          if ChildNode1.Text = Query.FieldByName('WeldingType').AsString then
          begin
            ParentChildNode := ParentNode.Items[i];
            break;
          end;
        end;
        // Подсчитываем колличество записей
        Inc(tCountRecord);

        if ParentChildNode = nil then
        begin
          // Создаем подузел для текущей записи
          ChildNode1 := TTreeViewItem.Create(TreeView);
          // Устанавливаем родительский узел
          ChildNode1.Parent := ParentNode;
          // Устанавливаем текст узла
          NodeText := Query.FieldByName('WeldingType').AsString;
          ChildNode1.Text := NodeText;
        end;

        // Создаем подузел для текущей записи
        ChildNode2 := TTreeViewItem.Create(TreeView);
        // Устанавливаем родительский узел
        ChildNode2.Parent := ChildNode1;

        // Формируем текст для подузла
        NodeText := Query.FieldByName('LetterOfCladding').AsString +
          Query.FieldByName('CladdingNumber').AsString + ' ' +
          Query.FieldByName('CladdingLayer').AsString;

        if ShowDate.IsChecked then
          NodeText := NodeText + ' →' + FormatDateTime('dd.mm.yyyy',
            Query.FieldByName('DateTime').AsDateTime);

        if Query.FieldByName('Comment').AsString <> '' then
          NodeText := NodeText + ' [' + Query.FieldByName('Comment')
            .AsString + ']';

        // Устанавливаем текст узла
        ChildNode2.Text := NodeText;

        // Номер строки помещаем в скрытые атрибут
        ChildNode2.TagString :=
          (Query.FieldByName('RowNumber').AsInteger).ToString;

        Query.Next;
      end;
    finally
      TreeView.EndUpdate;
    end;
  finally
    Query.Free;
    Connection.Free;
  end;

  // Сортировка элементов
  // if TreeView.Count > 0 then
  // SortTreeView(TreeView, ParentNode);
  Status.Text := 'Строк: ' + tCountRecord.ToString;
end;

{
  Процедура создает подключение к базе данных и транзакцию,
  выполняет запрос на добавление новой записи и запрос на подсчет количества записей, обновляя интерфейс
  Процедура принимает следующие параметры:

  ProductNumber: строка с номером продукта
  WeldingType: строка с типом сварки
  LetterOfCladding: строка с буквой наплавки
  CladdingNumber: строка с номером наплавки
  CladdingLayer: строка с слоем наплавки
  Comment: строка с комментарием
}
procedure TfWeldingOffline.AddRecordToSQLiteDB(const ProductNumber, WeldingType,
  LetterOfCladding, CladdingNumber, CladdingLayer, Comment: string);
var
  Connection: TFDConnection; // Объект подключения к базе данных
  Transaction: TFDTransaction; // Объект для управления транзакциями
  FDQuery: TFDQuery;
begin
  // Создание экземпляров объектов
  Connection := TFDConnection.Create(nil);
  Transaction := TFDTransaction.Create(nil);
  FDQuery := TFDQuery.Create(nil);
  try
    // Установка параметров подключения
    Connection.DriverName := 'SQLite';
    Connection.Params.Values['Database'] := FDirPath + WeldersWorkDB;
    Connection.Connected := True;

    // Начало транзакции
    Transaction.Connection := Connection;
    Transaction.StartTransaction;

    // Выполнение SQL запроса для добавления новой записи в таблицу WeldersWork
    Connection.ExecSQL('INSERT INTO WeldersWork ' +
      '(ProductNumber, WeldingType, LetterOfCladding, CladdingNumber, CladdingLayer, DateTime, Comment, RowNumber) '
      + 'VALUES (:ProductNumber, :WeldingType, :LetterOfCladding, :CladdingNumber, :CladdingLayer, CURRENT_TIMESTAMP, :Comment, '
      + '(SELECT COUNT(*) + 1 FROM WeldersWork))', [ProductNumber, WeldingType,
      LetterOfCladding, CladdingNumber, CladdingLayer, Comment]);
    // Параметризованный запрос

    // Фиксация изменений
    Transaction.Commit;

    // получить количество строк (записей) в таблице базы данных
    FDQuery.Connection := Connection;
    FDQuery.SQL.Text := 'SELECT COUNT(*) FROM WeldersWork';
    FDQuery.Open;

    StatusWork.Text := 'Записей: ' + FDQuery.Fields[0].AsString;
    mLogAdd('Add rec db all ' + FDQuery.Fields[0].AsString);

  finally
    // Освобождение ресурсов
    FDQuery.Free;
    Connection.Free;
    Transaction.Free;
  end;
end;

procedure CopyChildNodesToString(Node: TTreeViewItem; var S: string);
var
  i: Integer;
  Dublicate, Dublicate2: String;
begin
  // Dublicate := '';
  for i := 0 to Node.Count - 1 do
  begin
    if Pos('[', Node.Items[i].Text) > 0 then
    begin
      Dublicate2 := Copy(Node.Items[i].Text, 1,
        Pos('[', Node.Items[i].Text) - 1);
    end
    else if Pos('(', Node.Items[i].Text) > 0 then
    begin
      Dublicate2 := Copy(Node.Items[i].Text, 1,
        Pos('(', Node.Items[i].Text) - 1);
    end
    else
    begin
      Dublicate2 := Node.Items[i].Text;
    end;

    if Dublicate = Dublicate2 then
    Begin
      // Continue;
      break;
    End;

    if Pos('[', Node.Items[i].Text) > 0 then
    begin
      S := S + Copy(Node.Items[i].Text, 1, Pos('[', Node.Items[i].Text) -
        1) + #13#10;
      Dublicate := Copy(Node.Items[i].Text, 1,
        Pos('[', Node.Items[i].Text) - 1);
    end
    else if Pos('(', Node.Items[i].Text) > 0 then
    begin
      S := S + Copy(Node.Items[i].Text, 1, Pos('(', Node.Items[i].Text) -
        1) + #13#10;
      Dublicate := Copy(Node.Items[i].Text, 1,
        Pos('(', Node.Items[i].Text) - 1);
    end
    else
    begin
      S := S + Node.Items[i].Text + #13#10;
      Dublicate := Node.Items[i].Text;
    end;

    if Node.Items[i].Count > 0 then
    begin
      // Рекурсивный вызов для дочерних узлов
      CopyChildNodesToString(Node.Items[i], S);
    end;
  end;
end;

procedure TfWeldingOffline.mLogAdd(const S: String);
begin
  if ActLog.IsChecked then
  begin
    mLog.Lines.BeginUpdate;
    try
      mLog.Lines.Insert(0, S);
      mLog.SelStart := 0;
    finally
      mLog.Lines.EndUpdate;
    end;
  end;
end;

procedure TfWeldingOffline.VisiblePanelClick(Sender: TObject);
begin
  if VisiblePanel.Cancel then
  Begin
    tFindFiltr.Visible := False;
    VisiblePanel.Cancel := False;
  End
  else
  Begin
    tFindFiltr.Visible := True;
    VisiblePanel.Cancel := True;
  End;
end;

procedure TfWeldingOffline.Button1Click(Sender: TObject);
begin
  Comment.Text := Comment.Text + ' Ø';
  Comment.SetFocus;
  Comment.SelStart := Comment.Text.Length;
end;

procedure TfWeldingOffline.Button2Click(Sender: TObject);
begin
  Comment.Text := Comment.Text + ' ℓ';
  Comment.SetFocus;
  Comment.SelStart := Comment.Text.Length;
end;

procedure TfWeldingOffline.BtnGenerateClick(Sender: TObject);
// Функция для генерации случайной даты и времени в заданном диапазоне
  function RandomDateTime(const AFrom, ATo: TDateTime): TDateTime;
  var
    SecsBetween: Int64;
  begin
    SecsBetween := SecondsBetween(AFrom, ATo);
    Result := IncSecond(AFrom, Round(SecsBetween * Random));
  end;

const
  // Максимальное значение для генерации случайных чисел
  MaxRand = 10;
var
  Id, L, N, wType: String;
  tI, i: Integer;
begin
  // Установка текста статуса выполнения генерации
  StatusWork.Text := 'Генерация';
  FDQuery := TFDQuery.Create(nil);
  // Формирование SQL-запроса на вставку данных в таблицу базы данных
  FDQuery.SQL.Text :=
    'INSERT INTO WeldersWork (Id, TypeWeld, Symbol, Number, Layer, Comment, DTime)'
    + ' VALUES (:Id, :TypeWeld, :Symbol, :Number, :Layer, :Comment, :DTime)';

  // Генерация 10 записей в цикле
  for i := 1 to MaxRand do
  begin
    // Генерация номера изделия в формате XXX.XX.XX.XXX
    Id := Format('%d%d%d.%d%d.%d%d.%d%d%d', [Random(MaxRand), Random(MaxRand),
      Random(MaxRand), Random(MaxRand), Random(MaxRand), Random(MaxRand),
      Random(MaxRand), Random(MaxRand), Random(MaxRand), Random(MaxRand)]);

    // Заполнение полей формы случайными значениями
    ProductNumber.Text := Id;

    // Генерируем тип наплавки
    WeldingType.ItemIndex := Random(WeldingType.Items.Count);

    // Генерируем букву наплавки
    L := Chr(ord('A') + Random(3));
    LetterOfCladding.Text := L;

    // Генерируем номер наплавки
    N := Random(3).ToString;
    CladdingNumber.Text := N;

    // Генерируем слой наплавки
    tI := Random(2);
    case tI of
      0:
        begin
          wType := 'Перех';
          TransitionLayer.IsChecked := True;
        end;
      1:
        begin
          wType := 'Нерж';
          TransitionLayer.IsChecked := False;
        end;
    end;

    // Добавление записи в базу данных
    AddRecordToSQLiteDB(ProductNumber.Text,
      WeldingType.Items[WeldingType.ItemIndex], LetterOfCladding.Text,
      CladdingNumber.Text, wType, Trim(Comment.Text));
  end;
end;

// Получение текста комментария из записи в SQLite базе данных, связанной с работой сварщиков
{ function TfWeldingOffline.GetCommentText(const ProductNumber, WeldingType,
  LetterOfCladding, CladdingNumber, CladdingLayer: string): string;
  var
  Connection: TFDConnection;
  // Объект подключения к базе данных
  Query: TFDQuery; // Объект для выполнения SQL-запросов
  begin
  // Создание экземпляров объектов
  Connection := TFDConnection.Create(nil);
  Query := TFDQuery.Create(nil);
  try
  // Установка параметров подключения
  Connection.DriverName := 'SQLite';
  Connection.Params.Values['Database'] := FDirPath + WeldersWorkDB;
  Connection.Connected := True;

  // Настройка и выполнение SQL-запроса для получения текста комментария
  Query.Connection := Connection;

  Query.SQL.Text := 'SELECT Comment FROM WeldersWork ' +
  'WHERE ProductNumber = :ProductNumber AND WeldingType = :WeldingType ' +
  'AND LetterOfCladding = :LetterOfCladding AND CladdingNumber = :CladdingNumber AND CladdingLayer = :CladdingLayer '
  + 'ORDER BY DateTime DESC LIMIT 1';
  Query.ParamByName('ProductNumber').AsString := ProductNumber;
  Query.ParamByName('WeldingType').AsString := WeldingType;
  Query.ParamByName('LetterOfCladding').AsString := LetterOfCladding;
  Query.ParamByName('CladdingNumber').AsString := CladdingNumber;
  Query.ParamByName('CladdingLayer').AsString := CladdingLayer;
  Query.Open;

  // Возврат результата: текст комментария
  Result := Query.FieldByName('Comment').AsString;
  finally
  // Освобождение ресурсов
  Query.Free;
  Connection.Free;
  end;
  end; }

function TfWeldingOffline.GetCommentText(const SelectID: Integer): string;
var
  Connection: TFDConnection;
  // Объект подключения к базе данных
  Query: TFDQuery; // Объект для выполнения SQL-запросов
begin
  // Создание экземпляров объектов
  Connection := TFDConnection.Create(nil);
  Query := TFDQuery.Create(nil);
  try
    // Установка параметров подключения
    Connection.DriverName := 'SQLite';
    Connection.Params.Values['Database'] := FDirPath + WeldersWorkDB;
    Connection.Connected := True;

    // Настройка и выполнение SQL-запроса для получения текста комментария
    Query.Connection := Connection;
    Query.SQL.Text := 'SELECT Comment FROM WeldersWork ' +
      'WHERE RowNumber = :RowNumber';
    Query.ParamByName('RowNumber').AsInteger := SelID;
    Query.Open;

    // Возврат результата: текст комментария
    Result := Query.FieldByName('Comment').AsString;
  finally
    // Освобождение ресурсов
    Query.Free;
    Connection.Free;
  end;
end;

procedure TfWeldingOffline.GetCommentClick(Sender: TObject);
// var
// wType: string;
begin
  // Определяем тип наплавки
  { case TransitionLayer.IsChecked of
    True:
    wType := 'Перех';
    False:
    wType := 'Нерж';
    end;

    Comment.Text := GetCommentText(ProductNumber.Text,
    WeldingType.Items[WeldingType.ItemIndex], LetterOfCladding.Text,
    CladdingNumber.Text, wType); }
end;

procedure TfWeldingOffline.LinkUpgradeClick(Sender: TObject);
{$IF Defined(IOS)}
// and NOT defined(CPUARM)
  procedure openURL(Url: String);
  begin
    SharedApplication.openURL
      (TNSURL.Wrap(TNSURL.OCClass.URLWithString(NSSTR(PChar(String(Url))))));
  end;
{$ELSEIF Defined(ANDROID)}
  procedure openURL(Url: String);
  var
    Intent: JIntent;
  begin
    Intent := TJIntent.Create;
    Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
    Intent.setData(StrToJURI(Url));
    SharedActivity.startActivity(Intent);
  end;
{$ELSEIF Defined(MSWINDOWS)}
  procedure openURL(Url: String);
  begin
    ShellExecute(0, 'open', PWideChar(Url), nil, nil, SW_SHOW);
  end;
{$ENDIF}

begin
  openURL('https://disk.yandex.ru/d/n_KkzBbuvcR57g');
end;

procedure TfWeldingOffline.ListWeldingTypesChangeCheck(Sender: TObject);
Var
  i: Integer;
begin
  WeldingType.Clear;
  for i := 0 to ListWeldingTypes.Items.Count - 1 do
  begin
    if ListWeldingTypes.ListItems[i].IsChecked then
    begin
      WeldingType.Items.Add(ListWeldingTypes.Items[i]);
    end;
  end;
end;

procedure TfWeldingOffline.ListWeldingTypesItemClick(const Sender
  : TCustomListBox; const Item: TListBoxItem);
begin
  // Переключение состояния IsChecked при клике на элемент
  Item.IsChecked := not Item.IsChecked;
  // Сбрасываем выделение элемента
  ListWeldingTypes.ItemIndex := -1;
end;

procedure TfWeldingOffline.ListWeldingTypesMouseUp(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin

end;

{
  Процедура для обновления комментария в записи базы данных
  Процедура принимает следующие параметры:

  ProductNumber: строка с номером продукта
  WeldingType: строка с типом сварки
  LetterOfCladding: строка с буквой наплавки
  CladdingNumber: строка с номером наплавки
  CladdingLayer: строка с слоем наплавки
  NewComment: строка с новым комментарием для обновления
  SQL-запрос обновляет значение поля "Comment" для записи, у которой поля
  ProductNumber, WeldingType, LetterOfCladding, CladdingNumber и CladdingLayer совпадают с переданными параметрами. }
procedure TfWeldingOffline.UpdateComment(const SelectID: Integer;
NewComment: string);
var
  Connection: TFDConnection;
  // Объект подключения к базе данных
  Transaction: TFDTransaction; // Объект для управления транзакциями
  RowsAffected: Integer; // Количество затронутых строк
begin
  // Создание экземпляров объектов
  Connection := TFDConnection.Create(nil);
  Transaction := TFDTransaction.Create(nil);
  try
    // Установка параметров подключения
    Connection.DriverName := 'SQLite';
    Connection.Params.Values['Database'] := FDirPath + WeldersWorkDB;
    Connection.Connected := True;

    // Начало транзакции
    Transaction.Connection := Connection;
    Transaction.StartTransaction;

    // Выполнение SQL запроса для обновления комментария в таблице WeldersWork
    RowsAffected := Connection.ExecSQL('UPDATE WeldersWork ' +
      'SET Comment = :NewComment  WHERE RowNumber = :RowNumber',
      [NewComment, SelectID]);

    // Проверка на успешность обновления комментария
    if RowsAffected = 0 then
    Begin
      ShowMessage('Запись не найдена. Комментарий не был обновлен.');
      mLogAdd('Запись не найдена');
    End
    else
    Begin
      StatusWork.Text := 'Комментарий был обновлен';
      mLogAdd('Комментарий был обновлен');
    End;

    // Фиксация изменений
    Transaction.Commit;
  finally
    // Освобождение ресурсов
    Connection.Free;
    Transaction.Free;
  end;
end;

procedure TfWeldingOffline.UpdateCommClick(Sender: TObject);
var
  Comm: string;
begin
  // Проверяем наличие выбранного  изделия
  if SelID = -1 then
  Begin
    ShowMessage('Не выбран отчёт!');
    Exit;
  End;

  Comm := GetCommentText(SelID);

  MessageDlg('Применить изменения к:' + sLineBreak + ProductNumber.Text +
    sLineBreak + '[' + Comm + ']', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo { ,
    System.UITypes.TMsgDlgBtn.mbCancel }
    ], 0,
    procedure(const AResult: System.UITypes.TModalResult)
    begin
      case AResult of
        mrYES:
          UpdateComment(SelID, Trim(Comment.Text));
        { mrNo:
          ShowMessage('You chose No');
          mrCancel:
          ShowMessage('You chose Cancel'); }
      end;
    end);

  CladdingNumber.SetFocus;

  FindRecordsDateInSQLiteDB(Calendar1.Date, TreeView);
  TreeExpandAll.OnClick(nil);
end;

procedure TfWeldingOffline.VisibleCalendarClick(Sender: TObject);
begin
  if Calendar1.Visible then
  Begin
    Calendar1.Visible := False;
    if VisiblePanel.Cancel then
      tFindFiltr.Visible := True;
  End
  else
  Begin
    HighlightDatesOnCalendar();
    Calendar1.Visible := True;
    tFindFiltr.Visible := False;
    VisiblePanel.Cancel := False;
  End;
end;

procedure TfWeldingOffline.CollapseAllClick(Sender: TObject);
Var
  i: Integer;
begin
  AniIndicator.Visible := True;
  AniIndicator.Enabled := True;
  ProgressBar.Visible := True;
  ProgressBar.Max := TreeView.Count - 1;
  TreeView.BeginUpdate;
  for i := 0 to TreeView.Count - 1 do
  Begin
    TreeView.Items[i].CollapseAll;
    ProgressBar.Value := i;
    if (i mod 100 = 0) then
      Application.ProcessMessages;
  End;
  TreeView.EndUpdate;
  ProgressBar.Visible := False;
  AniIndicator.Visible := False;
  AniIndicator.Enabled := False;
end;

function TfWeldingOffline.RegExReplace(Text: String): String;
begin
  If not AddCommCopBuff.IsChecked then
  Begin
    Text := TRegEx.Replace(Text, '\[.*?\]', '');
    Text := TRegEx.Replace(Text, '\(.*?\)', '');
  End;

  Result := Trim(Text);
end;

// Процедура для итерации узлов TreeView и формирования текстового представления
procedure TfWeldingOffline.IterateTreeViewNodes(ANode: TTreeViewItem;
var AResult: string; var PrevChildNodes: TArray<string>);
var
  i: Integer;
  ModifiedText, Line: string;
  Level: Integer;
begin
  if ANode <> nil then
  begin
    // Удаление информации в квадратных и круглых скобках из текста узла
    // ModifiedText := TRegEx.Replace(ANode.Text, '\[.*?\]', '');
    // ModifiedText := TRegEx.Replace(ModifiedText, '\(.*?\)', '');
    ModifiedText := RegExReplace(ANode.Text);
    ModifiedText := RegExReplace(ModifiedText);
    // Определение уровня текущего узла
    Level := ANode.Level;

    // Обработка узлов в зависимости от их уровня
    Line := '';

    if (ANode <> nil) and (ANode.Level = 1) then
    begin
      // Формирование строки для узлов уровня 1 (Номер изделия)
      Line := ANode.Text { + ' ' + ModifiedText };
    end
    else if (ANode <> nil) and (ANode.Level = 2) then
    begin
      // Формирование строки для узлов уровня 2 (Вид наплавки)
      if not SameStr(PrevChildNodes[Level], ModifiedText) then
        Line := ModifiedText;
    end
    else if (ANode <> nil) and (ANode.Level = 3) then
    begin
      // Формирование строки для узлов уровня 3 (Тип наплавки)
      if not SameStr(PrevChildNodes[Level], ModifiedText) then
        Line := ModifiedText;
    end
    else
    begin
      Line := ModifiedText;
    end;

    // Добавление строки в результат с учетом уровня узла
    if Line <> '' then
    begin
      if Level = 1 then
        AResult := AResult + Line + sLineBreak
      else
        AResult := AResult + StringOfChar(' ', Level * 2) + Line + sLineBreak;
    end;

    // Итерация по дочерним узлам текущего узла
    for i := 0 to ANode.Count - 1 do
    begin
      if (i = 0) or not SameStr(RegExReplace(ANode.Items[i].Text),
        RegExReplace(ANode.Items[i - 1].Text)) then
        IterateTreeViewNodes(ANode.Items[i], AResult, PrevChildNodes);
    end;
  end;
  // If not AddCommCopBuff.IsChecked then
end;

procedure TfWeldingOffline.CopyReportClick(Sender: TObject);
var
  ClipboardService: IFMXClipBoardService;
  NodesText: string;
  i: Integer;
  PrevChildNodes: TArray<string>;
begin
  NodesText := '';

  SetLength(PrevChildNodes, 4);

  // Пробегаем по дереву и формируем текстовую строку
  for i := 0 to TreeView.Count - 1 do
    IterateTreeViewNodes(TreeView.Items[i], NodesText, PrevChildNodes);

  // Копируем текстовую строку в буфер обмена
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipBoardService,
    IInterface(ClipboardService)) then
  begin
    ClipboardService.SetClipboard(NodesText);
  end
  else
    ShowMessage('Сервис буфера обмена не поддерживается на данной платформе');
end;

procedure TfWeldingOffline.FindAllBaseKeyDown(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
begin
  FindProduct.Text := '';
end;

{
  Код представляет процедуру поиска записей в базе данных SQLite
  по заданной маске продукта и отображения результатов поиска.
}
procedure TfWeldingOffline.FindRecordsInAllDB(const ProductMask: string;
TreeView: TTreeView);
var
  Connection: TFDConnection;
  // Объект подключения к базе данных
  Query: TFDQuery; // Объект для выполнения SQL-запросов
  ParentNode, ChildNode1, ChildNode2: TTreeViewItem;
  // Узлы дерева просмотра
  ParentNodeExists, ChildNode1Exists: Boolean;
  // Флаги существования узлов
  i, j: Integer; // Счетчики для циклов
begin
  // Создание экземпляров объектов
  Connection := TFDConnection.Create(nil);
  // Создаем объект для выполнения запросов
  Query := TFDQuery.Create(nil);
  try
    // Установка параметров подключения
    Connection.DriverName := 'SQLite';
    Connection.Params.Values['Database'] := FDirPath + WeldersWorkDB;
    Connection.Connected := True;
    // Настройка и выполнение SQL-запроса для поиска записей с использованием маски продукта
    Query.Connection := Connection;

    if ShowDate.IsChecked then
      Query.SQL.Text :=
        'SELECT RowNumber, ProductNumber, WeldingType, LetterOfCladding, CladdingNumber, CladdingLayer, DateTime, Comment '
        + 'FROM WeldersWork WHERE ProductNumber LIKE :ProductMask or DateTime LIKE :ProductMask or ru_lower(Comment) LIKE ru_lower(:ProductMask) '
      // Сортировка по столбцам. Отсортировать столбец DateTime по убыванию, а остальные столбцы по возрастанию
        + 'ORDER BY DateTime DESC, CladdingNumber, LetterOfCladding'
    else
      Query.SQL.Text :=
        'SELECT RowNumber, ProductNumber, WeldingType, LetterOfCladding, CladdingNumber, CladdingLayer, DateTime,Comment '
        + 'FROM WeldersWork WHERE ProductNumber LIKE :ProductMask or DateTime LIKE :ProductMask or ru_lower(Comment) LIKE ru_lower(:ProductMask) '
        + 'ORDER BY DateTime DESC, CladdingNumber, LetterOfCladding';
    Query.ParamByName('ProductMask').AsString := '%' + ProductMask + '%';
    Query.Open;

    // Устанавливаем текст статуса
    Status.Text := 'Строк: ' + IntToStr(Query.RecordCount);

    // Обновление дерева просмотра с результатами поиска
    TreeView.BeginUpdate;
    TreeView.Clear;
    try
      // Устанавливаем начальное значение родительского узла
      ParentNode := nil;
      // Устанавливаем начальное значение первого дочернего узла
      ChildNode1 := nil;

      j := 0;
      while not Query.Eof do
      begin
        ProgressBar.Value := j;
        if (j mod 100 = 0) then
          Application.ProcessMessages;

        // Устанавливаем начальное значение для проверки существования родительского узла
        ParentNodeExists := False;
        // Цикл для проверки существования родительского узла
        for i := 0 to TreeView.Count - 1 do
        begin
          ParentNode := TreeView.Items[i]; // Получаем i-ый узел
          // Если текст узла совпадает с номером продукта
          if ParentNode.Text = Query.FieldByName('ProductNumber').AsString then
          begin
            // Устанавливаем флаг, что родительский узел существует
            ParentNodeExists := True;
            break; // Выходим из цикла
          end;
        end;

        if not ParentNodeExists then // Если родительский узел не существует
        begin
          // Создаем новый узел
          ParentNode := TTreeViewItem.Create(TreeView);
          // Устанавливаем родительский узел
          ParentNode.Parent := TreeView;
          // Устанавливаем текст узла
          ParentNode.Text := Query.FieldByName('ProductNumber').AsString;
        end;

        // Устанавливаем начальное значение для проверки существования первого дочернего узла
        ChildNode1Exists := False;
        // Цикл для проверки существования первого дочернего узла
        for j := 0 to ParentNode.Count - 1 do
        begin
          ChildNode1 := ParentNode.Items[j]; // Получаем j-ый узел
          // Если текст узла совпадает с типом сварки
          if ChildNode1.Text = Query.FieldByName('WeldingType').AsString then
          begin
            // Устанавливаем флаг, что первый дочерний узел существует
            ChildNode1Exists := True;
            break; // Выходим из цикла
          end;
        end;

        // Если первый дочерний узел не существует
        if not ChildNode1Exists then
        begin
          // Создаем новый узел
          ChildNode1 := TTreeViewItem.Create(TreeView);
          // Устанавливаем родительский узел
          ChildNode1.Parent := ParentNode;
          // Устанавливаем текст узла
          ChildNode1.Text := Query.FieldByName('WeldingType').AsString;
        end;

        // Создание узла для информации о облицовке
        ChildNode2 := TTreeViewItem.Create(TreeView); // Создаем новый узел
        // Устанавливаем родительский узел
        ChildNode2.Parent := ChildNode1;

        ChildNode2.Text := Query.FieldByName('LetterOfCladding').AsString +
          Query.FieldByName('CladdingNumber').AsString + ' ' +
          Query.FieldByName('CladdingLayer').AsString;

        // Добавление даты, если выбрано
        if ShowDate.IsChecked then
          ChildNode2.Text := ChildNode2.Text + ' →' +
            FormatDateTime('dd.mm.yyyy', Query.FieldByName('DateTime')
            .AsDateTime);

        // Добавление комментария, если он есть
        if Query.FieldByName('Comment').AsString <> '' then
          ChildNode2.Text := ChildNode2.Text + ' [' +
            Query.FieldByName('Comment').AsString + ']';

        // Номер строки помещаем в скрытый атрибут
        ChildNode2.TagString :=
          (Query.FieldByName('RowNumber').AsInteger).ToString;

        Query.Next;
      end;
    finally
      TreeView.EndUpdate;
    end;
  finally
    ProgressBar.Visible := False;
    AniIndicator.Visible := False;
    AniIndicator.Enabled := False;
    // Освобождение ресурсов
    Query.Free;
    Connection.Free;
  end;
end;

// Функция для поиска или создания узла
function TfWeldingOffline.FindOrCreateNode(Parent: TFmxObject;
const Text: string): TTreeViewItem;
var
  i: Integer;
  TreeItemParent: TTreeViewItem;
begin
  // Приводим тип Parent к TTreeViewItem, если это возможно
  TreeItemParent := Parent as TTreeViewItem;

  // Ищем существующий узел
  for i := 0 to TreeItemParent.Count - 1 do
  begin
    if TreeItemParent.Items[i].Text = Text then
    begin
      Exit(TreeItemParent.Items[i]);
    end;
  end;

  // Если узел не найден, создаем новый
  Result := TTreeViewItem.Create(TreeView);
  Result.Parent := TreeItemParent;
  Result.Text := Text;
end;

procedure TfWeldingOffline.FindIndbClick(Sender: TObject);
var
  InputDate: string;
  // Month, Day: Integer;
  OutputDate: string;
  // DotPos: Integer;
  Date: TDateTime;
begin
  // Включаем анимацию
  AniIndicator.Visible := True;
  AniIndicator.Enabled := True;
  ProgressBar.Visible := True;
  ProgressBar.Value := 0;

  if FindAllBase.Text <> '' then
  Begin
    InputDate := FindAllBase.Text;
    { DotPos := Pos('.', InputDate);
      if (DotPos = 3) and (Length(InputDate) = 4) then
      begin
      Month := StrToInt(Copy(InputDate, DotPos + 1, 2));
      Day := StrToInt(Copy(InputDate, 1, DotPos - 1));
      OutputDate := Format('%.2d-%.2d', [Month, Day]);
      FindRecordsInAllDB(OutputDate, TreeView);
      end
      else }
    begin
      if (TryStrToDate(InputDate, Date)) and (DateSearch.IsChecked) then
      begin
        OutputDate := FormatDateTime('yyyy-mm-dd', Date);
        FindRecordsInAllDB(OutputDate, TreeView);
      end
      else if (not TryStrToDate(InputDate, Date)) and (DateSearch.IsChecked)
      then
      Begin
        ShowMessage('Дата введена не корректно!')
      End
      else
        FindRecordsInAllDB(FindAllBase.Text, TreeView);
    End;
  End
  else
    FindRecordsInSQLiteDB(FindProduct.Text, TreeView);
end;

procedure TfWeldingOffline.FindProductClick(Sender: TObject);
begin
  FindProduct.SelectAll;
end;

procedure TfWeldingOffline.FindProductKeyDown(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
begin
  FindAllBase.Text := '';
end;

procedure TfWeldingOffline.FormActivate(Sender: TObject);
Var
  i: Integer;
begin
  FindRecordsDateInSQLiteDB(Calendar1.Date, TreeView);
  StatusSearch.Text := 'Выбрана дата: ' + DateToStr(Calendar1.Date);
  TreeView.BeginUpdate;
  for i := 0 to TreeView.Count - 1 do
  Begin
    TreeView.Items[i].ExpandAll;
    if (i mod 100 = 0) then
      Application.ProcessMessages;
  End;
  TreeView.EndUpdate;
end;

// procedure Delay(AMilliseconds: Cardinal); //System.Diagnostics,
// var
// Stopwatch: TStopwatch;
// begin
// Stopwatch := TStopwatch.StartNew;
// while Stopwatch.ElapsedMilliseconds < AMilliseconds do
// begin
// // Обработать сообщения, чтобы интерфейс не "завис"
// Application.ProcessMessages;
// end;
// end;

// Функция для поиска текста без учёта регистра для кириллицы
procedure TfWeldingOffline.ru_lower(AFunc: TSQLiteFunctionInstance;
AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
begin
  AOutput.AsString := AInputs[0].AsString.ToLower;
end;

// Функция для поиска текста без учёта регистра для кириллицы
procedure TfWeldingOffline.CreateFunc_RuLower;
begin
  WC1 := TFDPhysSQLiteDriverLink.Create(nil);
  SQLiteFunction := TFDSQLiteFunction.Create(nil);
  SQLiteFunction.DriverLink := WC1;
  SQLiteFunction.FunctionName := 'ru_lower';
  SQLiteFunction.ArgumentsCount := 1;
  SQLiteFunction.OnCalculate := ru_lower;
  SQLiteFunction.Active := True;
end;

procedure TfWeldingOffline.FormCreate(Sender: TObject);
Var
  R: TBinaryReader;
  ErrStr, ErrR: String;
  i: Integer;
  WeldingItems: TStringList;
  Connection: TFDConnection;
  // Объект подключения к базе данных
  // Инициализируем словарь для быстрого поиска
  WeldingItemsSet: TDictionary<String, Boolean>;
begin
  // Фиксируем первую вкладку при открытии
  TabControl1.ActiveTab := TabWork;
  tFindFiltr.ActiveTab := TabFind;
  ProgressBar.Visible := False;
  Info.Visible := False;
{$IF Defined(ANDROID)}
  if TPlatformServices.Current.SupportsPlatformService
    (IFMXVirtualKeyboardToolbarService, IInterface(FService1)) then
  begin
    FService1.SetToolbarEnabled(True);
    FService1.SetHideKeyboardButtonVisibility(True);
  end;
  VertScrollBox.OnCalcContentBounds := CalcContentBoundsProc;
{$ENDIF}

  // ... загрузка ресурсов ...
  // UpdateSplashProgress(1, 'Определяем путь к директории на устройстве');
{$IF Defined(ANDROID)}
  // Скрываем элемент BtnGenerate на Android
  BtnGenerate.Visible := False;
  // Определяем путь к директории на устройстве
  // Если файл во внутреннем накопителе то GetDocumentsPath
  // Если файл на публичном накопителе то GetPublicPath
  FDirPath := TPath.Combine(TPath.GetPublicPath, '') + '/';
{$ELSE Defined(MSWINDOWS)}
  // Определяем путь к директории на ПК с ОС Windows
  FDirPath := ExtractFilePath(ParamStr(0));
{$ENDIF}
  mLogAdd(FDirPath);
  // UpdateSplashProgress(2, 'Загрузка настроек');

  // mLogAdd(System.IOUtils.TPath.GetHomePath);

  // Инициализация списка и словаря
  WeldingItems := TStringList.Create;
  WeldingItemsSet := TDictionary<String, Boolean>.Create;

  // Задаем путь хранения состояния
  SaveState.StoragePath := FDirPath; // TPath.GetHomePath;
  //////////////////////////////////
  try
    // Проверяем наличие данных в потоке
    if SaveState.Stream.Size = 0 then
    begin
      ShowMessage('Перезагрузите программу для обновления стартовых настроек');
      Exit;
    end;

    // Создаем бинарный ридер для чтения данных
    R := TBinaryReader.Create(SaveState.Stream);
    try
      mLogAdd('>Load..');
      LoadErr := 'Ok';

      try
        // Чтение и проверка настроек
        ErrStr := 'LoadErr';
        ErrR := R.ReadString;
        mLogAdd(ErrStr + '=' + ErrR);
        if LoadErr <> ErrR then
        begin
          ShowMessage('Настройки сброшены.');
          Exit;
        end;

        // Чтение остальных настроек
        ErrStr := 'ID';
        ErrR := R.ReadString;
        mLogAdd(ErrStr + '=' + ErrR);
        ProductNumber.Text := ErrR;

        ErrStr := 'Layer';
        ErrR := BoolToStr(R.ReadBoolean, True);
        mLogAdd(ErrStr + '=' + ErrR);
        TransitionLayer.IsChecked := ErrR.ToBoolean;

        ErrStr := 'LetterOfCladding';
        ErrR := R.ReadString;
        mLogAdd(ErrStr + '=' + ErrR);
        LetterOfCladding.Text := ErrR;

        ErrStr := 'ActLOG';
        ErrR := BoolToStr(R.ReadBoolean, True);
        mLogAdd(ErrStr + '=' + ErrR);
        ActLog.IsChecked := ErrR.ToBoolean;

        // Чтение списка типов сварки
        ErrStr := 'WeldingType';
        WeldingItems.Delimiter := ';';
        WeldingItems.StrictDelimiter := True;
        WeldingItems.DelimitedText := R.ReadString;

        WeldingType.Clear;
        for i := 0 to WeldingItems.Count - 1 do
          WeldingType.Items.Add(WeldingItems[i]);

      except
        on E: EInOutError do
          ShowMessage('Ошибка ввода/вывода: ' + E.Message);
        on E: EDivByZero do
          ShowMessage('Ошибка деления на ноль: ' + E.Message);
        on E: Exception do
        begin
          ShowMessageFmt
            ('Ошибка при загрузке настроек! [%s=%s] Перезапустите программу.',
            [ErrStr, ErrR]);
          mLogAdd(Format('Error [%s=%s]', [ErrStr, ErrR]));
        end;
      end;

    finally
      R.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Не удалось загрузить настройки: ' + E.Message);
  end;
                   /////////////////////////////////////////
  try
//     // Загрузка настроек программы с проверкой на корректность и ошибки
//     R := TBinaryReader.Create(SaveState.Stream);
//
//     try
//     if SaveState.Stream.Size > 0 then
//     begin
//     Exit;
//     mLogAdd('>Load..');
//     LoadErr := 'Ok';
//     try
//     ErrStr := 'LoadErr';
//     ErrR := R.ReadString;
//     mLogAdd(ErrStr + '=' + ErrR);
//     if LoadErr <> ErrR then
//     Begin
//     ShowMessage('Настройки сброшены.');
//     R.Free;
//     Exit;
//     End;
//
//     ErrStr := 'ID';
//     ErrR := R.ReadString;
//     mLogAdd(ErrStr + '=' + ErrR);
//     ProductNumber.Text := ErrR;
//
//     ErrStr := 'Layer';
//     ErrR := BoolToStr(R.ReadBoolean, True);
//     mLogAdd(ErrStr + '=' + ErrR);
//     TransitionLayer.IsChecked := ErrR.ToBoolean; // R.ReadBoolean;
//
//     ErrStr := 'LetterOfCladding';
//     ErrR := R.ReadString;
//     mLogAdd(ErrStr + '=' + ErrR);
//     LetterOfCladding.Text := ErrR;
//
//     ErrStr := 'ActLOG';
//     ErrR := BoolToStr(R.ReadBoolean, True);
//     mLogAdd(ErrStr + '=' + ErrR);
//     ActLog.IsChecked := ErrR.ToBoolean;
//
//     ErrStr := 'WeldingType';
//     WeldingItems.Delimiter := ';';
//     WeldingItems.StrictDelimiter := True;
//     WeldingItems.DelimitedText := R.ReadString;
//
//     WeldingType.Clear;
//     for i := 0 to WeldingItems.Count - 1 do
//     WeldingType.Items.Add(WeldingItems[i]);
//
//     except
//     on E: Exception do
//     begin
//     ShowMessageFmt
//     ('Ошибка при загрузке настроек! [%s=%s] Перезапустите программу.',
//     [ErrStr, ErrR]);
//     LoadErr := 'Error';
//     mLogAdd(Format('Error [%s=%s]', [ErrStr, ErrR]));
//     Exit;
//     end;
//     On E: EInOutError do
//     ShowMessage('IO error: ' + E.Message);
//     // Деление на ноль
//     On E: EDivByZero do
//     ShowMessage('Div by zero error: ' + E.Message);
//     // Все остальное:
//     else
//     ShowMessage('Unknown error');
//     end;
//     end
//     else
//     ShowMessage
//     ('Перезагрузите программу для обновления стартовых настроек');
//     finally
//     R.Free;
//     end;

    mLogAdd('>Load.. Завершена');

    // Скрываем элементы ProgressBar и AniIndicator
    ProgressBar.Visible := False;
    AniIndicator.Visible := False;
    AniIndicator.Enabled := False;

//     UpdateSplashProgress(3, 'Проверка БД');

    // Данный код создает базу данных SQLite с именем "WeldersWork.db", если она еще не существует
    CreateSQLiteDB;

    { Код перебирает все элементы в ListWeldingTypes, проверяя, есть ли каждый
      элемент в WeldingItems. Если элемент присутствует в WeldingItems,
      свойство IsChecked устанавливается в True для соответствующего элемента в ListWeldingTypes.
      Оптимизированный код использует TDictionary для ускорения поиска и улучшения производительности кода }
    // Перебор элементов и проверка наличия в словаре
    for i := 0 to WeldingItems.Count - 1 do
      WeldingItemsSet.AddOrSetValue(WeldingItems[i], True);

    for i := 0 to ListWeldingTypes.Items.Count - 1 do
      ListWeldingTypes.ListItems[i].IsChecked :=
        WeldingItemsSet.ContainsKey(ListWeldingTypes.Items[i]);

  finally
    WeldingItems.Free;
    WeldingItemsSet.Free;
  end;

  // UpdateSplashProgress(4, 'Заполняем календарь');
  Calendar1.Date := Now;
  Calendar1.Visible := False;
  Calendar1.Model.ShowEvents := True;
  // Calendar1.Model.ShowWeekends := True;
  // Этот код выделяет даты из базы данных SQLite на календаре TCalendar
  // HighlightDatesOnCalendar();

  { Код создает подключение к базе данных SQLite и выполняет запрос SQL для подсчета
    количества записей в таблице WeldersWork. Затем он обновляет текстовое поле StatusWork,
    добавляя к нему количество записей. }
  try
    // Создание объектов для подключения и запроса
    Connection := TFDConnection.Create(nil);
    FDQuery := TFDQuery.Create(Connection);
    // передаем владение объектом Connection

    try
      // Настройка подключения к базе данных
      Connection.DriverName := 'SQLite';
      Connection.Params.Values['Database'] := FDirPath + WeldersWorkDB;
      Connection.Connected := True;

      // Настройка и выполнение запроса
      FDQuery.Connection := Connection;
      FDQuery.SQL.Text := 'SELECT COUNT(*) FROM WeldersWork';
      FDQuery.Open;

      // Обновление интерфейса с количеством записей
      StatusWork.Text := Format('%s. Записей: %d',
        [StatusWork.Text, FDQuery.Fields[0].AsInteger]);
    finally
      // Освобождение ресурсов
      FDQuery.Free;
      // не требуется удаление, поскольку FDQuery управляет его жизненным циклом
      Connection.Free;
    end;
  except
    on E: Exception do
      // Обработка исключений
      ShowMessage(E.Message);
  end;

  // Функция для поиска текста без учёта регистра (Костыль для SQL на андроид)
  CreateFunc_RuLower;
end;

procedure TfWeldingOffline.FormFocusChanged(Sender: TObject);
begin
{$IF Defined(ANDROID)}
  UpdateKBBounds;
{$ENDIF}
end;

procedure TfWeldingOffline.FormGesture(Sender: TObject;
const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IF Defined(ANDROID)}
  case EventInfo.GestureID of
    sgiLeft:
      begin
        if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount - 1]
        then
          TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex + 1];
        Handled := True;
      end;

    sgiRight:
      begin
        if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
          TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex - 1];
        Handled := True;
      end;
  end;
{$ENDIF}
end;

procedure TfWeldingOffline.FormSaveState(Sender: TObject);
Var
  W: TBinaryWriter;
  SelectedItems: string;
  i: Integer;
begin
  SaveState.Stream.Clear;
  W := TBinaryWriter.Create(SaveState.Stream);
  try
    W.Write(LoadErr);
    W.Write(ProductNumber.Text);
    W.Write(TransitionLayer.IsChecked);
    // W.Write(WeldingType.Items[WeldingType.ItemIndex]);
    W.Write(LetterOfCladding.Text);
    W.Write(ActLog.IsChecked);

    SelectedItems := '';
    for i := 0 to ListWeldingTypes.Items.Count - 1 do
    begin
      if ListWeldingTypes.ListItems[i].IsChecked then
      begin
        if SelectedItems <> '' then
          SelectedItems := SelectedItems + ';';
        SelectedItems := SelectedItems + ListWeldingTypes.Items[i];
      end;
    end;
    W.Write(SelectedItems);
  finally
    W.Free;
  end;
end;

procedure TfWeldingOffline.FormVirtualKeyboardHidden(Sender: TObject;
KeyboardVisible: Boolean; const Bounds: TRect);
begin
{$IF Defined(ANDROID)}
  FKBBounds.Create(0, 0, 0, 0);
  FNeedOffset := False;
  RestorePosition;
{$ENDIF}
end;

procedure TfWeldingOffline.FormVirtualKeyboardShown(Sender: TObject;
KeyboardVisible: Boolean; const Bounds: TRect);
begin
{$IF Defined(ANDROID)}
  FKBBounds := TRectF.Create(Bounds);
  FKBBounds.TopLeft := ScreenToClient(FKBBounds.TopLeft);
  FKBBounds.BottomRight := ScreenToClient(FKBBounds.BottomRight);
  UpdateKBBounds;
{$ENDIF}
end;

procedure TfWeldingOffline.CommentDblClick(Sender: TObject);
begin
  Comment.SelectAll;
end;

procedure TfWeldingOffline.PasteScharpClick(Sender: TObject);
begin
  ProductNumber.Text := ProductNumber.Text + ' #';
  ProductNumber.SetFocus;
  ProductNumber.SelStart := ProductNumber.Text.Length;
end;

procedure TfWeldingOffline.ProductNumberChange(Sender: TObject);
Var
  S: String;
begin
  S := ProductNumber.Text;
  S := StringReplace(S, '.', '', [rfReplaceAll]); // удалить все точки
  if Length(S) > 3 then
    Insert('.', S, 4);
  // вставить точку после 3 символов
  if Length(S) > 6 then
    Insert('.', S, 7);
  // вставить точку после 5 символов
  if Length(S) > 9 then
    Insert('.', S, 10);
  // вставить точку после 7 символов
  if ProductNumber.Text <> S then
    // чтобы избежать бесконечной рекурсии
    ProductNumber.Text := S;
end;

procedure TfWeldingOffline.ProductNumberClick(Sender: TObject);
begin
  if AutoSelectAll.IsChecked then
    ProductNumber.SelectAll;
end;

procedure TfWeldingOffline.ProductNumberKeyDown(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
// var
// S: string;
// FormattedS: string;
// i, j: Integer;
begin
  // S := TEdit(Sender).Text;
  //
  // // Удаляем все символы, кроме цифр
  // S := TRegEx.Replace(S, '\D', '');
  //
  // // Ограничиваем длину до 10 символов
  // if Length(S) > 10 then
  // SetLength(S, 10);
  //
  // // Добавляем точки по маске
  // FormattedS := '';
  // J := 1;
  // for I := 1 to Length(S) do
  // begin
  // if (J = 3) or (J = 6) or (J = 8) then
  // begin
  // FormattedS := FormattedS + '.';
  // Inc(J);
  // end;
  // FormattedS := FormattedS + S[I];
  // Inc(J);
  // end;
  //
  // TEdit(Sender).Text := FormattedS;
  // TEdit(Sender).SelStart := Length(FormattedS); // Позиционируем курсор в конец строки

end; // 123.56.89.110

procedure TfWeldingOffline.ProductNumberKeyUp(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
// var
// S: string;
// FormattedS: string;
// i, j: Integer;
begin
  // TEdit(Sender).Text := TEdit(Sender).Text;
  // Comment.Lines.Text := TEdit(Sender).Text;
  // S := TEdit(Sender).Text;
  //
  // // Удаляем все символы, кроме цифр
  // S := TRegEx.Replace(S, '\D', '');
  //
  // // Ограничиваем длину до 10 символов
  // if Length(S) > 10 then
  // SetLength(S, 10);
  //
  // // Добавляем точки по маске
  // FormattedS := '';
  // j := 1;
  // for i := 1 to Length(S) do
  // begin
  // FormattedS := FormattedS + S[i];
  // if (j = 3) or (j = 7) or (j = 10) then
  // begin
  // FormattedS := FormattedS +  '.';    Comment.Lines.Add(FormattedS +  '.');
  // Inc(j);
  // end;
  // Inc(j);
  /// /    Comment.Lines.Add(j.ToString);
  // end;
  //
  // TEdit(Sender).Text := FormattedS;
  // TEdit(Sender).SelStart := Length(FormattedS);
  // // Позиционируем курсор в конец строки
  // {$IF Defined(MSWINDOWS)}
  { CursorPos := ProductNumber.SelStart; // запомнить позицию курсора
    Info.Lines.Add('CursorPos ' + CursorPos.ToString);
    S := ProductNumber.Text;

    S := StringReplace(S, '.', '', [rfReplaceAll]); // удалить все точки
    if Length(S) > 3 then
    Insert('.', S, 4); // вставить точку после 3 символов
    if Length(S) > 5 then
    Insert('.', S, 6); // вставить точку после 5 символов
    if Length(S) > 7 then
    Insert('.', S, 8); // вставить точку после 7 символов

    if ProductNumber.Text <> S then // если текст изменился
    begin
    ProductNumber.Text := S;
    // если курсор был в конце строки
    // if KeyChar = #8 then       exit ;

    if CursorPos = Length(ProductNumber.Text) then
    // вернуть его в конец строки
    ProductNumber.SelStart := Length(ProductNumber.Text)
    else // вернуть курсор на прежнюю позицию с учётом добавленной точки
    if (CursorPos = 4) or (CursorPos = 7) or (CursorPos = 10) then
    if Key = vkBack then // Backspace
    ProductNumber.SelStart := CursorPos - 1
    else
    ProductNumber.SelStart := CursorPos + 1
    else
    // вернуть курсор на прежнюю позицию
    ProductNumber.SelStart := CursorPos;
    end; }
  // {$ENDIF}
  // {$IFDEF ANDROID}  // 123.56.89.110

  // {$ENDIF}

  // if (Length(S) < Length(ProductNumber.Text))
  // { and     (ProductNumber.SelStart >= Length(S) - 2) } then
  // if S[CursorPos] = '.' then
  // CursorPos := CursorPos - 1;
  // Info.Lines.Add('... ' + S[CursorPos]);

  { if ProductNumber.Text <> S then // если текст изменился
    begin
    ProductNumber.Text := S;
    Info.Lines.Add('поз.кур. ' + CursorPos.ToString + ' ' +
    Length(ProductNumber.Text).ToString);

    // если курсор был в конце строки
    if CursorPos = Length(ProductNumber.Text) then
    // вернуть его в конец строки
    Begin
    Info.Lines.Add('1> ' + CursorPos.ToString + ' = ' +
    Length(ProductNumber.Text).ToString);
    Info.Lines.Add('1>' + S);
    ProductNumber.SelStart := Length(ProductNumber.Text)
    End
    else // вернуть курсор на прежнюю позицию с учётом добавленной точки
    if (CursorPos = 4) or (CursorPos = 7) or (CursorPos = 10) then
    if Key = vkBack then // Backspace
    Begin
    ProductNumber.SelStart := CursorPos - 1;
    Info.Lines.Add('2>vkBack CursorPos-1 = ' + CursorPos.ToString);
    End
    else
    Begin
    ProductNumber.SelStart := CursorPos + 1;
    Info.Lines.Add('2>vkBack CursorPos+1 = ' + CursorPos.ToString);
    End
    else
    // вернуть курсор на прежнюю позицию
    Begin
    ProductNumber.SelStart := CursorPos;
    Info.Lines.Add('3> ' + CursorPos.ToString + ' ' +
    Length(ProductNumber.Text).ToString);
    End;
    end; }

end;

procedure TfWeldingOffline.LetterOfCladdingClick(Sender: TObject);
begin
  if AutoSelectAll.IsChecked then
    LetterOfCladding.SelectAll;
end;

procedure TfWeldingOffline.SaveClick(Sender: TObject);
Var
  wType: String;
begin
  // Проверяем, введены ли все необходимые данные
  if (ProductNumber.Text = '') or (LetterOfCladding.Text = '') or
    (WeldingType.ItemIndex = -1) then
  Begin
    StatusWork.Text := 'Отчет выполняемой работы';
    ShowMessage('Не все данные введены!');
    Exit;
  End;

  // Определение типа сварки в зависимости от состояния переключателя TransitionLayer
  wType := IfThen(TransitionLayer.IsChecked, 'Перех', 'Нерж');

  AddRecordToSQLiteDB(ProductNumber.Text,
    WeldingType.Items[WeldingType.ItemIndex], LetterOfCladding.Text,
    CladdingNumber.Text, wType, Trim(Comment.Text));

  CladdingNumber.SetFocus;

  FindRecordsDateInSQLiteDB(Calendar1.Date, TreeView);
  ResetRecord;
end;

procedure TfWeldingOffline.ShowDateChange(Sender: TObject);
begin
  Calendar1DateSelected(nil)

end;

procedure TfWeldingOffline.TreeExpandAllClick(Sender: TObject);
Var
  i: Integer;
begin
  TreeView.BeginUpdate;
  // Включаем анимацию
  AniIndicator.Visible := True;
  AniIndicator.Enabled := True;
  ProgressBar.Visible := True;
  ProgressBar.Max := TreeView.Count - 1;

  for i := 0 to TreeView.Count - 1 do
  Begin
    TreeView.Items[i].ExpandAll;
    ProgressBar.Value := i;
    if (i mod 100 = 0) then
      Application.ProcessMessages;
  End;

  ProgressBar.Visible := False;
  // Выключаем анимацию
  AniIndicator.Visible := False;
  AniIndicator.Enabled := False;
  TreeView.EndUpdate;
end;

procedure TfWeldingOffline.FindRecordRow(const RowNumber: string);
var
  Connection: TFDConnection;
  Query: TFDQuery;
  FDGUIxWaitCursor: TFDGUIxWaitCursor;
  Id: Byte;
begin
  Connection := TFDConnection.Create(nil);
  Query := TFDQuery.Create(nil);
  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(nil);
  try
    Connection.DriverName := 'SQLite';
    Connection.Params.Values['Database'] := FDirPath + WeldersWorkDB;
    Connection.Connected := True;
    Query.Connection := Connection;
    Query.SQL.Text :=
      'SELECT ProductNumber, WeldingType, LetterOfCladding, CladdingNumber, CladdingLayer, Comment '
      + 'FROM WeldersWork ' + 'WHERE RowNumber = ' + RowNumber;

    Query.Open;

    if not Query.Eof then
    begin
      ProductNumber.Text := Query.FieldByName('ProductNumber').AsString;
      // Если не найден тип сварки - устанавливаем автоматически
      if WeldingType.Items.IndexOf(Query.FieldByName('WeldingType')
        .AsString) = -1 then
      Begin
        Id := ListWeldingTypes.Items.IndexOf(Query.FieldByName('WeldingType')
          .AsString);
        ListWeldingTypes.ListItems[Id].IsChecked := True;
      End;

      WeldingType.ItemIndex := WeldingType.Items.IndexOf
        (Query.FieldByName('WeldingType').AsString);
      LetterOfCladding.Text := Query.FieldByName('LetterOfCladding').AsString;
      CladdingNumber.Text := Query.FieldByName('CladdingNumber').AsString;

      if Query.FieldByName('CladdingLayer').AsString = 'Перех' then
        TransitionLayer.IsChecked := True
      else
        TransitionLayer.IsChecked := False;

      Comment.Text := Query.FieldByName('Comment').AsString;
    end
    else
    begin
      ShowMessage('Запись не найдена!');
    end;
  finally
    Query.Free;
    Connection.Free;
    FDGUIxWaitCursor.Free;
  end;
end;

procedure TfWeldingOffline.TreeViewClick(Sender: TObject);
var
  SelectedItem: TTreeViewItem;
  Id: string;
begin
  if TreeView.Selected = nil then
    Exit;
  SelID := -1;

  // Получить выбранный элемент в TTreeView
  SelectedItem := TreeView.Selected;

  if SelectedItem.Count = 0 then
  begin
    Id := SelectedItem.TagString;
    FindRecordRow(Id);
    StatusSearch.Text := 'id= ' + Id;
    StatusWork.Text := 'id= ' + Id;
    SelID := Id.ToInteger;
  end;

  if SelID = -1 then
  Begin
    StatusSearch.Text := 'Поиск в базе данных';
    StatusWork.Text := 'Отчет выполняемой работы';
  End;
end;

procedure TfWeldingOffline.WeldingTypeChange(Sender: TObject);
begin
  if (WeldingType.Items[WeldingType.ItemIndex] = 'Отверстие') then
  Begin
    CladdingNumber.Enabled := True;
    LetterOfCladding.TextPrompt := 'А или..';
  End;
  if (WeldingType.Items[WeldingType.ItemIndex] = 'Пятак') then
  Begin
    CladdingNumber.Enabled := True;
  End;
  if (WeldingType.Items[WeldingType.ItemIndex] = 'Патрубок') then
  Begin
    CladdingNumber.Enabled := False;
    CladdingNumber.Text := '';
    LetterOfCladding.TextPrompt := 'Б..';
  End;
  if (WeldingType.Items[WeldingType.ItemIndex] = 'Шарик') then
  Begin
    CladdingNumber.Enabled := False;
    CladdingNumber.Text := '';
  End;
  if (WeldingType.Items[WeldingType.ItemIndex] = 'Шов') then
  Begin
    CladdingNumber.Enabled := True;
  End;
  if (WeldingType.Items[WeldingType.ItemIndex] = 'Торец') then
  Begin
    CladdingNumber.Enabled := False;
    CladdingNumber.Text := '';
    LetterOfCladding.TextPrompt := 'В..';
  End;
  if (WeldingType.Items[WeldingType.ItemIndex] = 'КН') then
  Begin
    CladdingNumber.Enabled := False;
    CladdingNumber.Text := '';
  End;
  if (WeldingType.Items[WeldingType.ItemIndex] = 'Другое') then
  Begin
    CladdingNumber.Enabled := True;
  End;
  { case WeldingType.ItemIndex of
    0:
    CladdingNumber.Enabled := True;
    1:
    CladdingNumber.Enabled := True;
    2:
    Begin
    CladdingNumber.Enabled := False;
    CladdingNumber.Text := '';
    End;
    3:
    Begin
    CladdingNumber.Enabled := False;
    CladdingNumber.Text := '';
    End;
    4:
    Begin
    CladdingNumber.Enabled := False;
    CladdingNumber.Text := '';
    End;
    5:
    CladdingNumber.Enabled := True;
    end; }

  Info.Lines.Clear;
  if (WeldingType.Items[WeldingType.ItemIndex] = 'Пятак') or
    (WeldingType.Items[WeldingType.ItemIndex] = 'Торец') then
  Begin
    if TransitionLayer.IsChecked then
    Begin
      Info.Lines.Add('Св-10Х16Н25АМ6');
      Info.Lines.Add('Предварительный подогрев t°=100-250');
    End;
    If (WeldingType.Items[WeldingType.ItemIndex] = 'Пятак') then
    Begin
      Info.Lines.Add('Ø205-215 ℓ13');
      Info.Lines.Add('Ø135-145 ℓ13');
      Info.Lines.Add('Ø145-155 ℓ13');
    End;
  End;
  if WeldingType.Items[WeldingType.ItemIndex] = 'Отверстие' then
  Begin
    if TransitionLayer.IsChecked then
    Begin
    End
    else
    Begin
      Info.Lines.Add('Св-08Х19Н10Г2Б или Св-04Х20Н10Г2Б');
      Info.Lines.Add('макс. Т°=100');
      Info.Lines.Add('с Ø61 до Ø34');
      Info.Lines.Add('с Ø61 до Ø31');
    End;

  End;

end;

procedure TfWeldingOffline.Calendar1Change(Sender: TObject);
begin
  HighlightDatesOnCalendar();
  // Снимаем выделение элемента
  TreeView.Selected := nil; // ShowMessage('')
end;

procedure TfWeldingOffline.Calendar1DateSelected(Sender: TObject);
var
  i: Integer;
begin
  // ReadDate - Защита от бага в календаре
  // Если начали заполнения отчёта то пропускаем баг с переходом на другой месяц
  if not ReadDate then
  Begin
    ReadDate := True;
    FindRecordsDateInSQLiteDB(Calendar1.Date,
    // FormatDateTime('yyyy-mm-dd',Calendar1.Date )
    TreeView);
    StatusSearch.Text := 'Выбрана дата: ' + DateToStr(Calendar1.Date);
    AniIndicator.Visible := True;
    AniIndicator.Enabled := True;
    ProgressBar.Visible := True;
    ProgressBar.Max := TreeView.Count - 1;

    TreeView.BeginUpdate;

    for i := 0 to TreeView.Count - 1 do
    Begin
      TreeView.Items[i].ExpandAll;
      ProgressBar.Value := i;
      if (i mod 100 = 0) then
        Application.ProcessMessages;
    End;

    TreeView.EndUpdate;
    ProgressBar.Visible := False;
    AniIndicator.Visible := False;
    AniIndicator.Enabled := False;
    // Calendar1DayClick (nil);
    ReadDate := False;
  End;
end;

procedure TfWeldingOffline.CladdingNumberClick(Sender: TObject);
begin
  if AutoSelectAll.IsChecked then
    CladdingNumber.SelectAll;
end;

{$IF Defined(ANDROID)}

procedure TfWeldingOffline.RestorePosition;
begin

  VertScrollBox.ViewportPosition := PointF(VertScrollBox.ViewportPosition.X, 0);
  Layout.Align := TAlignLayout.Client;
  VertScrollBox.RealignContent;
end;

procedure TfWeldingOffline.UpdateKBBounds;
var
  LFocused: TControl;
  LFocusRect: TRectF;
begin
  FNeedOffset := False;
  if Assigned(Focused) then
  begin
    LFocused := TControl(Focused.GetObject);
    LFocusRect := LFocused.AbsoluteRect;
    LFocusRect.Offset(VertScrollBox.ViewportPosition);
    if (LFocusRect.IntersectsWith(TRectF.Create(FKBBounds))) and
      (LFocusRect.Bottom > FKBBounds.Top) then
    begin
      FNeedOffset := True;
      Layout.Align := TAlignLayout.Horizontal;
      VertScrollBox.RealignContent;
      Application.ProcessMessages;
      VertScrollBox.ViewportPosition := PointF(VertScrollBox.ViewportPosition.X,
        LFocusRect.Bottom - FKBBounds.Top);
    end;
  end;
  if not FNeedOffset then
    RestorePosition;
end;

procedure TfWeldingOffline.CalcContentBoundsProc(Sender: TObject;
var ContentBounds: TRectF);
begin
  if FNeedOffset and (FKBBounds.Top > 0) then
  begin
    ContentBounds.Bottom := Max(ContentBounds.Bottom,
      2 * ClientHeight - FKBBounds.Top);
  end;
end;
{$ENDIF}

end.
