:- include('database.pl').
ev_1550s(Start,End) :- begin('ev_1550s',_,_,Start), end('ev_1550s',_,_,End), Start=<End.

globally_ev_1550s_during_1_8(Start,End) :- ev_1550s(Start1,End1), Start is (Start1-1), End is (End1-8), Start=<End.

finally_globally_ev_1550s_during_1_8_during_9_19(Start,End) :- globally_ev_1550s_during_1_8(Start1,End1), (Start1-19)=<(End1-9), Start is (Start1-19), End is (End1-9), Start=<End.

finally_globally_ev_1550s_during_1_8_during_9_19_at_1515(Res) :- setof((Start,End),finally_globally_ev_1550s_during_1_8_during_9_19(Start,End),AllINtervals), checkvalidity(1515,AllINtervals,Res).

check_query() :- write('Query = finally_globally_ev_1550s_during_1_8_during_9_19_at_1515'), (finally_globally_ev_1550s_during_1_8_during_9_19_at_1515(true) -> write('\nRes   = true');write('\nRes   = false')).

