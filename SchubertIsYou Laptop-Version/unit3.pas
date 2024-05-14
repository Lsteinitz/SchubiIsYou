unit unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}
type koordinaten=record
           x1,y1,feld,posi,bild,s:integer;
           wahr:boolean;
           end;

type spielfeld=array[1..200] of koordinaten;
var sf:spielfeld;
var k,l,n,o,zaehler: integer;
var x:boolean;
var   leer, schubert,nschubert, hecke, nhecke, blatt, nblatt,
      nis, nyou, blume, nblume, nstop, npush, nwin ,links,hintergrundspiel,nis2,
      tut1, tut2, tut3, tut4, tut5, tut6, tut7, tut8, pfeil,
      nwasser, wasser, ndead,hintergrundspiela: Tbitmap;

{ TForm3 }

procedure zeichnen; //bei levelstart wird das bild gezeichnet, das einzige was sich bei den leveln unterscheidet sind die objektkoordinaten
var i,s,j:integer;
begin
with form3.image1.canvas do begin

 s:=1;
  for i:=1 to 10 do begin
   for j:=1 to 16 do begin
   sf[s].x1:=j*50;
   sf[s].y1:=i*50;
   sf[s].feld:=1;
   inc(s)
   end;
 end;


 for i:= 1 to 160 do begin
 if sf[i].feld=1
 then form3.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
 end;

 sf[25].feld:=6;
 sf[25].posi:=2;
 form3.image1.picture.bitmap.canvas.draw(sf[25].x1,sf[25].y1,nis);

 sf[24].feld:=130;
 sf[24].posi:=1;
 form3.image1.picture.bitmap.canvas.draw(sf[24].x1,sf[24].y1,nwasser);

 sf[26].feld:=17;
 sf[26].posi:=3;
 form3.image1.picture.bitmap.canvas.draw(sf[26].x1,sf[26].y1,ndead);

 for i:=134 to 139 do begin
 sf[i].feld:=18;
 form3.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,wasser);
 end;

 for i:=38 to 43 do begin
 sf[i].feld:=2;
 form3.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
 end;
 for i:=102 to 107 do begin
 sf[i].feld:=2;
 form3.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,hecke);
 end;

sf[19].feld:=16;
form3.image1.picture.bitmap.canvas.draw(sf[19].x1,sf[19].y1,nis2);

sf[30].feld:=6;
sf[30].posi:=2;
form3.image1.picture.bitmap.canvas.draw(sf[30].x1,sf[30].y1,nis);

sf[131].feld:=6;
sf[131].posi:=2;
form3.image1.picture.bitmap.canvas.draw(sf[131].x1,sf[131].y1,nis);

sf[142].feld:=6;
sf[142].posi:=2;
form3.image1.picture.bitmap.canvas.draw(sf[142].x1,sf[142].y1,nis);

s:=1;
for i:=3 to 5 do begin
s:=i*16+8;
sf[s].feld:=5;
form3.image1.picture.bitmap.canvas.draw(sf[s].x1,sf[s].y1,blatt)
end;

sf[70].feld:=4;
form3.image1.picture.bitmap.canvas.draw(sf[70].x1,sf[70].y1,schubert);

sf[74].feld:=3;
form3.image1.picture.bitmap.canvas.draw(sf[74].x1,sf[74].y1,blume);

sf[132].feld:=8;
sf[132].posi:=3;
form3.image1.picture.bitmap.canvas.draw(sf[132].x1,sf[132].y1,npush);

sf[143].feld:=14;
sf[143].posi:=3;
form3.image1.picture.bitmap.canvas.draw(sf[143].x1,sf[143].y1,nwin);

sf[110].feld:=120;
sf[110].posi:=1;
form3.image1.picture.bitmap.canvas.draw(sf[110].x1,sf[110].y1,nblume);

sf[29].feld:=110;
sf[29].posi:=1;
form3.image1.picture.bitmap.canvas.draw(sf[29].x1,sf[29].y1,nhecke);

sf[31].feld:=13;
sf[31].posi:=3;
form3.image1.picture.bitmap.canvas.draw(sf[31].x1,sf[31].y1,nstop);

sf[20].feld:=7;
sf[20].posi:=3;
form3.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,nyou);

sf[130].feld:=90;
sf[130].posi:=1;
form3.image1.picture.bitmap.canvas.draw(sf[130].x1,sf[130].y1,nblatt);

sf[18].feld:=100;
sf[18].posi:=1;
form3.image1.picture.bitmap.canvas.draw(sf[18].x1,sf[18].y1,nschubert);

end;
end;

