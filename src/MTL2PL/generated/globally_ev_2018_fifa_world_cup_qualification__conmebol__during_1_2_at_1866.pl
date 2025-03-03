:- include('database.pl').
ev_2018_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2018_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2018_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

globally_ev_2018_fifa_world_cup_qualification__conmebol__during_1_2(Start,End) :- ev_2018_fifa_world_cup_qualification__conmebol_(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_ev_2018_fifa_world_cup_qualification__conmebol__during_1_2_at_1866(Res) :- setof((Start,End),globally_ev_2018_fifa_world_cup_qualification__conmebol__during_1_2(Start,End),AllINtervals), checkvalidity(1866,AllINtervals,Res).

check_query() :- write('Query = globally_ev_2018_fifa_world_cup_qualification__conmebol__during_1_2_at_1866'), (globally_ev_2018_fifa_world_cup_qualification__conmebol__during_1_2_at_1866(true) -> write('\nRes   = true');write('\nRes   = false')).

