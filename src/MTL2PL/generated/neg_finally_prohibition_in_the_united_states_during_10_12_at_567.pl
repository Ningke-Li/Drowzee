:- include('database.pl').
prohibition_in_the_united_states(Start,End) :- begin('prohibition_in_the_united_states',_,_,Start), end('prohibition_in_the_united_states',_,_,End), Start=<End.

finally_prohibition_in_the_united_states_during_10_12(Start,End) :- prohibition_in_the_united_states(Start1,End1), (Start1-12)=<(End1-10), Start is (Start1-12), End is (End1-10), Start=<End.

compare_finally_prohibition_in_the_united_states_during_10_12(Dir,finally_prohibition_in_the_united_states_during_10_12(Start1,_),finally_prohibition_in_the_united_states_during_10_12(Start2,_)) :- Start1=<Start2.

generate_neg_finally_prohibition_in_the_united_states_during_10_12([]).

generate_neg_finally_prohibition_in_the_united_states_during_10_12([(Start,End) | Tail]) :- assert(neg_finally_prohibition_in_the_united_states_during_10_12(Start,End)), generate_neg_finally_prohibition_in_the_united_states_during_10_12(Tail).

sort_finally_prohibition_in_the_united_states_during_10_12(SortedIntervals) :- findall((Start,End),finally_prohibition_in_the_united_states_during_10_12(Start,End),UnsortedIntervals), predsort(compare_finally_prohibition_in_the_united_states_during_10_12,UnsortedIntervals,SortedIntervals).

generate_neg_finally_prohibition_in_the_united_states_during_10_12_aux() :- sort_finally_prohibition_in_the_united_states_during_10_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_prohibition_in_the_united_states_during_10_12(NegatedIntervals).

neg_finally_prohibition_in_the_united_states_during_10_12_at_567(Res) :- setof((Start,End),neg_finally_prohibition_in_the_united_states_during_10_12(Start,End),AllINtervals), checkvalidity(567,AllINtervals,Res).

check_query() :- write('Query = neg_finally_prohibition_in_the_united_states_during_10_12_at_567'), (neg_finally_prohibition_in_the_united_states_during_10_12_at_567(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_prohibition_in_the_united_states_during_10_12_aux().

