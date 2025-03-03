:- include('database.pl').
ko_ciuszko_uprising(Start,End) :- begin('ko_ciuszko_uprising',_,_,Start), end('ko_ciuszko_uprising',_,_,End), Start=<End.

next_ko_ciuszko_uprising(Start,End) :- ko_ciuszko_uprising(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ko_ciuszko_uprising_at_1685(Res) :- setof((Start,End),next_ko_ciuszko_uprising(Start,End),AllINtervals), checkvalidity(1685,AllINtervals,Res).

check_query() :- write('Query = next_ko_ciuszko_uprising_at_1685'), (next_ko_ciuszko_uprising_at_1685(true) -> write('\nRes   = true');write('\nRes   = false')).

