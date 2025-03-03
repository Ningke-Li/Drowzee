:- include('database.pl').
two_and_a_half_men(Start,End) :- begin('two_and_a_half_men',_,_,Start), end('two_and_a_half_men',_,_,End), Start=<End.

compare_two_and_a_half_men(Dir,two_and_a_half_men(Start1,_),two_and_a_half_men(Start2,_)) :- Start1=<Start2.

generate_neg_two_and_a_half_men([]).

generate_neg_two_and_a_half_men([(Start,End) | Tail]) :- assert(neg_two_and_a_half_men(Start,End)), generate_neg_two_and_a_half_men(Tail).

sort_two_and_a_half_men(SortedIntervals) :- findall((Start,End),two_and_a_half_men(Start,End),UnsortedIntervals), predsort(compare_two_and_a_half_men,UnsortedIntervals,SortedIntervals).

generate_neg_two_and_a_half_men_aux() :- sort_two_and_a_half_men(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_two_and_a_half_men(NegatedIntervals).

neg_two_and_a_half_men_at_699(Res) :- setof((Start,End),neg_two_and_a_half_men(Start,End),AllINtervals), checkvalidity(699,AllINtervals,Res).

check_query() :- write('Query = neg_two_and_a_half_men_at_699'), (neg_two_and_a_half_men_at_699(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_two_and_a_half_men_aux().

