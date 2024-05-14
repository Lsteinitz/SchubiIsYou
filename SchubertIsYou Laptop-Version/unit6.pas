unit Unit6;

{$mode objfpc}{$H+}

interface
type koordinaten=record
           x1,y1,feld,posi,bild,s:integer;
           end;

type spielfeld=array[1..200] of koordinaten;


 procedure regeln(var x,y:integer; var sf:spielfeld);
 procedure bewegung(r: integer; var sf:spielfeld);
 procedure pruefung(var sf:spielfeld);
 procedure pruefungende(var sf:spielfeld);
 procedure bewegungen(a,b,z:integer; var i,r: integer; var sf:spielfeld);

 public;
//irrelevant, auslagern geht nicht
implementation
uses {unit7,}graphics;
var q,p,r,g,h,k,l,n,m,o: integer;

procedure regeln(var x,y:integer; var sf:spielfeld);
var i:integer;
begin
  for i:=1 to 160 do begin
    if sf[i].feld=x then begin
    sf[i].s:=y;
  end;
  end;
end;

procedure pruefung (var sf:spielfeld)  ;
var i,x,dr,vi,fu:integer;
begin
  dr:=3; vi:=4; fu:=5;
  for i:=1 to 160 do begin
  if sf[i].posi=2 then begin
   x:=sf[i-1].feld + sf[i+1].feld;
    case x of
     98:regeln(l,dr,sf);
     128:regeln(n,dr,sf);
     118:regeln(k,dr,sf);
     104:regeln(l,vi,sf);
     134:regeln(n,vi,sf);
     124:regeln(k,vi,sf);
     103:regeln(l,fu,sf);
     133:regeln(n,fu,sf);
     123:regeln(k,fu,sf);
end;
end;
end;
end;

procedure pruefungende(var sf:spielfeld);
var i:integer;
begin
   for i:=1 to 160 do begin
    sf[i].s:=1;
   end;
end;

procedure bewegungen(a,b,z:integer; var i,r: integer; var sf:spielfeld);
var f,f2,s,p,s2:integer;
begin

case z of
    0:begin
       s:=sf[i-a].s;
       s2:=sf[i-b].s;
       f:=sf[i-a].feld;
       f2:=sf[i-b].feld;
     //  p2:=sf[i-b].posi;
       p:=sf[i-a].posi;
        if (s=4) then begin {form7.showmessage('Gewonnen');} end;
        if (s=5)or(f=6) then exit;
        if (s=3)or(f=7)or(f=8)or(f=90)or(f=100)or(f=110)or(f=120)or(f=13)or(f=14)  then begin
         if (s2=5)or(f2=6)or(f2=3)then exit;
         if (s2=3)or(f2=7)or(f2=8)or(f2=90)or(f2=100)or(f2=110)or(f2=120)or(f2=13)or(f2=14)then exit;
         sf[i-a].feld:=sf[i].feld;
         sf[i].feld:=1;
         sf[i-b].feld:=f;
         sf[i-a].posi:=sf[i].posi;
         sf[i].posi:=1;
         sf[i-b].posi:=p;
         end
        else begin
        sf[i-a].feld:=sf[i].feld;
        sf[i].feld:=f;
        sf[i-a].posi:=sf[i].posi;
        sf[i].posi:=p;
      end;
      end;

    1:begin
       s:=sf[i+a].s;
       s2:=sf[i+b].s;
       f:=sf[i+a].feld;
       f2:=sf[i+b].feld;
       //p2:=sf[i+b].posi;
       p:=sf[i+a].posi;
        if (s=4) then begin {form7.showmessage('Gewonnen'); }end;
        if (s=5)or(f=6) then exit;
        if (s=3)or(f=7)or(f=8)or(f=90)or(f=100)or(f=110)or(f=120)or(f=13)or(f=14)  then begin
         if (s2=5)or(f2=6)or(f2=3) then exit;
         if (s2=3)or(f2=7)or(f2=8)or(f2=90)or(f2=100)or(f2=110)or(f2=120)or(f2=13)or(f2=14)  then exit;
         sf[i+a].feld:=sf[i].feld;
         sf[i].feld:=1;
         sf[i+b].feld:=f;
         sf[i+a].posi:=sf[i].posi;
         sf[i].posi:=1;
         sf[i+b].posi:=p;
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

procedure bewegung(r: integer; var sf:spielfeld);
var i,s :integer;
begin
   //with form7 do begin

   for i:=1 to 160 do begin
   if (sf[i].feld=4) or (sf[i].feld=15) then break;
   end;

case r of
0:begin  //links
   s:=i mod 16; sf[i].feld:=15;
    if s=1 then begin
     bewegungen(15,14,1,i,r,sf);
     exit;
    end;
    bewegungen(1,2,0,i,r,sf);
  end;

1:begin //hoch
    sf[i].feld:=4;
    if i<17 then begin
     bewegungen(144,128,1,i,r,sf);
     exit;
    end;
    bewegungen(16,32,0,i,r,sf);
  end;

2:begin //rechts
    sf[i].feld:=4;
    s:=i mod 16; //
    if s=0 then begin
     bewegungen(15,14,0,i,r,sf);
     exit;
    end;
    bewegungen(1,2,1,i,r,sf);
  end;

3:begin //runter
    sf[i].feld:=4;
    if i>144 then begin
     bewegungen(144,128,0,i,r,sf);
     exit;
    end;
    bewegungen(16,32,1,i,r,sf); //
  end;
  end;

  //end;
end;




end.

