:- include('database.pl').
first_wave_feminism(Start,End) :- begin('first_wave_feminism',_,_,Start), end('first_wave_feminism',_,_,End), Start=<End.

compare_first_wave_feminism(Dir,first_wave_feminism(Start1,_),first_wave_feminism(Start2,_)) :- Start1=<Start2.

generate_neg_first_wave_feminism([]).

generate_neg_first_wave_feminism([(Start,End) | Tail]) :- assert(neg_first_wave_feminism(Start,End)), generate_neg_first_wave_feminism(Tail).

sort_first_wave_feminism(SortedIntervals) :- findall((Start,End),first_wave_feminism(Start,End),UnsortedIntervals), predsort(compare_first_wave_feminism,UnsortedIntervals,SortedIntervals).

generate_neg_first_wave_feminism_aux() :- sort_first_wave_feminism(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_first_wave_feminism(NegatedIntervals).

neg_first_wave_feminism_at_895(Res) :- setof((Start,End),neg_first_wave_feminism(Start,End),AllINtervals), checkvalidity(895,AllINtervals,Res).

check_query() :- write('Query = neg_first_wave_feminism_at_895'), (neg_first_wave_feminism_at_895(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_first_wave_feminism_aux().

