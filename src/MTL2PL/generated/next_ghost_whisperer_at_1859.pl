:- include('database.pl').
ghost_whisperer(Start,End) :- begin('ghost_whisperer',_,_,Start), end('ghost_whisperer',_,_,End), Start=<End.

next_ghost_whisperer(Start,End) :- ghost_whisperer(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ghost_whisperer_at_1859(Res) :- setof((Start,End),next_ghost_whisperer(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = next_ghost_whisperer_at_1859'), (next_ghost_whisperer_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).

