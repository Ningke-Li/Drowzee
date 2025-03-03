:- include('database.pl').
spanish_conquest_of_the_aztec_empire(Start,End) :- begin('spanish_conquest_of_the_aztec_empire',_,_,Start), end('spanish_conquest_of_the_aztec_empire',_,_,End), Start=<End.

compare_spanish_conquest_of_the_aztec_empire(Dir,spanish_conquest_of_the_aztec_empire(Start1,_),spanish_conquest_of_the_aztec_empire(Start2,_)) :- Start1=<Start2.

generate_neg_spanish_conquest_of_the_aztec_empire([]).

generate_neg_spanish_conquest_of_the_aztec_empire([(Start,End) | Tail]) :- assert(neg_spanish_conquest_of_the_aztec_empire(Start,End)), generate_neg_spanish_conquest_of_the_aztec_empire(Tail).

sort_spanish_conquest_of_the_aztec_empire(SortedIntervals) :- findall((Start,End),spanish_conquest_of_the_aztec_empire(Start,End),UnsortedIntervals), predsort(compare_spanish_conquest_of_the_aztec_empire,UnsortedIntervals,SortedIntervals).

generate_neg_spanish_conquest_of_the_aztec_empire_aux() :- sort_spanish_conquest_of_the_aztec_empire(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_spanish_conquest_of_the_aztec_empire(NegatedIntervals).

neg_spanish_conquest_of_the_aztec_empire_at_879(Res) :- setof((Start,End),neg_spanish_conquest_of_the_aztec_empire(Start,End),AllINtervals), checkvalidity(879,AllINtervals,Res).

check_query() :- write('Query = neg_spanish_conquest_of_the_aztec_empire_at_879'), (neg_spanish_conquest_of_the_aztec_empire_at_879(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_spanish_conquest_of_the_aztec_empire_aux().

