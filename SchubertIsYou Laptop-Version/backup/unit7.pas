unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus;

type

  { TForm6 }

  TForm6 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public
     var zahl,zahl2: integer;
  end;

var
  Form6: TForm6;

implementation

{$R *.lfm}

type koordinaten=record
           x1,y1,feld,posi,eigenschaft:integer;
           end;
type spielfeld=array[1..160] of koordinaten;
var sf:spielfeld;
var hedge,leaf,flower,zaehler,water,count: integer;   //eigenschaftsinteger

var   leer, schubert,nschubert, hecke, nhecke, blatt, nblatt,
      nis, nyou, blume, nblume, nstop, npush,nwin ,links,hintergrundspiel,
      schubiene,freundin,feuerwerk,hintergrundgross, ende1,ende2,ende3,ende4,
      ende5,ende6,ende7,ende8,ende9,ende10,ende11,ende12,ende13,
      ende14,ende15,danke1,danke2,nis2,nwasser,wasser,ndead: Tbitmap;

{ TForm1 }

procedure TForm6.FormCreate(Sender: TObject);
begin
  hintergrundspiel:= Tbitmap.create;
 hintergrundspiel.LoadfromFile('hintergrund spiel2.bmp');
  nis2:= Tbitmap.create;
 nis2.LoadfromFile('is2.bmp');
  leer:= Tbitmap.create;
 leer.LoadfromFile('erde schön.bmp');
 schubert:= Tbitmap.create;
 schubert.LoadfromFile('Schubert.bmp');
 hecke:= Tbitmap.create;
 hecke.LoadfromFile('Heckchen.bmp');
 blatt:= Tbitmap.create;
 blatt.LoadfromFile('Blattbild.bmp');
 nblatt:= Tbitmap.create;
 nblatt.LoadfromFile('Blatt.bmp');
 nschubert:= Tbitmap.create;
 nschubert.LoadfromFile('2schubert.bmp');
 nhecke:= Tbitmap.create;
 nhecke.LoadfromFile('Hecke.bmp');
 nis:=Tbitmap.create;
 nis.Loadfromfile('is.bmp');
 nyou:=Tbitmap.create;
 nyou.Loadfromfile('you.bmp');
 blume:=Tbitmap.create;
 blume.Loadfromfile('Blumebild.bmp');
 nblume:=Tbitmap.create;
 nblume.Loadfromfile('Blume.bmp');
 nstop:=Tbitmap.create;
 nstop.Loadfromfile('stop.bmp');
 npush:=Tbitmap.create;
 npush.Loadfromfile('push.bmp');
 nwin:= Tbitmap.create;
 nwin.LoadfromFile('win.bmp');
 links:= Tbitmap.create;
 links.LoadfromFile('Schubertlinks.bmp');
 ende1:= Tbitmap.create;
 ende1.LoadfromFile('ende1.bmp');
 ende2:= Tbitmap.create;
 ende2.LoadfromFile('ende2.bmp');
 ende3:= Tbitmap.create;
 ende3.LoadfromFile('ende3.bmp');
 ende4:= Tbitmap.create;
 ende4.LoadfromFile('ende4.bmp');
 ende5:= Tbitmap.create;
 ende5.LoadfromFile('ende5.bmp');
 ende6:= Tbitmap.create;
 ende6.LoadfromFile('ende6.bmp');
 ende7:= Tbitmap.create;
 ende7.LoadfromFile('ende7.bmp');
 ende8:= Tbitmap.create;
 ende8.LoadfromFile('ende8.bmp');
 ende9:= Tbitmap.create;
 ende9.LoadfromFile('ende9.bmp');
 ende10:= Tbitmap.create;
 ende10.LoadfromFile('ende10.bmp');
 ende11:= Tbitmap.create;
 ende11.LoadfromFile('ende11.bmp');
 ende12:= Tbitmap.create;
 ende12.LoadfromFile('ende12.bmp');
 ende13:= Tbitmap.create;
 ende13.LoadfromFile('ende13.bmp');
 ende14:= Tbitmap.create;
 ende14.LoadfromFile('ende14.bmp');
 ende15:= Tbitmap.create;
 ende15.LoadfromFile('ende15.bmp');
 schubiene:= Tbitmap.create;
 schubiene.LoadfromFile('schubiene.bmp');
 freundin:= Tbitmap.create;
 freundin.LoadfromFile('freundin.bmp');
 feuerwerk:= Tbitmap.create;
 feuerwerk.LoadfromFile('feuerwerk.bmp');
 hintergrundgross:= Tbitmap.create;
 hintergrundgross.LoadfromFile('hintergrundgroß.bmp');
 danke1:= Tbitmap.create;
 danke1.LoadfromFile('danke1.bmp');
 danke2:= Tbitmap.create;
 danke2.LoadfromFile('danke2.bmp');
 nwasser:= Tbitmap.create;
 nwasser.LoadfromFile('nwasser.bmp');
 wasser:= Tbitmap.create;
 wasser.LoadfromFile('wasser.bmp');
 ndead:= Tbitmap.create;
 ndead.LoadfromFile('ndead.bmp');

end;

procedure anfang;
var s,i,j:integer;
begin
s:=1;
 for i:=1 to 10 do begin
  for j:=1 to 16 do begin
  sf[s].x1:=j*50;
  sf[s].y1:=i*50;
  sf[s].feld:=1;
  inc(s)
  end;
end;
 count:=0;
 hedge:=2; leaf:=5;  flower:=3; water:=18;

end;

procedure zeichnen; //das entsprechede Level wird gezeichnet
var i,s,j:integer;
begin
case form6.zahl2 of

1:begin
anfang;

 for i:= 1 to 160 do begin
 if sf[i].feld=1
 then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);;
 end;

 for i:=1 to 16 do begin
 sf[i].feld:=hedge;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
 end;
 for i:=33 to 48 do begin
 sf[i].feld:=hedge;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
 end;
 for i:=3 to 9 do begin
 s:=i*16+5;
 sf[s].feld:=hedge;
 form6.image1.picture.bitmap.canvas.draw(sf[s].x1,sf[s].y1,hecke)
 end;

sf[19].feld:=6;
sf[19].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[19].x1,sf[19].y1,nis);
sf[30].feld:=16;
form6.image1.picture.bitmap.canvas.draw(sf[30].x1,sf[30].y1,nis2);
sf[24].feld:=6;
sf[24].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[24].x1,sf[24].y1,nis);
sf[125].feld:=6;
sf[125].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[125].x1,sf[125].y1,nis);

for i:=70 to 71 do begin
sf[i].feld:=leaf;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blatt)
end;
for i:=102 to 103 do begin
sf[i].feld:=leaf;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blatt)
end;

