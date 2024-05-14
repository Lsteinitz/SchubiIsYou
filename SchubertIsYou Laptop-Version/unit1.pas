unit unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,unit2,unit3,unit4,unit5,unit7;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
var hintergrundspiela: Tbitmap;
{$R *.lfm}

{ TForm1 }

procedure TForm1.Image2Click(Sender: TObject);
begin
   form6.zahl:=1; form2.show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  hintergrundspiela:= Tbitmap.create;
  hintergrundspiela.LoadfromFile('hintergrund spiel.bmp');
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
    form3.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form3.image4.visible:=true; form3.show;
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
   form4.show;
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
   form5.show;
end;

end.

