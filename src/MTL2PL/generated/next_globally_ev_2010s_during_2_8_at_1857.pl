:- include('database.pl').
ev_2010s(Start,End) :- begin('ev_2010s',_,_,Start), end('ev_2010s',_,_,End), Start=<End.

globally_ev_2010s_during_2_8(Start,End) :- ev_2010s(Start1,End1), Start is (Start1-2), End is (End1-8), Start=<End.

next_globally_ev_2010s_during_2_8(Start,End) :- globally_ev_2010s_during_2_8(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_ev_2010s_during_2_8_at_1857(Res) :- setof((Start,End),next_globally_ev_2010s_during_2_8(Start,End),AllINtervals), checkvalidity(1857,AllINtervals,Res).

check_query() :- write('Query = next_globally_ev_2010s_during_2_8_at_1857'), (next_globally_ev_2010s_during_2_8_at_1857(true) -> write('\nRes   = true');write('\nRes   = false')).

