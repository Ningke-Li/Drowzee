:- include('database.pl').
ev_2010s(Start,End) :- begin('ev_2010s',_,_,Start), end('ev_2010s',_,_,End), Start=<End.

globally_ev_2010s_during_2_8(Start,End) :- ev_2010s(Start1,End1), Start is (Start1-2), End is (End1-8), Start=<End.

globally_ev_2010s_during_2_8_at_1893(Res) :- setof((Start,End),globally_ev_2010s_during_2_8(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = globally_ev_2010s_during_2_8_at_1893'), (globally_ev_2010s_during_2_8_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).

