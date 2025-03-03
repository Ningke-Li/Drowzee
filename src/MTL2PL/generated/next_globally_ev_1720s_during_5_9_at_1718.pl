:- include('database.pl').
ev_1720s(Start,End) :- begin('ev_1720s',_,_,Start), end('ev_1720s',_,_,End), Start=<End.

globally_ev_1720s_during_5_9(Start,End) :- ev_1720s(Start1,End1), Start is (Start1-5), End is (End1-9), Start=<End.

next_globally_ev_1720s_during_5_9(Start,End) :- globally_ev_1720s_during_5_9(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_ev_1720s_during_5_9_at_1718(Res) :- setof((Start,End),next_globally_ev_1720s_during_5_9(Start,End),AllINtervals), checkvalidity(1718,AllINtervals,Res).

check_query() :- write('Query = next_globally_ev_1720s_during_5_9_at_1718'), (next_globally_ev_1720s_during_5_9_at_1718(true) -> write('\nRes   = true');write('\nRes   = false')).

