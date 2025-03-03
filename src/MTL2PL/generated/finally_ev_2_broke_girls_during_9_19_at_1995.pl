:- include('database.pl').
ev_2_broke_girls(Start,End) :- begin('ev_2_broke_girls',_,_,Start), end('ev_2_broke_girls',_,_,End), Start=<End.

finally_ev_2_broke_girls_during_9_19(Start,End) :- ev_2_broke_girls(Start1,End1), (Start1-19)=<(End1-9), Start is (Start1-19), End is (End1-9), Start=<End.

finally_ev_2_broke_girls_during_9_19_at_1995(Res) :- setof((Start,End),finally_ev_2_broke_girls_during_9_19(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2_broke_girls_during_9_19_at_1995'), (finally_ev_2_broke_girls_during_9_19_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

