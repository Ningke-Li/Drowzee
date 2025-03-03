:- include('database.pl').
ev_2014_fiba_basketball_world_cup(Start,End) :- begin('ev_2014_fiba_basketball_world_cup',_,_,Start), end('ev_2014_fiba_basketball_world_cup',_,_,End), Start=<End.

entourage(Start,End) :- begin('entourage',_,_,Start), end('entourage',_,_,End), Start=<End.

generate_facts_ev_2014_fiba_basketball_world_cup_OR_entourage([]) :- assert(ev_2014_fiba_basketball_world_cup_OR_entourage(-1,-1)).

generate_facts_ev_2014_fiba_basketball_world_cup_OR_entourage([(Start,End) | Tail]) :- assert(ev_2014_fiba_basketball_world_cup_OR_entourage(Start,End)), generate_facts_ev_2014_fiba_basketball_world_cup_OR_entourage(Tail).

ev_2014_fiba_basketball_world_cup_OR_entourage_aux() :- findall((Start,End),ev_2014_fiba_basketball_world_cup(Start,End),Interval1), findall((Start,End),entourage(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_fiba_basketball_world_cup_OR_entourage(Interval).

ev_2014_fiba_basketball_world_cup_OR_entourage_at_1953(Res) :- setof((Start,End),ev_2014_fiba_basketball_world_cup_OR_entourage(Start,End),AllINtervals), checkvalidity(1953,AllINtervals,Res).

check_query() :- write('Query = ev_2014_fiba_basketball_world_cup_OR_entourage_at_1953'), (ev_2014_fiba_basketball_world_cup_OR_entourage_at_1953(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_fiba_basketball_world_cup_OR_entourage_aux().

