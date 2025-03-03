:- include('database.pl').
indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

compare_indian_independence_movement(Dir,indian_independence_movement(Start1,_),indian_independence_movement(Start2,_)) :- Start1=<Start2.

generate_neg_indian_independence_movement([]).

generate_neg_indian_independence_movement([(Start,End) | Tail]) :- assert(neg_indian_independence_movement(Start,End)), generate_neg_indian_independence_movement(Tail).

sort_indian_independence_movement(SortedIntervals) :- findall((Start,End),indian_independence_movement(Start,End),UnsortedIntervals), predsort(compare_indian_independence_movement,UnsortedIntervals,SortedIntervals).

generate_neg_indian_independence_movement_aux() :- sort_indian_independence_movement(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_indian_independence_movement(NegatedIntervals).

neg_indian_independence_movement_at_979(Res) :- setof((Start,End),neg_indian_independence_movement(Start,End),AllINtervals), checkvalidity(979,AllINtervals,Res).

check_query() :- write('Query = neg_indian_independence_movement_at_979'), (neg_indian_independence_movement_at_979(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_indian_independence_movement_aux().

