:- include('database.pl').
fiba_eurobasket_2011(Start,End) :- begin('fiba_eurobasket_2011',_,_,Start), end('fiba_eurobasket_2011',_,_,End), Start=<End.

next_fiba_eurobasket_2011(Start,End) :- fiba_eurobasket_2011(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_fiba_eurobasket_2011_at_2010(Res) :- setof((Start,End),next_fiba_eurobasket_2011(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = next_fiba_eurobasket_2011_at_2010'), (next_fiba_eurobasket_2011_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

