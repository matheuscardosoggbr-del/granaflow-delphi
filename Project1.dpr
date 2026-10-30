program Project1;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {Granaflow};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGranaflow, Granaflow);
  Application.Run;
end.
