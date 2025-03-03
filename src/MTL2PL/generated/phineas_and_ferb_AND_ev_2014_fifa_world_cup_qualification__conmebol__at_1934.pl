:- include('database.pl').
phineas_and_ferb(Start,End) :- begin('phineas_and_ferb',_,_,Start), end('phineas_and_ferb',_,_,End), Start=<End.

ev_2014_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2014_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2014_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

generate_facts_phineas_and_ferb_AND_ev_2014_fifa_world_cup_qualification__conmebol_([]) :- assert(phineas_and_ferb_AND_ev_2014_fifa_world_cup_qualification__conmebol_(-1,-1)).

generate_facts_phineas_and_ferb_AND_ev_2014_fifa_world_cup_qualification__conmebol_([(Start,End) | Tail]) :- assert(phineas_and_ferb_AND_ev_2014_fifa_world_cup_qualification__conmebol_(Start,End)), generate_facts_phineas_and_ferb_AND_ev_2014_fifa_world_cup_qualification__conmebol_(Tail).

phineas_and_ferb_AND_ev_2014_fifa_world_cup_qualification__conmebol__aux() :- findall((Start,End),phineas_and_ferb(Start,End),Interval1), findall((Start,End),ev_2014_fifa_world_cup_qualification__conmebol_(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_phineas_and_ferb_AND_ev_2014_fifa_world_cup_qualification__conmebol_(Interval).

phineas_and_ferb_AND_ev_2014_fifa_world_cup_qualification__conmebol__at_1934(Res) :- setof((Start,End),phineas_and_ferb_AND_ev_2014_fifa_world_cup_qualification__conmebol_(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = phineas_and_ferb_AND_ev_2014_fifa_world_cup_qualification__conmebol__at_1934'), (phineas_and_ferb_AND_ev_2014_fifa_world_cup_qualification__conmebol__at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).
?- phineas_and_ferb_AND_ev_2014_fifa_world_cup_qualification__conmebol__aux().

