:- include('database.pl').
battle_of_okinawa(Start,End) :- begin('battle_of_okinawa',_,_,Start), end('battle_of_okinawa',_,_,End), Start=<End.

ev_2014_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2014_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2014_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

generate_facts_battle_of_okinawa_OR_ev_2014_fifa_world_cup_qualification__conmebol_([]) :- assert(battle_of_okinawa_OR_ev_2014_fifa_world_cup_qualification__conmebol_(-1,-1)).

generate_facts_battle_of_okinawa_OR_ev_2014_fifa_world_cup_qualification__conmebol_([(Start,End) | Tail]) :- assert(battle_of_okinawa_OR_ev_2014_fifa_world_cup_qualification__conmebol_(Start,End)), generate_facts_battle_of_okinawa_OR_ev_2014_fifa_world_cup_qualification__conmebol_(Tail).

battle_of_okinawa_OR_ev_2014_fifa_world_cup_qualification__conmebol__aux() :- findall((Start,End),battle_of_okinawa(Start,End),Interval1), findall((Start,End),ev_2014_fifa_world_cup_qualification__conmebol_(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_okinawa_OR_ev_2014_fifa_world_cup_qualification__conmebol_(Interval).

battle_of_okinawa_OR_ev_2014_fifa_world_cup_qualification__conmebol__at_1901(Res) :- setof((Start,End),battle_of_okinawa_OR_ev_2014_fifa_world_cup_qualification__conmebol_(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = battle_of_okinawa_OR_ev_2014_fifa_world_cup_qualification__conmebol__at_1901'), (battle_of_okinawa_OR_ev_2014_fifa_world_cup_qualification__conmebol__at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_okinawa_OR_ev_2014_fifa_world_cup_qualification__conmebol__aux().

