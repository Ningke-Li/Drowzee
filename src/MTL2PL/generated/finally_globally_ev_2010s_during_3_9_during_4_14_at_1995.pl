:- include('database.pl').
ev_2010s(Start,End) :- begin('ev_2010s',_,_,Start), end('ev_2010s',_,_,End), Start=<End.

globally_ev_2010s_during_3_9(Start,End) :- ev_2010s(Start1,End1), Start is (Start1-3), End is (End1-9), Start=<End.

finally_globally_ev_2010s_during_3_9_during_4_14(Start,End) :- globally_ev_2010s_during_3_9(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

finally_globally_ev_2010s_during_3_9_during_4_14_at_1995(Res) :- setof((Start,End),finally_globally_ev_2010s_during_3_9_during_4_14(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = finally_globally_ev_2010s_during_3_9_during_4_14_at_1995'), (finally_globally_ev_2010s_during_3_9_during_4_14_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