sf[87].feld:=leaf;
form6.image1.picture.bitmap.canvas.draw(sf[87].x1,sf[87].y1,blatt);
sf[99].feld:=4;
form6.image1.picture.bitmap.canvas.draw(sf[99].x1,sf[99].y1,schubert);
sf[86].feld:=3;
form6.image1.picture.bitmap.canvas.draw(sf[86].x1,sf[86].y1,blume);
sf[126].feld:=8;
sf[126].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[126].x1,sf[126].y1,npush);
sf[25].feld:=14;
sf[25].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[25].x1,sf[25].y1,nwin);
sf[23].feld:=120;
sf[23].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[23].x1,sf[23].y1,nblume);
sf[18].feld:=110;
sf[18].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[18].x1,sf[18].y1,nhecke);
sf[20].feld:=13;
sf[20].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,nstop);
sf[31].feld:=7;
form6.image1.picture.bitmap.canvas.draw(sf[31].x1,sf[31].y1,nyou);
sf[124].feld:=90;
sf[124].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[124].x1,sf[124].y1,nblatt);
sf[29].feld:=100;
form6.image1.picture.bitmap.canvas.draw(sf[29].x1,sf[29].y1,nschubert);
end;

2:begin

anfang;

for i:= 1 to 160 do begin
if sf[i].feld=1
then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
end;

s:=1;
for i:=49 to 96 do begin
if (i<=54) or ((i>=59) and (i<=64)) or (i>=87)  then begin
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
end;
end;
i:=6;
 while i<54 do begin
 sf[i].feld:=hedge;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
i:=i+16;
 end;
i:=11;
 while i<59 do begin
 sf[i].feld:=hedge;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
i:=i+16;
 end;                                                   i:=87;
while i<=151 do begin
 sf[i].feld:=hedge;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
i:=i+16;
 end;

sf[19].feld:=16;
form6.image1.picture.bitmap.canvas.draw(sf[19].x1,sf[19].y1,nis2);
sf[83].feld:=6;
sf[83].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[83].x1,sf[83].y1,nis);
sf[158].feld:=6;
sf[158].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[158].x1,sf[158].y1,nis);


sf[24].feld:=leaf;
form6.image1.picture.bitmap.canvas.draw(sf[24].x1,sf[24].y1,blatt);
sf[33].feld:=4;
form6.image1.picture.bitmap.canvas.draw(sf[33].x1,sf[33].y1,schubert);
sf[121].feld:=flower;
form6.image1.picture.bitmap.canvas.draw(sf[121].x1,sf[121].y1,blume);
sf[159].feld:=14;
sf[159].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[159].x1,sf[159].y1,nwin);
sf[13].feld:=120;
sf[13].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[13].x1,sf[13].y1,nblume);
sf[82].feld:=110;
sf[82].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[82].x1,sf[82].y1,nhecke);
sf[84].feld:=13;
sf[84].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[84].x1,sf[84].y1,nstop);
sf[20].feld:=7;
form6.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,nyou);
sf[124].feld:=90;
sf[124].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[124].x1,sf[124].y1,nblatt);
sf[18].feld:=100;
form6.image1.picture.bitmap.canvas.draw(sf[18].x1,sf[18].y1,nschubert);  end;

3:begin

anfang;

for i:= 1 to 160 do begin
if sf[i].feld=1
then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
end;

s:=1;
for i:=81 to 96 do begin
if ((i>=81) and (i<=87)) or (i>=94) then begin
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
end;
end;

for i:=129 to 144 do begin
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
end;
i:= 7;
while i<94 do begin
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
i:= i+16;
end;
i:=14;
while i<=87 do begin
sf[i].feld:=hedge;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
 i:= i+16;
 end;

sf[36].feld:=16;
form6.image1.picture.bitmap.canvas.draw(sf[36].x1,sf[36].y1,nis2);
sf[90].feld:=6;
sf[90].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[90].x1,sf[90].y1,nis);
sf[123].feld:=6;
sf[123].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[123].x1,sf[123].y1,nis);

sf[115].feld:=leaf;
form6.image1.picture.bitmap.canvas.draw(sf[115].x1,sf[115].y1,blatt);
sf[20].feld:=4;
form6.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,schubert);
sf[26].feld:=flower;
form6.image1.picture.bitmap.canvas.draw(sf[26].x1,sf[26].y1,blume);
sf[75].feld:=14;
sf[75].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[75].x1,sf[75].y1,nwin);
sf[102].feld:=120;
sf[102].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[102].x1,sf[102].y1,nblume);
sf[122].feld:=110;
sf[122].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[122].x1,sf[122].y1,nhecke);
sf[124].feld:=13;
sf[124].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[124].x1,sf[124].y1,nstop);
sf[37].feld:=7;
form6.image1.picture.bitmap.canvas.draw(sf[37].x1,sf[37].y1,nyou);
sf[41].feld:=90;
sf[41].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[41].x1,sf[41].y1,nblatt);
sf[35].feld:=100;
form6.image1.picture.bitmap.canvas.draw(sf[35].x1,sf[35].y1,nschubert); end;

4:begin

anfang;

for i:= 1 to 160 do begin
if sf[i].feld=1
then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
end;

s:=1; i:=7;
while i< 160 do begin
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
i:= i+16;
end;  i:=15;
while i< 160 do begin
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
i:= i+16;
end;

sf[19].feld:=16;
form6.image1.picture.bitmap.canvas.draw(sf[19].x1,sf[19].y1,nis2);
sf[45].feld:=6;
sf[45].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[45].x1,sf[45].y1,nis);
sf[83].feld:=6;
sf[83].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[83].x1,sf[83].y1,nis);
sf[116].feld:=6;
sf[116].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[116].x1,sf[116].y1,nis);

sf[25].feld:=leaf;
form6.image1.picture.bitmap.canvas.draw(sf[25].x1,sf[25].y1,blatt);
sf[50].feld:=4;
form6.image1.picture.bitmap.canvas.draw(sf[50].x1,sf[50].y1,schubert);
sf[124].feld:=flower;
form6.image1.picture.bitmap.canvas.draw(sf[124].x1,sf[124].y1,blume);

sf[117].feld:=8;
sf[117].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[117].x1,sf[117].y1,npush);
sf[94].feld:=14;
sf[94].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[94].x1,sf[94].y1,nwin);
sf[43].feld:=120;
sf[43].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[43].x1,sf[43].y1,nblume);
sf[82].feld:=110;
sf[82].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[82].x1,sf[82].y1,nhecke);
sf[84].feld:=13;
sf[84].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[84].x1,sf[84].y1,nstop);
sf[20].feld:=7;
form6.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,nyou);
sf[60].feld:=90;
sf[60].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[60].x1,sf[60].y1,nblatt);
sf[18].feld:=100;
form6.image1.picture.bitmap.canvas.draw(sf[18].x1,sf[18].y1,nschubert); end;

5:begin

anfang;

for i:= 1 to 160 do begin
if sf[i].feld=1
then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
end;

