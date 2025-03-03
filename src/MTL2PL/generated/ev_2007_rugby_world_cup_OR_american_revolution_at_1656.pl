:- include('database.pl').
ev_2007_rugby_world_cup(Start,End) :- begin('ev_2007_rugby_world_cup',_,_,Start), end('ev_2007_rugby_world_cup',_,_,End), Start=<End.

american_revolution(Start,End) :- begin('american_revolution',_,_,Start), end('american_revolution',_,_,End), Start=<End.

generate_facts_ev_2007_rugby_world_cup_OR_american_revolution([]) :- assert(ev_2007_rugby_world_cup_OR_american_revolution(-1,-1)).

generate_facts_ev_2007_rugby_world_cup_OR_american_revolution([(Start,End) | Tail]) :- assert(ev_2007_rugby_world_cup_OR_american_revolution(Start,End)), generate_facts_ev_2007_rugby_world_cup_OR_american_revolution(Tail).

ev_2007_rugby_world_cup_OR_american_revolution_aux() :- findall((Start,End),ev_2007_rugby_world_cup(Start,End),Interval1), findall((Start,End),american_revolution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2007_rugby_world_cup_OR_american_revolution(Interval).

ev_2007_rugby_world_cup_OR_american_revolution_at_1656(Res) :- setof((Start,End),ev_2007_rugby_world_cup_OR_american_revolution(Start,End),AllINtervals), checkvalidity(1656,AllINtervals,Res).

check_query() :- write('Query = ev_2007_rugby_world_cup_OR_american_revolution_at_1656'), (ev_2007_rugby_world_cup_OR_american_revolution_at_1656(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2007_rugby_world_cup_OR_american_revolution_aux().

