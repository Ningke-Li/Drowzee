:- include('database.pl').
hannibal(Start,End) :- begin('hannibal',_,_,Start), end('hannibal',_,_,End), Start=<End.

compare_hannibal(Dir,hannibal(Start1,_),hannibal(Start2,_)) :- Start1=<Start2.

generate_neg_hannibal([]).

generate_neg_hannibal([(Start,End) | Tail]) :- assert(neg_hannibal(Start,End)), generate_neg_hannibal(Tail).

sort_hannibal(SortedIntervals) :- findall((Start,End),hannibal(Start,End),UnsortedIntervals), predsort(compare_hannibal,UnsortedIntervals,SortedIntervals).

generate_neg_hannibal_aux() :- sort_hannibal(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_hannibal(NegatedIntervals).

neg_hannibal_at_601(Res) :- setof((Start,End),neg_hannibal(Start,End),AllINtervals), checkvalidity(601,AllINtervals,Res).

check_query() :- write('Query = neg_hannibal_at_601'), (neg_hannibal_at_601(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_hannibal_aux().