s:=1;
i:=1;
  while  i<153 do begin
  case i of
  89,105,121,137: i:=i+9;
  7,9,11,21,23,
  25,27,29,31,37,
  41,43,47,53,55,
  57,59,61,63,71,
  75,81,87,103,119,135: i:=i+1;
  14,18,49,78,100,131: i:=i+2;
  end;

  sf[i].feld:=leaf;
  form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blatt);
inc(i);
end;

sf[57].feld:=4;
form6.image1.picture.bitmap.canvas.draw(sf[57].x1,sf[57].y1,schubert);
sf[50].feld:=flower;
form6.image1.picture.bitmap.canvas.draw(sf[50].x1,sf[50].y1,blume);

sf[93].feld:=16;
form6.image1.picture.bitmap.canvas.draw(sf[93].x1,sf[93].y1,nis2);

sf[109].posi:=2;
sf[109].feld:=6;
form6.image1.picture.bitmap.canvas.draw(sf[109].x1,sf[109].y1,nis);
sf[141].feld:=6;
sf[141].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[141].x1,sf[141].y1,nis);


sf[126].feld:=8;
sf[126].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[126].x1,sf[126].y1,npush);
sf[112].feld:=14;
sf[112].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[112].x1,sf[112].y1,nwin);
sf[106].feld:=120;
sf[106].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[106].x1,sf[106].y1,nblume);
sf[142].feld:=13;
sf[142].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[142].x1,sf[142].y1,nstop);
sf[140].feld:=90;
sf[140].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[140].x1,sf[140].y1,nblatt);
sf[94].feld:=7;
form6.image1.picture.bitmap.canvas.draw(sf[94].x1,sf[94].y1,nyou);
sf[92].feld:=100;
form6.image1.picture.bitmap.canvas.draw(sf[92].x1,sf[92].y1,nschubert);
 end;

6:begin

anfang;

for i:= 1 to 160 do begin
if sf[i].feld=1
then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
end;
i:=7;
while i<152 do begin
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
i:=i+16;
end;
i:=16;
while i<=160 do begin
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
i:=i+16;
end;
i:=5;
while i<54 do begin
sf[i].feld:=leaf;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blatt);
i:=i+16;
end;
for i:= 9 to 52 do begin
if (i<12) or ((i>40) and (i<44)) or (i>48) or (i=25) or (i=27) then begin
 sf[i].feld:=leaf;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blatt);
end;
end;

sf[19].feld:=16;
form6.image1.picture.bitmap.canvas.draw(sf[19].x1,sf[19].y1,nis2);
sf[83].feld:=6;
sf[83].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[83].x1,sf[83].y1,nis);
sf[147].feld:=6;
sf[147].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[147].x1,sf[147].y1,nis);
sf[109].feld:=6;
sf[109].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[109].x1,sf[109].y1,nis);

sf[35].feld:=4;
form6.image1.picture.bitmap.canvas.draw(sf[35].x1,sf[35].y1,schubert);
sf[26].feld:=flower;
form6.image1.picture.bitmap.canvas.draw(sf[26].x1,sf[26].y1,blume);
sf[91].feld:=14;
sf[91].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[91].x1,sf[91].y1,nwin);
sf[141].feld:=120;
sf[141].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[141].x1,sf[141].y1,nblume);
sf[146].feld:=110;
sf[146].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[146].x1,sf[146].y1,nhecke);
sf[148].feld:=13;
sf[148].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[148].x1,sf[148].y1,nstop);
sf[84].feld:=13;
sf[84].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[84].x1,sf[84].y1,nstop);
sf[20].feld:=7;
form6.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,nyou);
sf[82].feld:=90;
sf[82].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[82].x1,sf[82].y1,nblatt);
sf[18].feld:=100;
form6.image1.picture.bitmap.canvas.draw(sf[18].x1,sf[18].y1,nschubert);
 end;

7:begin

anfang;

for i:= 1 to 160 do begin
if sf[i].feld=1
then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
end;
i:=13;
while i<146 do begin
case i of
17: i:=i+11;
29,40,65,124: i:=i+3;
33,117:i:=i+6 ;
44,59,62,77,82,92,95,98,110,114,130,138,143:i:=i+2;
71:i:=i+5;
87:i:=i+4;
47,53,55,69,80,85,101,108,128:i:=i+1;
end;
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
inc(i);
end;
sf[3].feld:=16;
form6.image1.picture.bitmap.canvas.draw(sf[3].x1,sf[3].y1,nis2);
sf[41].feld:=6;
sf[41].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[41].x1,sf[41].y1,nis);
sf[57].feld:=6;
sf[57].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[57].x1,sf[57].y1,nis);

sf[72].feld:=6;
sf[72].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[72].x1,sf[72].y1,nis);
i:=128;
while i<159 do begin
sf[i].feld:=leaf;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blatt);
i:= i+15;
end;
sf[25].feld:=4;
form6.image1.picture.bitmap.canvas.draw(sf[25].x1,sf[25].y1,schubert);
sf[160].feld:=flower;
form6.image1.picture.bitmap.canvas.draw(sf[160].x1,sf[160].y1,blume);
sf[42].feld:=14;
sf[42].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[42].x1,sf[42].y1,nwin);
sf[40].feld:=120;
sf[40].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[40].x1,sf[40].y1,nblume);
sf[71].feld:=110;
sf[71].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[71].x1,sf[71].y1,nhecke);
sf[73].feld:=13;
sf[73].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[73].x1,sf[73].y1,nstop);
sf[58].feld:=13;
sf[58].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[58].x1,sf[58].y1,nstop);
sf[4].feld:=7;
form6.image1.picture.bitmap.canvas.draw(sf[4].x1,sf[4].y1,nyou);
sf[56].feld:=90;
sf[56].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[56].x1,sf[56].y1,nblatt);
sf[2].feld:=100;
form6.image1.picture.bitmap.canvas.draw(sf[2].x1,sf[2].y1,nschubert);
 end;

8:begin
anfang;
for i:= 1 to 160 do begin
if sf[i].feld=1
then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
end;
i:=5;
while i<150 do begin
sf[i].feld:=leaf;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blatt);
 i:=i+16;
end;
i:=15;
while i<160 do begin
sf[i].feld:=water;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,wasser);
i:=i+16;
end;
i:=8;
while i<158 do begin
case i of
9,25,41,121,137,153:i:= i+4;
14,30,46,110,126,142:i:=i+10;
58,106:i:=i+1;
62:i:=i+42;
end;
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
inc(i);
end;
i:=58;
while i<107 do begin
if i<>90 then begin
 sf[i].feld:=leaf;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blatt); end;
 i:=i+16;
end;
i:=82;
 while i<131 do begin
