:- include('database.pl').
america_s_next_top_model(Start,End) :- begin('america_s_next_top_model',_,_,Start), end('america_s_next_top_model',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification(Start,End) :- begin('ev_2018_fifa_world_cup_qualification',_,_,Start), end('ev_2018_fifa_world_cup_qualification',_,_,End), Start=<End.

america_s_next_top_model_last_till_3_10(Start,End) :- america_s_next_top_model(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

america_s_next_top_model_until_ev_2018_fifa_world_cup_qualification_during_3_10_overlap(Start,End) :- america_s_next_top_model_last_till_3_10(Start1,End1), ev_2018_fifa_world_cup_qualification(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

america_s_next_top_model_until_ev_2018_fifa_world_cup_qualification_during_3_10(Start,End) :- america_s_next_top_model(W1,_), america_s_next_top_model_until_ev_2018_fifa_world_cup_qualification_during_3_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-3), Start=<End.

america_s_next_top_model_until_ev_2018_fifa_world_cup_qualification_during_3_10_at_2006(Res) :- setof((Start,End),america_s_next_top_model_until_ev_2018_fifa_world_cup_qualification_during_3_10(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = america_s_next_top_model_until_ev_2018_fifa_world_cup_qualification_during_3_10_at_2006'), (america_s_next_top_model_until_ev_2018_fifa_world_cup_qualification_during_3_10_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

