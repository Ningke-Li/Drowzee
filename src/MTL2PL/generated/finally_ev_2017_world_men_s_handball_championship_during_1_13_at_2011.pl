:- include('database.pl').
ev_2017_world_men_s_handball_championship(Start,End) :- begin('ev_2017_world_men_s_handball_championship',_,_,Start), end('ev_2017_world_men_s_handball_championship',_,_,End), Start=<End.

finally_ev_2017_world_men_s_handball_championship_during_1_13(Start,End) :- ev_2017_world_men_s_handball_championship(Start1,End1), (Start1-13)=<(End1-1), Start is (Start1-13), End is (End1-1), Start=<End.

finally_ev_2017_world_men_s_handball_championship_during_1_13_at_2011(Res) :- setof((Start,End),finally_ev_2017_world_men_s_handball_championship_during_1_13(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2017_world_men_s_handball_championship_during_1_13_at_2011'), (finally_ev_2017_world_men_s_handball_championship_during_1_13_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

