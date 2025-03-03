:- include('database.pl').
ottoman_greece(Start,End) :- begin('ottoman_greece',_,_,Start), end('ottoman_greece',_,_,End), Start=<End.

ev_1954_fifa_world_cup(Start,End) :- begin('ev_1954_fifa_world_cup',_,_,Start), end('ev_1954_fifa_world_cup',_,_,End), Start=<End.

generate_facts_ottoman_greece_OR_ev_1954_fifa_world_cup([]) :- assert(ottoman_greece_OR_ev_1954_fifa_world_cup(-1,-1)).

generate_facts_ottoman_greece_OR_ev_1954_fifa_world_cup([(Start,End) | Tail]) :- assert(ottoman_greece_OR_ev_1954_fifa_world_cup(Start,End)), generate_facts_ottoman_greece_OR_ev_1954_fifa_world_cup(Tail).

ottoman_greece_OR_ev_1954_fifa_world_cup_aux() :- findall((Start,End),ottoman_greece(Start,End),Interval1), findall((Start,End),ev_1954_fifa_world_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ottoman_greece_OR_ev_1954_fifa_world_cup(Interval).

ottoman_greece_OR_ev_1954_fifa_world_cup_at_1361(Res) :- setof((Start,End),ottoman_greece_OR_ev_1954_fifa_world_cup(Start,End),AllINtervals), checkvalidity(1361,AllINtervals,Res).

check_query() :- write('Query = ottoman_greece_OR_ev_1954_fifa_world_cup_at_1361'), (ottoman_greece_OR_ev_1954_fifa_world_cup_at_1361(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ottoman_greece_OR_ev_1954_fifa_world_cup_aux().

