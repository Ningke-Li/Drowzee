:- include('database.pl').
better_call_saul(Start,End) :- begin('better_call_saul',_,_,Start), end('better_call_saul',_,_,End), Start=<End.

ev_1952_formula_one_season(Start,End) :- begin('ev_1952_formula_one_season',_,_,Start), end('ev_1952_formula_one_season',_,_,End), Start=<End.

generate_facts_better_call_saul_OR_ev_1952_formula_one_season([]) :- assert(better_call_saul_OR_ev_1952_formula_one_season(-1,-1)).

generate_facts_better_call_saul_OR_ev_1952_formula_one_season([(Start,End) | Tail]) :- assert(better_call_saul_OR_ev_1952_formula_one_season(Start,End)), generate_facts_better_call_saul_OR_ev_1952_formula_one_season(Tail).

better_call_saul_OR_ev_1952_formula_one_season_aux() :- findall((Start,End),better_call_saul(Start,End),Interval1), findall((Start,End),ev_1952_formula_one_season(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_better_call_saul_OR_ev_1952_formula_one_season(Interval).

better_call_saul_OR_ev_1952_formula_one_season_at_1964(Res) :- setof((Start,End),better_call_saul_OR_ev_1952_formula_one_season(Start,End),AllINtervals), checkvalidity(1964,AllINtervals,Res).

check_query() :- write('Query = better_call_saul_OR_ev_1952_formula_one_season_at_1964'), (better_call_saul_OR_ev_1952_formula_one_season_at_1964(true) -> write('\nRes   = true');write('\nRes   = false')).
?- better_call_saul_OR_ev_1952_formula_one_season_aux().