procedure regeln(var x,y:integer); //hier wird die kennnummer hingegeben
var i:integer;
begin
  for i:=1 to 160 do begin  //legt für alle objekte einer art, die durch die regeln festgelegte eigenschaft fest
    if sf[i].feld=x then begin
    sf[i].s:=y;
  end;
  end;
end;

procedure pruefung; //hier wird überprüft ob die 'if' Bedingung also 1:'objekt' 2:'is' 3:'prädikat' erfüllen
var i,x,dr,vi,fu,zw:integer;
begin
  dr:=3; vi:=4; fu:=5; zw:=2; //weigert sich reine zahlen zu übergeben, mussten als variable festgelegt werden sonst fehlermeldung
  for i:=1 to 160 do begin                              //suche nach den is
  if sf[i].posi=2 then begin                            //falls gefunden
  if (sf[i-1].posi=1) and (sf[i+1].posi=3) then begin   //damit auch die reihenfolge stimmt
   x:=sf[i-1].feld + sf[i+1].feld;                      //werden die nummern der objekte, prädikate addiert, so dass eine spezifische summe entsteht
    case x of  //die wird hier abgefragt
     98:regeln(l,dr); //zahl1(objekt),zahl2(eigenschaft)
     128:regeln(n,dr);
     118:regeln(k,dr);
     138:regeln(o,dr);
     104:regeln(l,vi);
     134:regeln(n,vi);
     124:regeln(k,vi);
     144:regeln(o,vi);
     103:regeln(l,fu);
     133:regeln(n,fu);
     123:regeln(k,fu);
     143:regeln(o,fu);
     107:regeln(l,zw);
     137:regeln(n,zw);
     127:regeln(k,zw);
     147:regeln(o,zw);
     //falls die is bedingung nicht erfüllt ist, entsteht eine zahl für die nichts festgelegt ist, also keine regel tritt in kraft
end;
end;
end;
end;
end;

procedure pruefungende; //setzt alle eigenschaften aller objekte auf eins(keine regel)
var i:integer;
begin
   for i:=1 to 160 do begin
    sf[i].s:=1;
   end;
end;

procedure TForm3.FormCreate(Sender: TObject); //lädt alle bilder in die form
begin
  image1.canvas.create;

 hintergrundspiel:= Tbitmap.create;
 hintergrundspiel.LoadfromFile('hintergrund spiel2.bmp');


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
 nis2:= Tbitmap.create;
 nis2.LoadfromFile('is2.bmp');

 tut1:= Tbitmap.create;
 tut1.LoadfromFile('tut1.bmp');
 tut2:= Tbitmap.create;
 tut2.LoadfromFile('tut2.bmp');
 tut3:= Tbitmap.create;
 tut3.LoadfromFile('tut3.bmp');
 tut4:= Tbitmap.create;
 tut4.LoadfromFile('tut4.bmp');
 tut5:= Tbitmap.create;
 tut5.LoadfromFile('tut5.bmp');
 tut6:= Tbitmap.create;
 tut6.LoadfromFile('tut6.bmp');
 tut7:= Tbitmap.create;
 tut7.LoadfromFile('tut7.bmp');
 tut8:= Tbitmap.create;
 tut8.LoadfromFile('tut8.bmp');
 pfeil:= Tbitmap.create;
 pfeil.LoadfromFile('pfeil.bmp');

 nwasser:= Tbitmap.create;
 nwasser.LoadfromFile('nwasser.bmp');
 wasser:= Tbitmap.create;
 wasser.LoadfromFile('wasser.bmp');
 ndead:= Tbitmap.create;
 ndead.LoadfromFile('ndead.bmp');

  k:=2; l:=5;  n:=3; o:=18;

end;

