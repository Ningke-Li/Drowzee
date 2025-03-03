:- include('database.pl').
ev_1400s(Start,End) :- begin('ev_1400s',_,_,Start), end('ev_1400s',_,_,End), Start=<End.

globally_ev_1400s_during_1_6(Start,End) :- ev_1400s(Start1,End1), Start is (Start1-1), End is (End1-6), Start=<End.

globally_ev_1400s_during_1_6_at_1282(Res) :- setof((Start,End),globally_ev_1400s_during_1_6(Start,End),AllINtervals), checkvalidity(1282,AllINtervals,Res).

check_query() :- write('Query = globally_ev_1400s_during_1_6_at_1282'), (globally_ev_1400s_during_1_6_at_1282(true) -> write('\nRes   = true');write('\nRes   = false')).

