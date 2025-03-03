:- include('database.pl').
february_2014(Start,End) :- begin('february_2014',_,_,Start), end('february_2014',_,_,End), Start=<End.

ev_2014_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2014_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2014_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

generate_facts_february_2014_OR_ev_2014_fifa_world_cup_qualification__conmebol_([]) :- assert(february_2014_OR_ev_2014_fifa_world_cup_qualification__conmebol_(-1,-1)).

generate_facts_february_2014_OR_ev_2014_fifa_world_cup_qualification__conmebol_([(Start,End) | Tail]) :- assert(february_2014_OR_ev_2014_fifa_world_cup_qualification__conmebol_(Start,End)), generate_facts_february_2014_OR_ev_2014_fifa_world_cup_qualification__conmebol_(Tail).

february_2014_OR_ev_2014_fifa_world_cup_qualification__conmebol__aux() :- findall((Start,End),february_2014(Start,End),Interval1), findall((Start,End),ev_2014_fifa_world_cup_qualification__conmebol_(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_february_2014_OR_ev_2014_fifa_world_cup_qualification__conmebol_(Interval).

february_2014_OR_ev_2014_fifa_world_cup_qualification__conmebol__at_2012(Res) :- setof((Start,End),february_2014_OR_ev_2014_fifa_world_cup_qualification__conmebol_(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = february_2014_OR_ev_2014_fifa_world_cup_qualification__conmebol__at_2012'), (february_2014_OR_ev_2014_fifa_world_cup_qualification__conmebol__at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- february_2014_OR_ev_2014_fifa_world_cup_qualification__conmebol__aux().

