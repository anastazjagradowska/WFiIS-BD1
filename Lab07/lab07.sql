CREATE OR REPLACE FUNCTION rownanie_tables(A INTEGER, B INTEGER, C INTEGER, x0 INTEGER, krok INTEGER, ilosc_rekordow INTEGER)
RETURNS TABLE (i INTEGER,x INTEGER,y INTEGER) AS
$$
BEGIN
  i:=1;
  WHILE i < (1 + ilosc_rekordow) 
  LOOP
    x:= x0 + krok * (i - 1);
    y:= A * POW(x, 2) + B * x + C;
    RETURN NEXT;
    i = i + 1;
  END LOOP;

END; 
$$ 
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION rownanie_1(a INTEGER, b INTEGER, c INTEGER) 
RETURNS text AS 
$$
DECLARE
    delta NUMERIC;
    x NUMERIC;
    x1 NUMERIC;
    x2 NUMERIC;
    im NUMERIC;
BEGIN
    delta := b* b - 4 * a * c;
    RAISE INFO 'DELTA = %', delta;
    IF (delta > 0) THEN
        RAISE INFO 'Rozwiazanie posiada dwa rzeczywiste pierwiastki';
        x1:= (-b+ SQRT(delta)) / (2 * a);
        x2:= (-b- SQRT(delta)) / (2 * a);
        RAISE INFO 'x1 = %', x1;
        RAISE INFO 'x2 = %', x2;
        RETURN '(x1= ' ||CAST(x1 AS VARCHAR) ||'), (x2= '|| CAST(x2 AS VARCHAR) || ')';
    ELSIF (delta = 0) THEN
        RAISE INFO 'Rozwiazanie posiada jeden podwojny pierwiastek rzeczywisty';
        x:= (-b / (2 * a));
	RAISE INFO 'x = %', x;
	RETURN '(x = ' ||CAST(x as VARCHAR)||')';
    ELSIF (delta < 0) THEN
        RAISE INFO 'Rozwiazanie w dziedzinie liczb zespolonych';
        x1:= (-1.0 * b) / (2 * a);
        x2:= (-1.0 * b) / (2 * a);
        im:= SQRT(-delta) / (2 * a);
        RAISE INFO 'x1 = % + %i', x1, im;
        RAISE INFO 'x2 = % - %i', x2, im;
        RETURN '(x1 = ' ||CAST(x1 AS VARCHAR)|| ' + ' ||CAST(im AS VARCHAR)||'i),  x2 = ('||CAST(x2 AS VARCHAR)|| ' - ' ||CAST(im AS VARCHAR)||'i)';
    END IF;
END; 
$$
LANGUAGE plpgsql;