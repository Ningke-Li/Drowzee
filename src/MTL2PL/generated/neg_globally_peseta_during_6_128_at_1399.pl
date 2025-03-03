:- include('database.pl').
peseta(Start,End) :- begin('peseta',_,_,Start), end('peseta',_,_,End), Start=<End.

globally_peseta_during_6_128(Start,End) :- peseta(Start1,End1), Start is (Start1-6), End is (End1-128), Start=<End.

compare_globally_peseta_during_6_128(Dir,globally_peseta_during_6_128(Start1,_),globally_peseta_during_6_128(Start2,_)) :- Start1=<Start2.

generate_neg_globally_peseta_during_6_128([]).

generate_neg_globally_peseta_during_6_128([(Start,End) | Tail]) :- assert(neg_globally_peseta_during_6_128(Start,End)), generate_neg_globally_peseta_during_6_128(Tail).

sort_globally_peseta_during_6_128(SortedIntervals) :- findall((Start,End),globally_peseta_during_6_128(Start,End),UnsortedIntervals), predsort(compare_globally_peseta_during_6_128,UnsortedIntervals,SortedIntervals).

generate_neg_globally_peseta_during_6_128_aux() :- sort_globally_peseta_during_6_128(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_peseta_during_6_128(NegatedIntervals).

neg_globally_peseta_during_6_128_at_1399(Res) :- setof((Start,End),neg_globally_peseta_during_6_128(Start,End),AllINtervals), checkvalidity(1399,AllINtervals,Res).

check_query() :- write('Query = neg_globally_peseta_during_6_128_at_1399'), (neg_globally_peseta_during_6_128_at_1399(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_peseta_during_6_128_aux().

