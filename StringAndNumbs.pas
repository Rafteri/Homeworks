program conversions;

var
  a: array of char;
  i, n: integer;

function is_digit(c: char): boolean;
begin
  is_digit := (c <= '9') and (c >= '0');
end;

function char_to_digit(c: char): integer;
begin
  if is_digit(c) then begin
    char_to_digit := integer(c) - integer('0')
  end
  else begin
      char_to_digit := -1;
  end;
end;

function string_to_number(a: array of char; n: integer): integer;
var
  i, x, exp: integer;
begin
  x := 0; 
  exp := 1;
  for i := n - 1 downto 0 do
  begin
    x := x + char_to_digit(a[i]) * exp;
    exp := exp * 10;
  end;
  string_to_number := x;
end;

begin
  readln(n);
  setlength(a, n);
  for i := 0 to n - 1 do 
  begin
    readln(a[i]);
    if not is_digit(a[i]) 
      then
    begin
      writeln(-1); 
      exit; 
    end;
  end;
  writeln(string_to_number(a, n));
end.
