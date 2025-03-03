:- include('database.pl').
ev_2010_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2010_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2010_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

next_ev_2010_fifa_world_cup_qualification__conmebol_(Start,End) :- ev_2010_fifa_world_cup_qualification__conmebol_(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2010_fifa_world_cup_qualification__conmebol__at_1857(Res) :- setof((Start,End),next_ev_2010_fifa_world_cup_qualification__conmebol_(Start,End),AllINtervals), checkvalidity(1857,AllINtervals,Res).

check_query() :- write('Query = next_ev_2010_fifa_world_cup_qualification__conmebol__at_1857'), (next_ev_2010_fifa_world_cup_qualification__conmebol__at_1857(true) -> write('\nRes   = true');write('\nRes   = false')).

