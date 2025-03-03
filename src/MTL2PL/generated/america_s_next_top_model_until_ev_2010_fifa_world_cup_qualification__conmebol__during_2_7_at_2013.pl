:- include('database.pl').
america_s_next_top_model(Start,End) :- begin('america_s_next_top_model',_,_,Start), end('america_s_next_top_model',_,_,End), Start=<End.

ev_2010_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2010_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2010_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

america_s_next_top_model_last_till_2_7(Start,End) :- america_s_next_top_model(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

america_s_next_top_model_until_ev_2010_fifa_world_cup_qualification__conmebol__during_2_7_overlap(Start,End) :- america_s_next_top_model_last_till_2_7(Start1,End1), ev_2010_fifa_world_cup_qualification__conmebol_(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

america_s_next_top_model_until_ev_2010_fifa_world_cup_qualification__conmebol__during_2_7(Start,End) :- america_s_next_top_model(W1,_), america_s_next_top_model_until_ev_2010_fifa_world_cup_qualification__conmebol__during_2_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-2), Start=<End.

america_s_next_top_model_until_ev_2010_fifa_world_cup_qualification__conmebol__during_2_7_at_2013(Res) :- setof((Start,End),america_s_next_top_model_until_ev_2010_fifa_world_cup_qualification__conmebol__during_2_7(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = america_s_next_top_model_until_ev_2010_fifa_world_cup_qualification__conmebol__during_2_7_at_2013'), (america_s_next_top_model_until_ev_2010_fifa_world_cup_qualification__conmebol__during_2_7_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

