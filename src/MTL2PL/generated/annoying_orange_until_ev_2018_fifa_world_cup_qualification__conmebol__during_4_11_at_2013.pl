:- include('database.pl').
annoying_orange(Start,End) :- begin('annoying_orange',_,_,Start), end('annoying_orange',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2018_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2018_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

annoying_orange_last_till_4_11(Start,End) :- annoying_orange(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

annoying_orange_until_ev_2018_fifa_world_cup_qualification__conmebol__during_4_11_overlap(Start,End) :- annoying_orange_last_till_4_11(Start1,End1), ev_2018_fifa_world_cup_qualification__conmebol_(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

annoying_orange_until_ev_2018_fifa_world_cup_qualification__conmebol__during_4_11(Start,End) :- annoying_orange(W1,_), annoying_orange_until_ev_2018_fifa_world_cup_qualification__conmebol__during_4_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-4), Start=<End.

annoying_orange_until_ev_2018_fifa_world_cup_qualification__conmebol__during_4_11_at_2013(Res) :- setof((Start,End),annoying_orange_until_ev_2018_fifa_world_cup_qualification__conmebol__during_4_11(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = annoying_orange_until_ev_2018_fifa_world_cup_qualification__conmebol__during_4_11_at_2013'), (annoying_orange_until_ev_2018_fifa_world_cup_qualification__conmebol__during_4_11_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

