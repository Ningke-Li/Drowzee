:- include('database.pl').
band_of_brothers(Start,End) :- begin('band_of_brothers',_,_,Start), end('band_of_brothers',_,_,End), Start=<End.

next_band_of_brothers(Start,End) :- band_of_brothers(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_band_of_brothers_at_1929(Res) :- setof((Start,End),next_band_of_brothers(Start,End),AllINtervals), checkvalidity(1929,AllINtervals,Res).

check_query() :- write('Query = next_band_of_brothers_at_1929'), (next_band_of_brothers_at_1929(true) -> write('\nRes   = true');write('\nRes   = false')).

