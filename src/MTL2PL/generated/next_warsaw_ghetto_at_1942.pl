:- include('database.pl').
warsaw_ghetto(Start,End) :- begin('warsaw_ghetto',_,_,Start), end('warsaw_ghetto',_,_,End), Start=<End.

next_warsaw_ghetto(Start,End) :- warsaw_ghetto(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_warsaw_ghetto_at_1942(Res) :- setof((Start,End),next_warsaw_ghetto(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = next_warsaw_ghetto_at_1942'), (next_warsaw_ghetto_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).

