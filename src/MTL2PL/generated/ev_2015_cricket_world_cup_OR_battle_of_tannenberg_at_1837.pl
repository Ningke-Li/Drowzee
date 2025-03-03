:- include('database.pl').
ev_2015_cricket_world_cup(Start,End) :- begin('ev_2015_cricket_world_cup',_,_,Start), end('ev_2015_cricket_world_cup',_,_,End), Start=<End.

battle_of_tannenberg(Start,End) :- begin('battle_of_tannenberg',_,_,Start), end('battle_of_tannenberg',_,_,End), Start=<End.

generate_facts_ev_2015_cricket_world_cup_OR_battle_of_tannenberg([]) :- assert(ev_2015_cricket_world_cup_OR_battle_of_tannenberg(-1,-1)).

generate_facts_ev_2015_cricket_world_cup_OR_battle_of_tannenberg([(Start,End) | Tail]) :- assert(ev_2015_cricket_world_cup_OR_battle_of_tannenberg(Start,End)), generate_facts_ev_2015_cricket_world_cup_OR_battle_of_tannenberg(Tail).

ev_2015_cricket_world_cup_OR_battle_of_tannenberg_aux() :- findall((Start,End),ev_2015_cricket_world_cup(Start,End),Interval1), findall((Start,End),battle_of_tannenberg(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2015_cricket_world_cup_OR_battle_of_tannenberg(Interval).

ev_2015_cricket_world_cup_OR_battle_of_tannenberg_at_1837(Res) :- setof((Start,End),ev_2015_cricket_world_cup_OR_battle_of_tannenberg(Start,End),AllINtervals), checkvalidity(1837,AllINtervals,Res).

check_query() :- write('Query = ev_2015_cricket_world_cup_OR_battle_of_tannenberg_at_1837'), (ev_2015_cricket_world_cup_OR_battle_of_tannenberg_at_1837(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2015_cricket_world_cup_OR_battle_of_tannenberg_aux().

