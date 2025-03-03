:- include('database.pl').
ev_2012(Start,End) :- begin('ev_2012',_,_,Start), end('ev_2012',_,_,End), Start=<End.

finally_ev_2012_during_2_19(Start,End) :- ev_2012(Start1,End1), (Start1-19)=<(End1-2), Start is (Start1-19), End is (End1-2), Start=<End.

finally_ev_2012_during_2_19_at_1889(Res) :- setof((Start,End),finally_ev_2012_during_2_19(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2012_during_2_19_at_1889'), (finally_ev_2012_during_2_19_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).

