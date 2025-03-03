:- include('database.pl').
merlin(Start,End) :- begin('merlin',_,_,Start), end('merlin',_,_,End), Start=<End.

finally_merlin_during_4_11(Start,End) :- merlin(Start1,End1), (Start1-11)=<(End1-4), Start is (Start1-11), End is (End1-4), Start=<End.

compare_finally_merlin_during_4_11(Dir,finally_merlin_during_4_11(Start1,_),finally_merlin_during_4_11(Start2,_)) :- Start1=<Start2.

generate_neg_finally_merlin_during_4_11([]).

generate_neg_finally_merlin_during_4_11([(Start,End) | Tail]) :- assert(neg_finally_merlin_during_4_11(Start,End)), generate_neg_finally_merlin_during_4_11(Tail).

sort_finally_merlin_during_4_11(SortedIntervals) :- findall((Start,End),finally_merlin_during_4_11(Start,End),UnsortedIntervals), predsort(compare_finally_merlin_during_4_11,UnsortedIntervals,SortedIntervals).

generate_neg_finally_merlin_during_4_11_aux() :- sort_finally_merlin_during_4_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_merlin_during_4_11(NegatedIntervals).

neg_finally_merlin_during_4_11_at_537(Res) :- setof((Start,End),neg_finally_merlin_during_4_11(Start,End),AllINtervals), checkvalidity(537,AllINtervals,Res).

check_query() :- write('Query = neg_finally_merlin_during_4_11_at_537'), (neg_finally_merlin_during_4_11_at_537(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_merlin_during_4_11_aux().

