program ToolsFronius;

uses
  System.StartUpCopy,
  FMX.Forms,
  uATFronius in 'uATFronius.pas' {fATFronius};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfATFronius, fATFronius);
  Application.Run;
end.
