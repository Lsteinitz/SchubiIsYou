unit unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  unit7;

type

  { TForm2 }

  TForm2 = class(TForm)
    Image1: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
  private

  public


  end;

var
  Form2: TForm2;


implementation
{$R *.lfm}

{ TForm2 }
var hintergrundspiela: Tbitmap;

procedure TForm2.Image16Click(Sender: TObject);
begin
form2.close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 hintergrundspiela:= Tbitmap.create;
 hintergrundspiela.LoadfromFile('hintergrund spiel.bmp');
end;

procedure TForm2.Image10Click(Sender: TObject);
begin
   form6.zahl2:=9;
   if form6.zahl>=9 then begin form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show; end
  else begin showmessage('Ups, da hat wohl jemand Level 8 vergessen!'); end;
end;



procedure TForm2.Image11Click(Sender: TObject);
begin
  form6.zahl2:=10;
  if form6.zahl>=10 then begin
     form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show;
end else begin showmessage('Ups, da hat wohl jemand Level 9 vergessen!'); end;
end;

procedure TForm2.Image12Click(Sender: TObject);
begin
  form6.zahl2:=11;
   if form6.zahl>=11 then begin
   form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show;
end   else begin showmessage('Ups, da hat wohl jemand Level 10 vergessen!'); end;
end;

procedure TForm2.Image13Click(Sender: TObject);
begin
  form6.zahl2:=12;
  if form6.zahl>=12 then begin
    form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show;
  end else begin showmessage('Ups, da hat wohl jemand Level 11 vergessen!'); end;
end;

procedure TForm2.Image14Click(Sender: TObject);
begin
  form6.zahl2:=13;
 if form6.zahl>=13  then begin
    form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show;
 end   else begin showmessage('Ups, da hat wohl jemand Level 12 vergessen!'); end;
end;

procedure TForm2.Image15Click(Sender: TObject);
begin
  form6.zahl2:=14;
   if form6.zahl>=14 then begin form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show;  end
  else begin showmessage('Ups, da hat wohl jemand Level 13 vergessen!'); end;
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
  form6.zahl2:=1;
  form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela);
  form6.show;
end;

procedure TForm2.Image3Click(Sender: TObject);
begin
  form6.zahl2:=2;
  if form6.zahl>=2 then begin form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show;  end
  else begin showmessage('Ups, da hat wohl jemand Level 1 vergessen!'); end;

end;

procedure TForm2.Image4Click(Sender: TObject);
begin
  form6.zahl2:=3;
  if form6.zahl>=3 then begin form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show;  end
  else begin showmessage('Ups, da hat wohl jemand Level 2 vergessen!'); end;
end;

procedure TForm2.Image5Click(Sender: TObject);
begin
  form6.zahl2:=4;
  if form6.zahl>=4 then begin form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show;    end
  else begin showmessage('Ups, da hat wohl jemand Level 3 vergessen!'); end;
end;

procedure TForm2.Image6Click(Sender: TObject);
begin
  form6.zahl2:=5;
   if form6.zahl>=5 then begin form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show;  end
  else begin showmessage('Ups, da hat wohl jemand Level 4 vergessen!'); end;
end;

procedure TForm2.Image7Click(Sender: TObject);
begin
  form6.zahl2:=6;
   if form6.zahl>=6 then begin form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show;  end
  else begin showmessage('Ups, da hat wohl jemand Level 5 vergessen!'); end;
end;

procedure TForm2.Image8Click(Sender: TObject);
begin
  form6.zahl2:=7;
  if form6.zahl>=7 then begin form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show;  end
  else begin showmessage('Ups, da hat wohl jemand Level 6 vergessen!'); end;
end;

procedure TForm2.Image9Click(Sender: TObject);
begin
  form6.zahl2:=8;
   if form6.zahl>=8 then begin form6.image1.picture.bitmap.canvas.draw(0,0,hintergrundspiela); form6.show;  end
  else begin showmessage('Ups, da hat wohl jemand Level 7 vergessen!'); end;
end;

end.

