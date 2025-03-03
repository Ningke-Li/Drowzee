:- include('database.pl').
great_purge(Start,End) :- begin('great_purge',_,_,Start), end('great_purge',_,_,End), Start=<End.

next_great_purge(Start,End) :- great_purge(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_great_purge_at_1931(Res) :- setof((Start,End),next_great_purge(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = next_great_purge_at_1931'), (next_great_purge_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).

