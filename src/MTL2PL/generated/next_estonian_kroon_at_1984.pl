:- include('database.pl').
estonian_kroon(Start,End) :- begin('estonian_kroon',_,_,Start), end('estonian_kroon',_,_,End), Start=<End.

next_estonian_kroon(Start,End) :- estonian_kroon(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_estonian_kroon_at_1984(Res) :- setof((Start,End),next_estonian_kroon(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = next_estonian_kroon_at_1984'), (next_estonian_kroon_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).

