:- include('database.pl').
ev_1720s(Start,End) :- begin('ev_1720s',_,_,Start), end('ev_1720s',_,_,End), Start=<End.

globally_ev_1720s_during_7_9(Start,End) :- ev_1720s(Start1,End1), Start is (Start1-7), End is (End1-9), Start=<End.

globally_ev_1720s_during_7_9_at_1716(Res) :- setof((Start,End),globally_ev_1720s_during_7_9(Start,End),AllINtervals), checkvalidity(1716,AllINtervals,Res).

check_query() :- write('Query = globally_ev_1720s_during_7_9_at_1716'), (globally_ev_1720s_during_7_9_at_1716(true) -> write('\nRes   = true');write('\nRes   = false')).

