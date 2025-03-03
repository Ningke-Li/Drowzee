:- include('database.pl').
latvian_lats(Start,End) :- begin('latvian_lats',_,_,Start), end('latvian_lats',_,_,End), Start=<End.

next_latvian_lats(Start,End) :- latvian_lats(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_latvian_lats_at_1985(Res) :- setof((Start,End),next_latvian_lats(Start,End),AllINtervals), checkvalidity(1985,AllINtervals,Res).

check_query() :- write('Query = next_latvian_lats_at_1985'), (next_latvian_lats_at_1985(true) -> write('\nRes   = true');write('\nRes   = false')).