sf[i].feld:=6;
sf[i].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nis);
i:=i+16;
 end;
 sf[19].feld:=16;
 form6.image1.picture.bitmap.canvas.draw(sf[19].x1,sf[19].y1,nis2);
 sf[50].feld:=4;
 form6.image1.picture.bitmap.canvas.draw(sf[50].x1,sf[50].y1,schubert);
 sf[28].feld:=flower;
 form6.image1.picture.bitmap.canvas.draw(sf[28].x1,sf[28].y1,blume);
 sf[81].feld:=90;
 sf[81].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[81].x1,sf[81].y1,nblatt);
 sf[131].feld:=14;
 sf[131].posi:=3;
 form6.image1.picture.bitmap.canvas.draw(sf[131].x1,sf[131].y1,nwin);
 sf[129].feld:=120;
 sf[129].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[129].x1,sf[129].y1,nblume);
 sf[97].feld:=110;
 sf[97].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[97].x1,sf[97].y1,nhecke);
 sf[99].feld:=13;
 sf[99].posi:=3;
 form6.image1.picture.bitmap.canvas.draw(sf[99].x1,sf[99].y1,nstop);
 sf[115].feld:=17;
 sf[115].posi:=3;
 form6.image1.picture.bitmap.canvas.draw(sf[115].x1,sf[115].y1,ndead);
 sf[20].feld:=7;
 form6.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,nyou);
 sf[113].feld:=130;
 sf[113].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[113].x1,sf[113].y1,nwasser);
 sf[18].feld:=100;
 form6.image1.picture.bitmap.canvas.draw(sf[18].x1,sf[18].y1,nschubert);
sf[83].feld:=8;
sf[83].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[83].x1,sf[83].y1,npush);
 end;

9:begin
anfang;
for i:= 1 to 160 do begin
if sf[i].feld=1
then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
end;
i:=2;
while i<159 do begin
case i of
12,121: i:=i+1;
3,66,142 :i:=i+5;
9,123 :i:=i+2;
14:i:=i+4;
19,35,110:i:=i+10;
30,62,152:i:=i+3;
46,126:i:=i+15;
78:i:=i+26;
147:i:=i+8;
end;
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
inc(i);
end;
i:=4;
while i<160 do begin
case i of
5:i:=i+15;
22,54,70,86,102,118:i:=i+9;
32,48,64,80,96,112:i:=i+4;
44:i:=i+3;
128:i:=i+5;
135:i:=i+8;
144:i:=i+6;
152:i:=i+7;
end;
sf[i].feld:=water;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,wasser);
inc(i);
end;
i:=82;
while i<99 do begin
sf[i].feld:=6;
sf[i].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nis);
i:=i+16;
end;
sf[131].feld:=6;
sf[131].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[131].x1,sf[131].y1,nis);
sf[136].feld:=6;
sf[136].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[136].x1,sf[136].y1,nis);
sf[114].feld:=16;
form6.image1.picture.bitmap.canvas.draw(sf[114].x1,sf[114].y1,nis2);

sf[145].feld:=4;
form6.image1.picture.bitmap.canvas.draw(sf[145].x1,sf[145].y1,schubert);
sf[66].feld:=flower;
form6.image1.picture.bitmap.canvas.draw(sf[66].x1,sf[66].y1,blume);
sf[50].feld:=leaf;
 form6.image1.picture.bitmap.canvas.draw(sf[50].x1,sf[50].y1,blatt);
 sf[67].feld:=leaf;
 form6.image1.picture.bitmap.canvas.draw(sf[67].x1,sf[67].y1,blatt);
sf[83].feld:=14;
sf[83].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[83].x1,sf[83].y1,nwin);
sf[81].feld:=120;
sf[81].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[81].x1,sf[81].y1,nblume);
sf[97].feld:=110;
sf[97].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[97].x1,sf[97].y1,nhecke);
sf[99].feld:=13;
sf[99].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[99].x1,sf[99].y1,nstop);
sf[137].feld:=13;
sf[137].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[137].x1,sf[137].y1,nstop);
sf[135].feld:=90;
sf[135].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[135].x1,sf[135].y1,nblatt);
sf[132].feld:=17;
sf[132].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[132].x1,sf[132].y1,ndead);
sf[115].feld:=7;
form6.image1.picture.bitmap.canvas.draw(sf[115].x1,sf[115].y1,nyou);
sf[130].feld:=130;
sf[130].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[130].x1,sf[130].y1,nwasser);
sf[113].feld:=100;
form6.image1.picture.bitmap.canvas.draw(sf[113].x1,sf[113].y1,nschubert);
end;

10:begin
   anfang;
for i:= 1 to 160 do begin
if sf[i].feld=1
then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
end;
i:=1;
while i<87 do begin
case i of
7,23,39,55,71:i:=i+10;
18,34,50,66:i:=i+4;
end;
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
inc(i);
end;
i:=9;
while i<158 do begin
case i of
10,26,42,58,74,90,125,142:i:=i+15;
113: i:=i+8;
120:i:=i+4;
122,126:i:=i+3;
137:i:=i+4;
end;
sf[i].feld:=water;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,wasser);
inc(i);
end;
i:=45;
while i< 80 do begin
case i of
48,64:i:=i+13;
62: i:=i+1;
end;
sf[i].feld:=leaf;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blatt);
 inc(i);
 end;
i:=123;
while i<156 do begin
sf[i].feld:=6;
sf[i].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nis);
i:=i+32;
end;
sf[62].feld:=6;
sf[62].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[62].x1,sf[62].y1,nis);
sf[51].feld:=6;
sf[51].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[51].x1,sf[51].y1,nis);
sf[19].feld:=16;
form6.image1.picture.bitmap.canvas.draw(sf[19].x1,sf[19].y1,nis2);

sf[35].feld:=4;
form6.image1.picture.bitmap.canvas.draw(sf[35].x1,sf[35].y1,schubert);
sf[34].feld:=flower;
form6.image1.picture.bitmap.canvas.draw(sf[34].x1,sf[34].y1,blume);
sf[154].feld:=90;
sf[154].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[154].x1,sf[154].y1,nblatt);

sf[143].feld:=14;
sf[143].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[143].x1,sf[143].y1,nwin);
sf[101].feld:=120;
sf[101].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[101].x1,sf[101].y1,nblume);
sf[50].feld:=110;
sf[50].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[50].x1,sf[50].y1,nhecke);
sf[52].feld:=13;
sf[52].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[52].x1,sf[52].y1,nstop);
sf[156].feld:=13;
sf[156].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[156].x1,sf[156].y1,nstop);
sf[124].feld:=17;
sf[124].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[124].x1,sf[124].y1,ndead);
sf[20].feld:=7;
form6.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,nyou);
sf[122].feld:=130;
sf[122].posi:=1;
form6.image1.picture.bitmap.canvas.draw(sf[122].x1,sf[122].y1,nwasser);
sf[18].feld:=100;
form6.image1.picture.bitmap.canvas.draw(sf[18].x1,sf[18].y1,nschubert);
end;

