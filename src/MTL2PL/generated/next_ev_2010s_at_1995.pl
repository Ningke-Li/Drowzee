:- include('database.pl').
ev_2010s(Start,End) :- begin('ev_2010s',_,_,Start), end('ev_2010s',_,_,End), Start=<End.

next_ev_2010s(Start,End) :- ev_2010s(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2010s_at_1995(Res) :- setof((Start,End),next_ev_2010s(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = next_ev_2010s_at_1995'), (next_ev_2010s_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