procedure wahr(i,a:integer; var x:boolean; var r:integer); //test, ob objekt am rand steht
var y:integer;
begin
  x:=false; //muss zwingnderweise zu beginn immer falsch sein
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
       s:=sf[i-a].s;
       s2:=sf[i-b].s;
       s3:=sf[i+c].s;
       f:=sf[i-a].feld;
       f2:=sf[i-b].feld;
       f3:=sf[i+c].feld;
       p:=sf[i-a].posi;     //die feldart(feld) und die eigenschaften(s) werden gesichert

        if (s=4) then begin showmessage('Gewonnen'); end;  //bei erreichen eig=gewinn=meldung
        if (s=5)or(f=7)or(f=100)or(f=16) then exit;
        if (s=2) then begin showmessage('Ups...du bist gestorben. Versuch es einfach nochmal!'); sf[i].feld:=1; zeichnen; exit; end;
        if (s=3)or(f=17)or(f=130)or(f=8)or(f=6)or(f=90)or(f=110)or(f=120)or(f=13)or(f=14)  then begin //eig=schieben wird abgearbeitet

         if (s2=5)or(f2=6)or(f2=3)or(f2=7)or(f2=100)or(f2=16)then exit;  // zwei schiebbare felder hintereinande=stopp
         if (s2=3)or(f2=8)or(f2=90)or(f2=110)or(f2=120)or(f2=13)or(f2=14)or(f2=16)then exit;
         if (s2=2) then begin sf[i-a].feld:=sf[i].feld; sf[i].feld:=1; exit; end; //falls sich im nächsten feld nicht befindet werden die felder einfach vertauscht


         wahr(i,a,x,r); //prüfung ob schiebbares Obejekt am rand steht
         if (x=true) and (art=0) then begin //art ist die überprüfung ob figur am rand steht, wenn ja darf diese prozedur NICHT durchlaufen werden
          if (s3=3)or(f3=8)or(f3=90)or(f3=110)or(f3=120)or(f3=13)or(f3=14)or(f3=16)
             or(s3=5)or(f3=6)or(f3=3)or(f3=7)or(f3=100)or(f3=16)or(f=17)or(f=130) then exit;
          if (s3=2) then begin sf[i-a].feld:=sf[i].feld; sf[i].feld:=1;exit; end; //falls an der entsprechenden stelle am anderen spielfeldrand etwas ist, kann nicht geschoben werden
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
       s:=sf[i+a].s;
       s2:=sf[i+b].s;
       s3:=sf[i-c].s;
       f:=sf[i+a].feld;
       f2:=sf[i+b].feld;
       f3:=sf[i-c].feld;
       p:=sf[i+a].posi;

        if (s=4) then begin showmessage('Gewonnen'); end;
        if (s=5)or(f=7)or(f=100)or(f=16) then exit;
         if (s=2) then begin showmessage('Ups...du bist gestorben. Versuch es einfach nochmal!'); sf[i].feld:=1; zeichnen; exit; end;
        if (s=3)or(f=8)or(f=6)or(f=130)or(f=17)or(f=90)or(f=110)or(f=120)or(f=13)or(f=14)  then begin
         if (s2=5)or(f2=6){or(f2=3)}or(f2=7)or(f2=100)or(f2=16)or(f2=130)or(f2=17)then exit;
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

procedure bewegung(r: integer); //nutzt die Information über die gedrückte richtungstaste und übersetzt es in die Information,wie viele felder und ob in positive oder negative Richtung gezogen werden soll
var i,s,null,eins :integer;
begin
    with form3 do begin

   for i:=1 to 160 do begin   //sucht spielfigur
   if (sf[i].feld=4) or (sf[i].feld=15) then break;//abbruch bei gefundenem standort
   end;

   null:=0; eins:=1;  //ich konnte keine bloßen zahlen übergeben,der wollte unbedingt variablen

case r of
0:begin  //links                      //zahl gibt die gewählte richtung an
   s:=i mod 16; sf[i].feld:=15;       //prüft, ob figur am rand steht
    if s=1 then begin                 //falls ja
     bewegungen(15,14,0,1,i,eins,r);  //springt man an den anderen Rand des bildes
     exit;                            //Zahl1(anzahl der felder bis zum anderen rand),zahl2(anzahl der felder bis zum rand minus 1),
    end;                              //zahl3(in diesem fall irrelevant=0),zahl4(richtung 1=positiv),zahl5(standort),zahl6(in diesem fall irrelevant),zahl7(information über richtung)
    bewegungen(1,2,14,0,i,null,r);    //man bewegt sich ein feld(1) in negative(-)richtung
  end;                                //Zahl1(ein feld wird gezogen),zahl2(ein zu ziehendes feld plus 1),zahl3(damit ein eventuell zu schiebendes objekt, die zu ziehende anzahl der felder kennt)
   // end;                            //zahl4(richtung 0=negativ),zahl5(standort),zahl6(falls ein obejkt geschoben wird, dass am rand steht, darf die prozedur durchlaufen werden,siehe oben)zahl7(information über richtung)
1:begin //hoch     //gleiches verfahren wie oben,nur andere richtungen,bzw andere felderzahl
    sf[i].feld:=4;                    //randprüfverfahren,für alle richtungen unterschiedlich
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