11:begin
anfang;
for i:= 1 to 160 do begin
if sf[i].feld=1
then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
end;
 i:=8;
 while i<=160 do begin
 case i of
 9,11,25,27,32,38,41,48,54,57,60,62,64,111,116,123,153,159: i:=i+1;
 13,78,119,132,155:i:=i+3;
 17:i:=i+7;
 43,100,125,145:i:=i+4;
 50,105:i:=i+5;
 66:i:=i+11;
 113,137,150: i:=i+2;
 end;
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
inc(i);
end;
 sf[19].feld:=16;
form6.image1.picture.bitmap.canvas.draw(sf[19].x1,sf[19].y1,nis2);
 i:=51;
 while i<84 do begin
 if i<>35 then begin
 sf[i].feld:=6;
 sf[i].posi:=2;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nis);
 end;
 i:=i+16;
 end;
 i:=2;
while i<145 do begin
case i of
 7:i:=i+14;
 22,38,54,70: i:=i+15;
 97:i:=i+41;
 end;
 sf[i].feld:=water;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,wasser);
 inc(i);
 end;
 sf[114].feld:=4;
 form6.image1.picture.bitmap.canvas.draw(sf[114].x1,sf[114].y1,schubert);
 sf[159].feld:=flower;
 form6.image1.picture.bitmap.canvas.draw(sf[159].x1,sf[159].y1,blume);
 sf[68].feld:=14;
 sf[68].posi:=3;
 form6.image1.picture.bitmap.canvas.draw(sf[68].x1,sf[68].y1,nwin);
 sf[66].feld:=120;
 sf[66].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[66].x1,sf[66].y1,nblume);
 sf[50].feld:=110;
 sf[50].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[50].x1,sf[50].y1,nhecke);
 sf[52].feld:=13;
 sf[52].posi:=3;
 form6.image1.picture.bitmap.canvas.draw(sf[52].x1,sf[52].y1,nstop);
 sf[84].feld:=17;
 sf[84].posi:=3;
 form6.image1.picture.bitmap.canvas.draw(sf[84].x1,sf[84].y1,ndead);
 sf[20].feld:=7;
 form6.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,nyou);
 sf[82].feld:=130;
 sf[82].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[82].x1,sf[82].y1,nwasser);
 sf[18].feld:=100;
 form6.image1.picture.bitmap.canvas.draw(sf[18].x1,sf[18].y1,nschubert);
end;

12:begin
anfang;
for i:= 1 to 160 do begin
if sf[i].feld=1
then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
end;

i:=9;
while i<150 do begin
case i of
17: i:=i+24;
49:i:=i+8;
58,73,88,103:i:=i+14;
118,134:i:=i+15;
end;
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
inc(i);
end;
for i:= 58 to 153 do begin
if (i<62) or ((i>118) and (i<121)) or ((i>133) and (i<137)) or (i>149)then begin
sf[i].feld:=water;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,wasser);
end;
end;
i:=61;
while i<158 do begin
sf[i].feld:=water;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,wasser);
i:=i+16;
end;

for i:=88 to 91 do begin
 sf[i].feld:=5;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blatt);
 end;
i:=64;
while i<=160 do begin
case i of
65,81:i:=i+15;
97,113,129,145:i:=i+10;
92,108,124,140,156:i:=i+4;
end;
 sf[i].feld:=leaf;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blatt);
 inc(i);
 end;

sf[35].feld:=6;
sf[35].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[35].x1,sf[35].y1,nis);
sf[51].feld:=6;
sf[51].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[51].x1,sf[51].y1,nis);
sf[25].feld:=6;
sf[25].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[25].x1,sf[25].y1,nis);
sf[30].feld:=6;
sf[30].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[30].x1,sf[30].y1,nis);

 sf[19].feld:=16;
 form6.image1.picture.bitmap.canvas.draw(sf[19].x1,sf[19].y1,nis2);
 sf[114].feld:=4;
 form6.image1.picture.bitmap.canvas.draw(sf[114].x1,sf[114].y1,schubert);
 sf[134].feld:=flower;
 form6.image1.picture.bitmap.canvas.draw(sf[134].x1,sf[134].y1,blume);
 sf[29].feld:=90;
 sf[29].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[29].x1,sf[29].y1,nblatt);
 sf[52].feld:=14;
 sf[52].posi:=3;
 form6.image1.picture.bitmap.canvas.draw(sf[52].x1,sf[52].y1,nwin);
 sf[50].feld:=120;
 sf[50].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[50].x1,sf[50].y1,nblume);
 sf[34].feld:=110;
 sf[34].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[34].x1,sf[34].y1,nhecke);
 sf[36].feld:=13;
 sf[36].posi:=3;
 form6.image1.picture.bitmap.canvas.draw(sf[36].x1,sf[36].y1,nstop);
 sf[26].feld:=17;
 sf[26].posi:=3;
 form6.image1.picture.bitmap.canvas.draw(sf[26].x1,sf[26].y1,ndead);
 sf[20].feld:=7;
 form6.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,nyou);
 sf[24].feld:=130;
 sf[24].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[24].x1,sf[24].y1,nwasser);
 sf[18].feld:=100;
 form6.image1.picture.bitmap.canvas.draw(sf[18].x1,sf[18].y1,nschubert);
sf[31].feld:=8;
sf[31].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[31].x1,sf[31].y1,npush);
 end;

13:begin
anfang;
for i:= 1 to 160 do begin
if sf[i].feld=1
then form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
end;
i:=54;
while i<145 do begin
case i of
58,65,81,85,97,101,113,117,137:i:=i+3;
89,105,121,129:i:=i+7;
69:i:=i+11;
end;
sf[i].feld:=hedge;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
inc(i);
end;
i:=1;
while i< 154 do begin
sf[i].feld:=water;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,wasser);
if i<145 then i:=i+16  else inc(i);
end;
i:=69;
while i<157 do begin
case i of
71,87,125,141:i:=i+15;
103,119:i:=i+5;
109:i:=i+9;
end;
sf[i].feld:=water;
form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,wasser);
inc(i);
end;
i:=10;
while i<155 do begin
 sf[i].feld:=flower;
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blume);
 i:=i+16;
