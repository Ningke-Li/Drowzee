:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

ev_2014_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2014_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2014_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

generate_facts_samurai_jack_AND_ev_2014_fifa_world_cup_qualification__conmebol_([]) :- assert(samurai_jack_AND_ev_2014_fifa_world_cup_qualification__conmebol_(-1,-1)).

generate_facts_samurai_jack_AND_ev_2014_fifa_world_cup_qualification__conmebol_([(Start,End) | Tail]) :- assert(samurai_jack_AND_ev_2014_fifa_world_cup_qualification__conmebol_(Start,End)), generate_facts_samurai_jack_AND_ev_2014_fifa_world_cup_qualification__conmebol_(Tail).

samurai_jack_AND_ev_2014_fifa_world_cup_qualification__conmebol__aux() :- findall((Start,End),samurai_jack(Start,End),Interval1), findall((Start,End),ev_2014_fifa_world_cup_qualification__conmebol_(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_samurai_jack_AND_ev_2014_fifa_world_cup_qualification__conmebol_(Interval).

samurai_jack_AND_ev_2014_fifa_world_cup_qualification__conmebol__at_2011(Res) :- setof((Start,End),samurai_jack_AND_ev_2014_fifa_world_cup_qualification__conmebol_(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = samurai_jack_AND_ev_2014_fifa_world_cup_qualification__conmebol__at_2011'), (samurai_jack_AND_ev_2014_fifa_world_cup_qualification__conmebol__at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- samurai_jack_AND_ev_2014_fifa_world_cup_qualification__conmebol__aux().

