:- include('database.pl').
ev_2004_formula_one_world_championship(Start,End) :- begin('ev_2004_formula_one_world_championship',_,_,Start), end('ev_2004_formula_one_world_championship',_,_,End), Start=<End.

battle_of_the_coral_sea(Start,End) :- begin('battle_of_the_coral_sea',_,_,Start), end('battle_of_the_coral_sea',_,_,End), Start=<End.

generate_facts_ev_2004_formula_one_world_championship_OR_battle_of_the_coral_sea([]) :- assert(ev_2004_formula_one_world_championship_OR_battle_of_the_coral_sea(-1,-1)).

generate_facts_ev_2004_formula_one_world_championship_OR_battle_of_the_coral_sea([(Start,End) | Tail]) :- assert(ev_2004_formula_one_world_championship_OR_battle_of_the_coral_sea(Start,End)), generate_facts_ev_2004_formula_one_world_championship_OR_battle_of_the_coral_sea(Tail).

ev_2004_formula_one_world_championship_OR_battle_of_the_coral_sea_aux() :- findall((Start,End),ev_2004_formula_one_world_championship(Start,End),Interval1), findall((Start,End),battle_of_the_coral_sea(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2004_formula_one_world_championship_OR_battle_of_the_coral_sea(Interval).

ev_2004_formula_one_world_championship_OR_battle_of_the_coral_sea_at_1921(Res) :- setof((Start,End),ev_2004_formula_one_world_championship_OR_battle_of_the_coral_sea(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = ev_2004_formula_one_world_championship_OR_battle_of_the_coral_sea_at_1921'), (ev_2004_formula_one_world_championship_OR_battle_of_the_coral_sea_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2004_formula_one_world_championship_OR_battle_of_the_coral_sea_aux().