end;
sf[35].feld:=6;
sf[35].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[35].x1,sf[35].y1,nis);
sf[51].feld:=6;
sf[51].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[51].x1,sf[51].y1,nis);
sf[126].feld:=6;
sf[126].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[126].x1,sf[126].y1,nis);
sf[23].feld:=6;
sf[23].posi:=2;
form6.image1.picture.bitmap.canvas.draw(sf[23].x1,sf[23].y1,nis);
 sf[19].feld:=16;
 form6.image1.picture.bitmap.canvas.draw(sf[19].x1,sf[19].y1,nis2);
 sf[83].feld:=4;
 form6.image1.picture.bitmap.canvas.draw(sf[83].x1,sf[83].y1,schubert);
 sf[94].feld:=flower;
 form6.image1.picture.bitmap.canvas.draw(sf[94].x1,sf[94].y1,blume);
 sf[127].feld:=14;
 sf[127].posi:=3;
 form6.image1.picture.bitmap.canvas.draw(sf[127].x1,sf[127].y1,nwin);
 sf[22].feld:=120;
 sf[22].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[22].x1,sf[22].y1,nblume);
 sf[34].feld:=110;
 sf[34].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[34].x1,sf[34].y1,nhecke);
 sf[36].feld:=13;
 sf[36].posi:=3;
 form6.image1.picture.bitmap.canvas.draw(sf[36].x1,sf[36].y1,nstop);
 sf[52].feld:=17;
 sf[52].posi:=3;
 form6.image1.picture.bitmap.canvas.draw(sf[52].x1,sf[52].y1,ndead);
 sf[20].feld:=7;
 form6.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,nyou);
 sf[50].feld:=130;
 sf[50].posi:=1;
 form6.image1.picture.bitmap.canvas.draw(sf[50].x1,sf[50].y1,nwasser);
 sf[18].feld:=100;
 form6.image1.picture.bitmap.canvas.draw(sf[18].x1,sf[18].y1,nschubert);
sf[24].feld:=8;
sf[24].posi:=3;
form6.image1.picture.bitmap.canvas.draw(sf[24].x1,sf[24].y1,npush); end;

14:begin
anfang;
 for i:= 1 to 160 do begin
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);;
  end;
 for i:=1 to 16 do begin
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
 end;
 for i:=145 to 160 do begin
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
 end;
 for i:=55 to 58 do begin
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
 end;
 for i:=119 to 122 do begin
 form6.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
 end;
 for i:=3 to 7 do begin
 s:=i*16+10;
 form6.image1.picture.bitmap.canvas.draw(sf[s].x1,sf[s].y1,hecke)
 end;

 form6.image1.picture.bitmap.canvas.draw(sf[88].x1,sf[88].y1,blume);
 form6.image1.picture.bitmap.canvas.draw(sf[71].x1,sf[71].y1,freundin);

zaehler:=0;
   form6.timer1.interval:=1000;
   form6.timer1.Enabled:=true;

  if zaehler=29 then  form6.timer1.Enabled:=false;
end;
end;
end;

procedure regeln(var figur,neueEigenschaft:integer);
var i:integer;
begin
  for i:=1 to 160 do begin
    if sf[i].feld=figur then begin
    sf[i].eigenschaft:=neueEigenschaft;
  end;
  end;
end;

procedure pruefung;
var i,x,push,win,stop,dead:integer;
begin
  push:=3; win:=4; stop:=5;dead:=2;
  for i:=1 to 160 do begin
  if sf[i].posi=2 then begin        // mitte von Anweisung = is
  if (sf[i-1].posi=1) and (sf[i+1].posi=3) then begin   // vollständige anweisung, nur horizontal
   x:=sf[i-1].feld + sf[i+1].feld + sf[i].feld;
    case x of
     104:regeln(leaf,push);
     134:regeln(flower,push);
     124:regeln(hedge,push);
     144:regeln(water,push);
     110:regeln(leaf,win);
     140:regeln(flower,win);
     130:regeln(hedge,win);
     150:regeln(water,win);
     109:regeln(leaf,stop);
     139:regeln(flower,stop);
     129:regeln(hedge,stop);
     149:regeln(water,stop);
     113:regeln(leaf,dead);
     143:regeln(flower,dead);
     133:regeln(hedge,dead);
     153:regeln(water,dead);
end;
end;
end;
end;
end;

procedure pruefungende;
var i:integer;
begin
   for i:=1 to 160 do begin
    sf[i].eigenschaft:=1;  //keine eigenschaft zugewiesen
   end;
end;

procedure wahr(i,a:integer; var x:boolean; var r:integer);
var y:integer;
begin
case r of
    0:begin //links
    y:=(i-a) mod 16;
    if (y=1)  then x:=true; end;
    1:begin if ((i-a)<17) then x:=true; end; //hoch
    2:begin //rechts
    y:=(i+a) mod 16;
    if (y=0) then  x:=true; end;
    3:begin if ((i+a)>144) then x:=true; end; //runter
end;
end;

