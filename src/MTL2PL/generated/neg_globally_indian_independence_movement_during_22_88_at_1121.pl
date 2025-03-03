:- include('database.pl').
indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

globally_indian_independence_movement_during_22_88(Start,End) :- indian_independence_movement(Start1,End1), Start is (Start1-22), End is (End1-88), Start=<End.

compare_globally_indian_independence_movement_during_22_88(Dir,globally_indian_independence_movement_during_22_88(Start1,_),globally_indian_independence_movement_during_22_88(Start2,_)) :- Start1=<Start2.

generate_neg_globally_indian_independence_movement_during_22_88([]).

generate_neg_globally_indian_independence_movement_during_22_88([(Start,End) | Tail]) :- assert(neg_globally_indian_independence_movement_during_22_88(Start,End)), generate_neg_globally_indian_independence_movement_during_22_88(Tail).

sort_globally_indian_independence_movement_during_22_88(SortedIntervals) :- findall((Start,End),globally_indian_independence_movement_during_22_88(Start,End),UnsortedIntervals), predsort(compare_globally_indian_independence_movement_during_22_88,UnsortedIntervals,SortedIntervals).

generate_neg_globally_indian_independence_movement_during_22_88_aux() :- sort_globally_indian_independence_movement_during_22_88(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_indian_independence_movement_during_22_88(NegatedIntervals).

neg_globally_indian_independence_movement_during_22_88_at_1121(Res) :- setof((Start,End),neg_globally_indian_independence_movement_during_22_88(Start,End),AllINtervals), checkvalidity(1121,AllINtervals,Res).

check_query() :- write('Query = neg_globally_indian_independence_movement_during_22_88_at_1121'), (neg_globally_indian_independence_movement_during_22_88_at_1121(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_indian_independence_movement_during_22_88_aux().

