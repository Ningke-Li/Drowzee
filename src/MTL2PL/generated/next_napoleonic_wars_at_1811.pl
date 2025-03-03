:- include('database.pl').
napoleonic_wars(Start,End) :- begin('napoleonic_wars',_,_,Start), end('napoleonic_wars',_,_,End), Start=<End.

next_napoleonic_wars(Start,End) :- napoleonic_wars(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_napoleonic_wars_at_1811(Res) :- setof((Start,End),next_napoleonic_wars(Start,End),AllINtervals), checkvalidity(1811,AllINtervals,Res).

check_query() :- write('Query = next_napoleonic_wars_at_1811'), (next_napoleonic_wars_at_1811(true) -> write('\nRes   = true');write('\nRes   = false')).

