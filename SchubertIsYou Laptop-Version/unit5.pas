unit unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm5 }

  TForm5 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private

  public

  end;

var
  Form5: TForm5;

implementation

{$R *.lfm}

{ TForm5 }

procedure TForm5.Image2Click(Sender: TObject);
begin
 form5.close;
end;

procedure TForm5.Image3Click(Sender: TObject);
begin
  application.terminate;
end;

end.

