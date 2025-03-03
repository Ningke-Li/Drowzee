:- include('database.pl').
two_and_a_half_men(Start,End) :- begin('two_and_a_half_men',_,_,Start), end('two_and_a_half_men',_,_,End), Start=<End.

globally_two_and_a_half_men_during_1_12(Start,End) :- two_and_a_half_men(Start1,End1), Start is (Start1-1), End is (End1-12), Start=<End.

compare_globally_two_and_a_half_men_during_1_12(Dir,globally_two_and_a_half_men_during_1_12(Start1,_),globally_two_and_a_half_men_during_1_12(Start2,_)) :- Start1=<Start2.

generate_neg_globally_two_and_a_half_men_during_1_12([]).

generate_neg_globally_two_and_a_half_men_during_1_12([(Start,End) | Tail]) :- assert(neg_globally_two_and_a_half_men_during_1_12(Start,End)), generate_neg_globally_two_and_a_half_men_during_1_12(Tail).

sort_globally_two_and_a_half_men_during_1_12(SortedIntervals) :- findall((Start,End),globally_two_and_a_half_men_during_1_12(Start,End),UnsortedIntervals), predsort(compare_globally_two_and_a_half_men_during_1_12,UnsortedIntervals,SortedIntervals).

generate_neg_globally_two_and_a_half_men_during_1_12_aux() :- sort_globally_two_and_a_half_men_during_1_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_two_and_a_half_men_during_1_12(NegatedIntervals).

neg_globally_two_and_a_half_men_during_1_12_at_970(Res) :- setof((Start,End),neg_globally_two_and_a_half_men_during_1_12(Start,End),AllINtervals), checkvalidity(970,AllINtervals,Res).

check_query() :- write('Query = neg_globally_two_and_a_half_men_during_1_12_at_970'), (neg_globally_two_and_a_half_men_during_1_12_at_970(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_two_and_a_half_men_during_1_12_aux().

