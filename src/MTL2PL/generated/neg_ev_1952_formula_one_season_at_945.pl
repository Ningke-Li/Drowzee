:- include('database.pl').
ev_1952_formula_one_season(Start,End) :- begin('ev_1952_formula_one_season',_,_,Start), end('ev_1952_formula_one_season',_,_,End), Start=<End.

compare_ev_1952_formula_one_season(Dir,ev_1952_formula_one_season(Start1,_),ev_1952_formula_one_season(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1952_formula_one_season([]).

generate_neg_ev_1952_formula_one_season([(Start,End) | Tail]) :- assert(neg_ev_1952_formula_one_season(Start,End)), generate_neg_ev_1952_formula_one_season(Tail).

sort_ev_1952_formula_one_season(SortedIntervals) :- findall((Start,End),ev_1952_formula_one_season(Start,End),UnsortedIntervals), predsort(compare_ev_1952_formula_one_season,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1952_formula_one_season_aux() :- sort_ev_1952_formula_one_season(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1952_formula_one_season(NegatedIntervals).

neg_ev_1952_formula_one_season_at_945(Res) :- setof((Start,End),neg_ev_1952_formula_one_season(Start,End),AllINtervals), checkvalidity(945,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1952_formula_one_season_at_945'), (neg_ev_1952_formula_one_season_at_945(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1952_formula_one_season_aux().