procedure TForm3.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );var r,i: integer;
begin

  timer1.enabled:=false;
  pruefung; //legt regeln für zug fest

  case key of //eine zahl für jede richtung
  37: r:=0;
  38: r:=1;
  39: r:=2;
  40: r:=3;
  end;

  bewegung(r); //gibt information der richtung an die bewegung weiter
  pruefungende; //setzt alle regeln zurück, damit sie zu beginn des nächsten level wieder neu festgelgt werden können

  with form3 do begin
  for i:=1 to 161 do begin //zeichnet für alle felder die entsprechenden bilder in das image
    case sf[i].feld of
    1:form3.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
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
    16:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nis2);
    130:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,nwasser);
    17:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,ndead);
    18:image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,wasser);
    end;

end;
end;
end;

procedure TForm3.Image2Click(Sender: TObject); //beenden
begin
  form3.timer1.enabled:=false;
  form3.close;
end;

procedure TForm3.Image3Click(Sender: TObject); //neustart
begin
  form3.timer1.enabled:=false;
  zeichnen;
end;

procedure TForm3.Image4Click(Sender: TObject);   //startfeld
var s,i,j:integer;
begin
 image4.Visible:=false;   //startfeld weg
 image3.visible:=true;  //neustartfeld da
 image1.picture.bitmap.canvas.draw(0,0,hintergrundspiel);

 zaehler:=0;
 s:=1;
  for i:=1 to 10 do begin
   for j:=1 to 16 do begin
   sf[s].x1:=j*50;
   sf[s].y1:=i*50;
   sf[s].feld:=1;
   inc(s)
   end;
 end;
   timer1.Enabled:=true;

  if zaehler=13 then  timer1.Enabled:=false;

 //zeichnen;

end;

procedure TForm3.Timer1Timer(Sender: TObject);
var i:integer;
begin
inc(zaehler);

  with form3.image1.canvas do begin
 case zaehler of
1: begin
 for i:= 1 to 160 do begin
 form3.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
 end;
 form3.image1.picture.bitmap.canvas.draw(sf[65].x1,sf[65].y1,schubert);
 end;

2:begin
 for i:= 1 to 160 do begin
 form3.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
 end;
 form3.image1.picture.bitmap.canvas.draw(sf[66].x1,sf[66].y1,schubert);
 end;

3:begin
 for i:= 1 to 160 do begin
 form3.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
 end;
 form3.image1.picture.bitmap.canvas.draw(sf[67].x1,sf[67].y1,schubert);
 form3.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,tut1);
 end;

4:begin
 form3.image1.picture.bitmap.canvas.draw(sf[20].x1,sf[20].y1,tut2);
 end;

5:begin
 for i:= 1 to 160 do begin
 form3.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
 end;
 form3.image1.picture.bitmap.canvas.draw(sf[68].x1,sf[68].y1,schubert);
 end;

6:begin
 for i:= 1 to 160 do begin
 form3.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
 end;
 form3.image1.picture.bitmap.canvas.draw(sf[69].x1,sf[69].y1,schubert);
 end;


7:begin
 for i:= 1 to 160 do begin
 form3.image1.picture.bitmap.canvas.draw(sf[i].x1,sf[i].y1,leer);
 end;
 form3.image1.picture.bitmap.canvas.draw(sf[70].x1,sf[70].y1,schubert);
 form3.image1.picture.bitmap.canvas.draw(sf[23].x1,sf[23].y1,tut3);
 end;

8:begin
 form3.image1.picture.bitmap.canvas.draw(sf[23].x1,sf[23].y1,tut4);
 form3.image1.picture.bitmap.canvas.draw(sf[131].x1,sf[131].y1,nis);
 form3.image1.picture.bitmap.canvas.draw(sf[132].x1,sf[132].y1,npush);
 form3.image1.picture.bitmap.canvas.draw(sf[130].x1,sf[130].y1,nblatt);
 form3.image1.picture.bitmap.canvas.draw(sf[133].x1,sf[133].y1,pfeil);
 end;

9:begin
 form3.image1.picture.bitmap.canvas.draw(sf[23].x1,sf[23].y1,tut5);
 end;

10:begin
  form3.image1.picture.bitmap.canvas.draw(sf[23].x1,sf[23].y1,tut6);
  end;

11:begin
  form3.image1.picture.bitmap.canvas.draw(sf[23].x1,sf[23].y1,tut7);
  end;

12:begin
  form3.image1.picture.bitmap.canvas.draw(sf[23].x1,sf[23].y1,tut8);
  end;

13:begin zeichnen;end;

end;

end;end;


//die regeln legen die eigenschaften die jedes objekt hat (bzw. nicht hat) fest (schiebbar,stop oder sieg)
//unit 7 umfasst alle level, dieses ist beispielhaft, aber alle prozeduren laufen wie in unit 7(sind identisch)
//alle erklärungen sind NUR in dieser unit

end.

