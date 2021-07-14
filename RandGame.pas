program Game;
var
  ran, inp, i: longint;
  win: boolean;
  cher: char;
procedure maingame(inp, ran, num: longint);
begin
  writeln(num, ' Попытка.');
  if inp > ran then
  begin
    writeln('Меньше');
    exit;
  end;
  if inp < ran then
  begin
    writeln('Больше');
    exit;
  end;
  if inp = ran then
  begin
    writeln('Попадание');
    win := true;
    exit;
  end;
end;

begin
  cher := 'Y';
  while (cher = 'Y') or (cher = 'y') do
  begin
    ran := random(1000);
    writeln('Правила игры: Игра началась');
    for i := 1 to 10 do
    begin
      readln(inp);
      maingame(inp, ran, i);
      if win then
      begin
        writeln('Вы выиграли,Вы везунчик. Хотите сыграть ещё?Напишите Y или N');
        readln(cher);
        break;
      end;
    end;
    if win = false then
    begin
      writeln('Вы проиграли,а число было ', ran, ' Вы были близки на ', abs(ran - inp), ' Хотите сыграть ещё?Напишите Y или N');
      readln (cher);
    end;
  end;
end.
//LeaderBoard (файлом)
//Сложность
//Вы были близки (самое ближнее значение из всех)