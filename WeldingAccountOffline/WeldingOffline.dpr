program WeldingOffline;

uses
  System.StartUpCopy,
  FMX.Forms,
  uWeldingOffline in 'uWeldingOffline.pas' {fWeldingOffline} ,
  FMX.Calendar.Helpers in 'FMX.Calendar.Helpers.pas',
  FMX.CalendarHolidayDays.Style in 'FMX.CalendarHolidayDays.Style.pas',
  FMX.Calendar.Style in 'FMX.Calendar.Style.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfWeldingOffline, fWeldingOffline);
  Application.Run;

end.