procedure bewegungen(a,b,c,z:integer; var i,art,r: integer); //hier findet die eigentliche bewegung statt
var f,f2,s,p,s2,s3,f3:integer;
var x:boolean;
begin
x:=false;
case z of
    0:begin  //negative Richtung
       s:=sf[i-a].eigenschaft;
       s2:=sf[i-b].eigenschaft;
       s3:=sf[i+c].eigenschaft;
       f:=sf[i-a].feld;
       f2:=sf[i-b].feld;
       f3:=sf[i+c].feld;
       p:=sf[i-a].posi;     //die feldart(feld) und die eigenschaften(s) werden gesichert

        if (s=4) then begin if form6.zahl=form6.zahl2 then form6.zahl:=form6.zahl+1; showmessage('Gewonnen'); form6.image5.Visible:=true; form6.close; end;  //bei erreichen eig=gewinn=meldung
        if (s=5)or(f=7)or(f=100)or(f=16) then exit;
        if (s=2) then begin showmessage('Ups...du bist gestorben. Versuch es einfach nochmal!'); sf[i].feld:=1; zeichnen; exit; end;
        if (s=3)or(f=17)or(f=130)or(f=8)or(f=6)or(f=90)or(f=110)or(f=120)or(f=13)or(f=14)  then begin //eig=schieben wird abgearbeitet
         if (s2=5)or(f2=6)or(f2=7)or(f2=100)or(f2=16)then exit;  // zwei schiebbare felder hintereinande=stopp
         if (s2=3)or(f2=8)or(f2=90)or(f2=110)or(f2=120)or(f2=13)or(f2=14)or(f2=16)then exit;
         if (s2=2) then begin sf[i-a].feld:=sf[i].feld; sf[i].feld:=1; exit; end;
                                                                                       //falls sich im nächsten feld nicht befindet werden die felder einfach vertauscht


         wahr(i,a,x,r); //prüfung ob schiebbares Obejekt am rand steht
         if (x=true) and (art=0) then begin //art ist die überprüfung ob figur am rand steht, wenn ja darf diese prozedur NICHT durchlaufen werden
          if (s3=3)or(f3=8)or(f3=90)or(f3=110)or(f3=120)or(f3=13)or(f3=14)or(f3=16)
             or(s3=5)or(f3=6)or(f3=3)or(f3=7)or(f3=100)or(f3=16)or(f=17)or(f=130) then exit;
          if (s3=2) then begin sf[i-a].feld:=sf[i].feld; sf[i].feld:=1;exit; end;                                                                            //falls an der entsprechenden stelle am anderen spielfeldrand etwas ist, kann nicht geschoben werden
         sf[i+c].feld:=f;   //falls das zu schiebende objekt am rand steht, wird das objekt mit dem feld auf der anderen getauscht(dass leer ist) und danach die figur mit diesem leeren feld
         f:=sf[i-a].feld;
         sf[i-a].feld:=sf[i].feld;
         sf[i].feld:=f3;
         sf[i+c].posi:=p;
         p:=sf[i-a].posi;
         sf[i-a].posi:=sf[i].posi;
         sf[i].posi:=f3;
         end
         else begin
         sf[i-a].feld:=sf[i].feld;   //falls sich im feld ein objekt befindet wird das objekt mit dem feld davor getauscht(dass zwangsweise leer ist)und dann die figur mit dem leeren feld vor ihm
         sf[i].feld:=f2;
         sf[i-b].feld:=f;
         sf[i-a].posi:=sf[i].posi;
         sf[i].posi:=f2;
         sf[i-b].posi:=p;
         end;
        end
        else begin
        sf[i-a].feld:=sf[i].feld;   //falls sich im nächsten feld nicht befindet werden die felder einfach vertauscht
        sf[i].feld:=f;
        sf[i-a].posi:=sf[i].posi;
        sf[i].posi:=p;
      end;
      end;

    1:begin  //positve Richtung //gleiche prozedur wie oben, nur für entgegengesetzte richtung
       s:=sf[i+a].eigenschaft;
       s2:=sf[i+b].eigenschaft;
       s3:=sf[i-c].eigenschaft;
       f:=sf[i+a].feld;
       f2:=sf[i+b].feld;
       f3:=sf[i-c].feld;
       p:=sf[i+a].posi;

        if (s=4) then begin if form6.zahl=form6.zahl2 then form6.zahl:=form6.zahl+1; showmessage('Gewonnen'); form6.image5.Visible:=true; form6.close; end;
        if (s=5)or(f=7)or(f=100)or(f=16) then exit;
         if (s=2) then begin showmessage('Ups...du bist gestorben. Versuch es einfach nochmal!'); sf[i].feld:=1; zeichnen; exit; end;
        if (s=3)or(f=8)or(f=6)or(f=130)or(f=17)or(f=90)or(f=110)or(f=120)or(f=13)or(f=14)  then begin
         if (s2=5)or(f2=6)or(f2=7)or(f2=100)or(f2=16)or(f2=130)or(f2=17)then exit;
         if (s2=3)or(f2=8)or(f2=90)or(f2=110)or(f2=120)or(f2=13)or(f2=14)or(f2=16)then exit;
          if (s2=2) then begin sf[i+a].feld:=sf[i].feld; sf[i].feld:=1; exit;end;

        wahr(i,a,x,r);
         if (x=true) and (art=0) then begin
          if (s3=3)or(f3=8)or(f3=90)or(f3=110)or(f3=120)or(f3=13)or(f3=14)or(f3=16)
             or(s3=5)or(f3=6)or(f3=3)or(f3=7)or(f3=100)or(f3=16)or(f=17)or(f=130) then exit;
            if (s3=2) then begin sf[i+a].feld:=sf[i].feld; sf[i].feld:=1; exit;end;
         sf[i-c].feld:=f;
         f:=sf[i+a].feld;
         sf[i+a].feld:=sf[i].feld;
         sf[i].feld:=f3;
         sf[i-c].posi:=p;
         p:=sf[i+a].posi;
         sf[i+a].posi:=sf[i].posi;
         sf[i].posi:=f3;
         end
         else begin
         sf[i+a].feld:=sf[i].feld;
         sf[i].feld:=f2;
         sf[i+b].feld:=f;
         sf[i+a].posi:=sf[i].posi;
         sf[i].posi:=f2;
         sf[i+b].posi:=p;
         end;
         end
        else begin
        sf[i+a].feld:=sf[i].feld;
        sf[i].feld:=f;
        sf[i+a].posi:=sf[i].posi;
        sf[i].posi:=p;
      end;
      end;

 end;
end;

procedure bewegung(r: integer);
var i,s,null,eins :integer;
begin
    with form6 do begin

   for i:=1 to 160 do begin
   if (sf[i].feld=4) or (sf[i].feld=15) then break;
   end;

 null:=0; eins:=1;

   case r of
   0:begin  //links
      s:=i mod 16; sf[i].feld:=15;
       if s=1 then begin
        bewegungen(15,14,0,1,i,eins,r);
        exit;
       end;
       bewegungen(1,2,14,0,i,null,r);
     end;

   1:begin //hoch
       sf[i].feld:=4;
       if i<17 then begin
        bewegungen(144,128,0,1,i,eins,r);
        exit;
       end;
       bewegungen(16,32,128,0,i,null,r);
     end;

   2:begin //rechts
       sf[i].feld:=4;
       s:=i mod 16; //
       if s=0 then begin
        bewegungen(15,14,0,0,i,eins,r);
        exit;
       end;
       bewegungen(1,2,14,1,i,null,r);
     end;

   3:begin //runter
       sf[i].feld:=4;
       if i>144 then begin
        bewegungen(144,128,0,0,i,eins,r);
        exit;
       end;
       bewegungen(16,32,128,1,i,null,r);
     end;
     end;

     end;
   end;

procedure TForm6.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState //die richtung wird durch drücken der pfeiltasten festgelegt
  );var r,i: integer;
begin
  inc(count);

  case form6.zahl2 of
  1: begin if count= 40 then showmessage('Tipp: Die Erde ist eine Kugel und Schubert kann Wörter verschieben!');  end;
  2: begin if count= 60 then showmessage('Tipp: Die Erde ist eine Kugel und Wörter können transportiert werden!');  end;
  3: begin if count= 50 then showmessage('Tipp: Die Erde ist eine Kugel und manchmal muss man einen Mittelweg finden!');  end;
  4: begin if count= 35 then showmessage('Tipp: Bevor man eine Wand einreißt, kann man auch mit einem Stein beginnen!');   end;
  5: begin if count= 60 then showmessage('Tipp: Die Welt ist eine Kugel und wir lassen uns von zu vielen Dingen stoppen!');  end;
  6: begin if count= 65 then showmessage('Tipp: Lass dich von niemanden stoppen, aber die Grammatik musst du beachten!'); end;
  7: begin if count= 100 then showmessage('Tipp: Manchmal sind die Wege vorgegeben, doch wo fangen sie an? Auch eine Hecke kann jemanden durchlassen..');  end;
  8: begin if count= 30 then showmessage('Tipp: Wenn andere einem Steine in den Weg legen, kann man sie ganz einfach wegrollen!'); end;
  9: begin if count= 95 then showmessage('Tipp:  Die Welt ist eine Kugel und jedes Labyrinth hat einen Ausgang!');  end;
  10: begin if count= 70 then showmessage('Tipp: Wie war das mit dem Satzbau und der Erde?');  end;
  11: begin if count= 50 then showmessage('Tipp: Nur ein kleines Labyrinth... Bevor man zur Blume kommt, ist man am oberen Rand!'); end;
  12: begin if count= 50 then showmessage('Tipp: Auch Schubert kann das Wasser überqueren!'); end;
  13: begin if count= 70 then showmessage('Tipp:Wenn ich doch ein Blümchen hätt`...');  end;
  end;
  pruefung;
  case key of
  37: r:=0;
  38: r:=1;
  39: r:=2;
  40: r:=3;
  end;

  bewegung(r);
  pruefungende;

  with form6 do begin
  for i:=1 to 161 do begin
    case sf[i].feld of
    1:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
    2:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
    3:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blume);
    4:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,schubert);
    5:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,blatt);
    6:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nis);
    7:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nyou);
    8:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,npush);
    90:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nblatt);
    100:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nschubert);
    110:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nhecke);
    120:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nblume);
    13:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nstop);
    14:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nwin);
    15:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,links);
    130:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nwasser);
    17:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,ndead);
    18:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,wasser);
    end;

