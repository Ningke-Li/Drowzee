:- include('database.pl').
ev_2010_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2010_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2010_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

ev_1918_1920_flu_pandemic(Start,End) :- begin('ev_1918_1920_flu_pandemic',_,_,Start), end('ev_1918_1920_flu_pandemic',_,_,End), Start=<End.

generate_facts_ev_2010_fifa_world_cup_qualification__conmebol__OR_ev_1918_1920_flu_pandemic([]) :- assert(ev_2010_fifa_world_cup_qualification__conmebol__OR_ev_1918_1920_flu_pandemic(-1,-1)).

generate_facts_ev_2010_fifa_world_cup_qualification__conmebol__OR_ev_1918_1920_flu_pandemic([(Start,End) | Tail]) :- assert(ev_2010_fifa_world_cup_qualification__conmebol__OR_ev_1918_1920_flu_pandemic(Start,End)), generate_facts_ev_2010_fifa_world_cup_qualification__conmebol__OR_ev_1918_1920_flu_pandemic(Tail).

ev_2010_fifa_world_cup_qualification__conmebol__OR_ev_1918_1920_flu_pandemic_aux() :- findall((Start,End),ev_2010_fifa_world_cup_qualification__conmebol_(Start,End),Interval1), findall((Start,End),ev_1918_1920_flu_pandemic(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_fifa_world_cup_qualification__conmebol__OR_ev_1918_1920_flu_pandemic(Interval).

ev_2010_fifa_world_cup_qualification__conmebol__OR_ev_1918_1920_flu_pandemic_at_2008(Res) :- setof((Start,End),ev_2010_fifa_world_cup_qualification__conmebol__OR_ev_1918_1920_flu_pandemic(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = ev_2010_fifa_world_cup_qualification__conmebol__OR_ev_1918_1920_flu_pandemic_at_2008'), (ev_2010_fifa_world_cup_qualification__conmebol__OR_ev_1918_1920_flu_pandemic_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_fifa_world_cup_qualification__conmebol__OR_ev_1918_1920_flu_pandemic_aux().

