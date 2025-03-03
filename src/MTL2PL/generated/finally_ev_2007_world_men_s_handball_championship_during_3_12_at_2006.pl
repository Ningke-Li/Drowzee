:- include('database.pl').
ev_2007_world_men_s_handball_championship(Start,End) :- begin('ev_2007_world_men_s_handball_championship',_,_,Start), end('ev_2007_world_men_s_handball_championship',_,_,End), Start=<End.

finally_ev_2007_world_men_s_handball_championship_during_3_12(Start,End) :- ev_2007_world_men_s_handball_championship(Start1,End1), (Start1-12)=<(End1-3), Start is (Start1-12), End is (End1-3), Start=<End.

finally_ev_2007_world_men_s_handball_championship_during_3_12_at_2006(Res) :- setof((Start,End),finally_ev_2007_world_men_s_handball_championship_during_3_12(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2007_world_men_s_handball_championship_during_3_12_at_2006'), (finally_ev_2007_world_men_s_handball_championship_during_3_12_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

