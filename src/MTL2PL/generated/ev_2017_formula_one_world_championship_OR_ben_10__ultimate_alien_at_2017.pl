:- include('database.pl').
ev_2017_formula_one_world_championship(Start,End) :- begin('ev_2017_formula_one_world_championship',_,_,Start), end('ev_2017_formula_one_world_championship',_,_,End), Start=<End.

ben_10__ultimate_alien(Start,End) :- begin('ben_10__ultimate_alien',_,_,Start), end('ben_10__ultimate_alien',_,_,End), Start=<End.

generate_facts_ev_2017_formula_one_world_championship_OR_ben_10__ultimate_alien([]) :- assert(ev_2017_formula_one_world_championship_OR_ben_10__ultimate_alien(-1,-1)).

generate_facts_ev_2017_formula_one_world_championship_OR_ben_10__ultimate_alien([(Start,End) | Tail]) :- assert(ev_2017_formula_one_world_championship_OR_ben_10__ultimate_alien(Start,End)), generate_facts_ev_2017_formula_one_world_championship_OR_ben_10__ultimate_alien(Tail).

ev_2017_formula_one_world_championship_OR_ben_10__ultimate_alien_aux() :- findall((Start,End),ev_2017_formula_one_world_championship(Start,End),Interval1), findall((Start,End),ben_10__ultimate_alien(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2017_formula_one_world_championship_OR_ben_10__ultimate_alien(Interval).

ev_2017_formula_one_world_championship_OR_ben_10__ultimate_alien_at_2017(Res) :- setof((Start,End),ev_2017_formula_one_world_championship_OR_ben_10__ultimate_alien(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = ev_2017_formula_one_world_championship_OR_ben_10__ultimate_alien_at_2017'), (ev_2017_formula_one_world_championship_OR_ben_10__ultimate_alien_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2017_formula_one_world_championship_OR_ben_10__ultimate_alien_aux().

