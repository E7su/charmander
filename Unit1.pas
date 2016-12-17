unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure Paint(x1,y1,x2,y2,k:Longint);
  private
    { Private declarations }
  public
   n: integer
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// рекурсивная функция рисования кривой
procedure TForm1.Paint(x1,y1,x2,y2,k:Longint);
  var tx,ty:Longint;
  begin
  if n=1 then
  begin
  PaintBox1.Canvas.Pen.Color:=clGreen;
  end else begin
  PaintBox1.Canvas.Pen.Color:=clGreen;
  end;
   if k=0 then
    begin
     PaintBox1.Canvas.MoveTo(x1,y1);
     PaintBox1.Canvas.LineTo(x2,y2);
     Exit;
    end;
//  формулы вычисления точки, находящейся на середине отрезка и удаленной от прямой на такое расстояние,
//чтобы при соединении точки с концами отрезка с данной точкой
   tx := (x1+x2) div 2 + (y2-y1) div 2;
   ty := (y1+y2) div 2 - (x2-x1) div 2;
// рекурсивный вызов функции, соединяющих концы отрезка с данной точкой
   Paint(x2,y2,tx,ty,k-1);
   Paint(x1,y1,tx,ty,k-1);
  end;

procedure TForm1.Button1Click(Sender: TObject);
Var x1,y1,x2,y2,k: Integer;
begin
 PaintBox1.Width := 1500;
 PaintBox1.Height:= 900;

 PaintBox1.Canvas.Brush.Color := clWhite;
 PaintBox1.Canvas.Rectangle(0,0,PaintBox1.width,PaintBox1.height);

// задаем начальные значения кривой и устанавливаем счетчик


     x1 := 770;
     y1 := 440;           //200
     x2 := 200;
     y2 := 200;           //500
     k  := 24;
     Paint(x1,y1,x2,y2,k);


end;


end.
