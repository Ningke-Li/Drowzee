:- include('database.pl').
ghost_whisperer(Start,End) :- begin('ghost_whisperer',_,_,Start), end('ghost_whisperer',_,_,End), Start=<End.

globally_ghost_whisperer_during_1_2(Start,End) :- ghost_whisperer(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_ghost_whisperer_during_1_2_at_2004(Res) :- setof((Start,End),globally_ghost_whisperer_during_1_2(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = globally_ghost_whisperer_during_1_2_at_2004'), (globally_ghost_whisperer_during_1_2_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

