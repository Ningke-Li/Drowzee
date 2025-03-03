:- include('database.pl').
peseta(Start,End) :- begin('peseta',_,_,Start), end('peseta',_,_,End), Start=<End.

compare_peseta(Dir,peseta(Start1,_),peseta(Start2,_)) :- Start1=<Start2.

generate_neg_peseta([]).

generate_neg_peseta([(Start,End) | Tail]) :- assert(neg_peseta(Start,End)), generate_neg_peseta(Tail).

sort_peseta(SortedIntervals) :- findall((Start,End),peseta(Start,End),UnsortedIntervals), predsort(compare_peseta,UnsortedIntervals,SortedIntervals).

generate_neg_peseta_aux() :- sort_peseta(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_peseta(NegatedIntervals).

neg_peseta_at_663(Res) :- setof((Start,End),neg_peseta(Start,End),AllINtervals), checkvalidity(663,AllINtervals,Res).

check_query() :- write('Query = neg_peseta_at_663'), (neg_peseta_at_663(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_peseta_aux().

