program Game;

var
  lvl: shortint;
  ran, inp, i, soclose: longint;
  win: boolean;
  cher, lang: char;
  timeto, les, tr, more, eq, rules, losms, losmsq, losend, won, start, lvlset, hardlvl, rng, lasad, tryeis: string;
  leaderboard: text;

procedure maingame(inp, ran, num, soclose: longint; les, tr, hit, more: string);
begin
  writeln(num, tr);
  if abs(ran - num) < soclose then
    soclose := (num);
  if inp > ran then
  begin
    writeln(les);
    exit;
  end;
  if inp < ran then
  begin
    writeln(more);
    exit;
  end;
  if inp = ran then
  begin
    writeln(eq);
    win := true;
    exit;
  end;
end;

begin
  writeln('English language :E');
  writeln('Русский язык :R');
  readln(lang);
  if (lang = 'e') or (lang = 'E') then
  begin
    les := ('Less');
    tr := (' Try.');
    eq := ('Hit!');
    more := ('More');
    rules := ('You have to guess the number that the program came up with.She will tell you more or less.Have fun!50.');
    losms := ('You lost and the number was ');
    losmsq := (' you were close on ');
    losend := (' Wanna play more? Write Y or N');
    won := ('You won, you are lucky. Wanna play more? Write Y or N');
    start := ('Game Started');
    rng := ('Random - ');
    lasad := (' Last try - ');
    tryeis := (' Attempts - ');
    hardlvl := ('Set the complexity of game, God = 6 tries, Expert = 8 tries, Normal = 10 tries, Easy = 12 tries');
    timeto := (' From what try - ');
  end;
  if (lang = 'r') or (lang = 'R') then
  begin
    les := ('Меньше');
    tr := (' попытка');
    eq := ('Попадание!');
    more := ('Больше');
    rules := ('Вы должны угадать число, которое придумала программа.Она будет говорить вам больше или меньше.Приятной игры.');
    losms := ('Вы проиграли, число было ');
    losmsq := (' вы были близки на ');
    losend := (' Хотите поиграть ещё?Напишите Y или N');
    won := ('Вы выиграли, хотите поиграть ещё?Напишите Y или N');    
    start := ('Игра началась!');
    rng := ('Рандом - ');
    lasad := (' Последний выбор - ');
    tryeis := (' Число попыток - ');
    hardlvl := ('Выберите уровень сложности, God = 6 Ходов, Expert = 8 Ходов, Normal = 10 Ходов, Easy = 12 Ходов');
    timeto := (' С какой попытки -');
  end;
  writeln(hardlvl);
  readln(lvlset);
  case lvlset of
    'god', 'God', 'GOD': lvl := (6);
    'expert', 'Expert', 'EXPERT': lvl := (8);
    'Normal', 'normal', 'NORMAL': lvl := (10);
    'easy', 'Easy', 'EASY': lvl := (12)
  else begin
      writeln('Ошибка!Error!Exiting...');
      sleep(3000);
      halt;
    end;
  end;
  writeln(rules);
  cher := ('Y');
  while (cher = 'Y') or (cher = 'y') do
  begin
    win := false;
    ran := random(1000);
    writeln(start);
    for i := 1 to lvl do
    begin
      readln(inp);
      maingame(inp, ran, i, soclose, les, tr, eq, more);
      if win then
      begin
        assign(leaderboard, 'leaderboard.txt');
        append(leaderboard);
        writeln(leaderboard, rng, ran, lasad, inp, tryeis, lvl, timeto, i);
        close(leaderboard);
        writeln(won);
        readln(cher);
        break;
      end;
    end;
    if win = false then
    begin
      assign(leaderboard, 'leaderboard.txt');
      append(leaderboard);
      writeln(leaderboard, rng, ran, lasad, inp, tryeis, lvl);
      Close(leaderboard);
      writeln(losms, ran, losmsq, abs(ran - inp), losend);
      readln(cher);
    end;
  end;
end.