end;
end;
end;

procedure TForm6.Image2Click(Sender: TObject); //Neustartknopf wird erst mit Betätigung des Startknopfes aktiviert, macht im Grunde das gleiche wie der Startknopf
begin

zeichnen;

end;

procedure TForm6.Image4Click(Sender: TObject);  //beendet das Level
begin
  form6.timer1.enabled:=false;
  form6.Close;
  form6.image5.Visible:=true;
end;

procedure TForm6.Image5Click(Sender: TObject);//Startknopf für die einzelnen Level
begin
 image5.Visible:=false;
 image2.visible:=true;
 image1.picture.bitmap.canvas.draw(0,0,hintergrundspiel);
 zeichnen;
  end;

procedure TForm6.Timer1Timer(Sender: TObject);
begin
inc(zaehler);

 case zaehler of

 1: begin timer1.interval:= 2000;
 image3.canvas.create;
  form6.image3.picture.bitmap.canvas.draw(0,0,ende1);
  end;


 2:begin  timer1.interval:= 1000;
  form6.image3.picture:=nil;
  form6.image1.picture.bitmap.canvas.draw(sf[65].x1,sf[65].y1,schubert);
   end;

 3:begin
  form6.image1.picture.bitmap.canvas.draw(sf[65].x1,sf[65].y1,leer);
  form6.image1.picture.bitmap.canvas.draw(sf[66].x1,sf[66].y1,schubert);
  end;

 4:begin
  form6.image1.picture.bitmap.canvas.draw(sf[66].x1,sf[66].y1,leer);
  form6.image1.picture.bitmap.canvas.draw(sf[67].x1,sf[67].y1,schubert);
  end;

 5:begin
 form6.image1.picture.bitmap.canvas.draw(sf[67].x1,sf[67].y1,leer);
 form6.image1.picture.bitmap.canvas.draw(sf[68].x1,sf[68].y1,schubert);
 end;

 6:begin

 form6.image1.picture.bitmap.canvas.draw(sf[68].x1,sf[68].y1,leer);
 form6.image1.picture.bitmap.canvas.draw(sf[69].x1,sf[69].y1,schubert);
 end;

7:begin  timer1.interval:= 3000;
 image3.canvas.create;
 form6.image3.picture.bitmap.canvas.draw(0,0,ende2);
 end;

8:begin  timer1.interval:= 2000;
 form6.image3.picture.bitmap.canvas.draw(0,0,ende3);
 end;

9:begin        timer1.interval:= 1500;
 form6.image3.picture:=nil;
 form6.image1.picture.bitmap.canvas.draw(sf[69].x1,sf[69].y1,leer);
 form6.image1.picture.bitmap.canvas.draw(sf[70].x1,sf[70].y1,schubert);
 end;

10:begin
 image3.canvas.create;
 form6.image3.picture.bitmap.canvas.draw(0,0,ende4);
 end;

11:begin
 form6.image3.picture:=nil;
 form6.image1.picture.bitmap.canvas.draw(sf[70].x1,sf[70].y1,leer);
 form6.image1.picture.bitmap.canvas.draw(sf[86].x1,sf[86].y1,schubert);
 form6.image1.picture.bitmap.canvas.draw(sf[71].x1,sf[71].y1,leer);
 form6.image1.picture.bitmap.canvas.draw(sf[87].x1,sf[87].y1,freundin);
  end;

12:begin
form6.image1.picture.bitmap.canvas.draw(sf[86].x1,sf[86].y1,leer);
 form6.image1.picture.bitmap.canvas.draw(sf[87].x1,sf[87].y1,schubert);
  end;

13:begin
form6.image1.picture.bitmap.canvas.draw(sf[87].x1,sf[87].y1,leer);
  end;

14:begin   timer1.interval:= 1750;
image3.canvas.create;
 form6.image3.picture.bitmap.canvas.draw(0,0,ende5);
end;

15:begin
 form6.image3.picture.bitmap.canvas.draw(0,0,ende6);
end;

16:begin
 form6.image3.picture.bitmap.canvas.draw(0,0,ende7);
end;

17:begin
 form6.image3.picture.bitmap.canvas.draw(0,0,ende8);
end;

18:begin
 form6.image3.picture.bitmap.canvas.draw(0,0,ende9);
end;

19:begin
 form6.image3.picture.bitmap.canvas.draw(0,0,feuerwerk);
end;

20:begin  timer1.interval:= 2500;
 form6.image3.picture.bitmap.canvas.draw(0,0,ende10);
end;

21:begin
 form6.image3.picture.bitmap.canvas.draw(0,0,ende11);
end;

22:begin
 form6.image3.picture.bitmap.canvas.draw(0,0,ende12);
end;

23:begin
 form6.image3.picture.bitmap.canvas.draw(0,0,ende13);
end;

24:begin
 form6.image3.picture.bitmap.canvas.draw(0,0,ende14);
end;

25:begin
 form6.image3.picture:=nil;
 form6.image1.picture.bitmap.canvas.draw(sf[87].x1,sf[87].y1,schubert);
 form6.image1.picture.bitmap.canvas.draw(sf[104].x1,sf[104].y1,freundin);
end;

26:begin
image3.canvas.create;
 form6.image3.picture.bitmap.canvas.draw(0,0,ende15);
end;

27:begin
 form6.image3.picture:=nil;
 form6.image3.visible:=false;
  form6.image1.picture.bitmap.canvas.draw(sf[103].x1,sf[103].y1,schubiene);
  end;

28:begin
 form6.image1.picture.bitmap.canvas.draw(sf[113].x1,sf[113].y1,danke1);
end;

29:begin
 form6.image1.picture.bitmap.canvas.draw(sf[113].x1,sf[113].y1,danke2);
end;

end;
end;
 end.

