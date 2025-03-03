:- include('database.pl').
guinea(Start,End) :- begin('guinea',_,_,Start), end('guinea',_,_,End), Start=<End.

compare_guinea(Dir,guinea(Start1,_),guinea(Start2,_)) :- Start1=<Start2.

generate_neg_guinea([]).

generate_neg_guinea([(Start,End) | Tail]) :- assert(neg_guinea(Start,End)), generate_neg_guinea(Tail).

sort_guinea(SortedIntervals) :- findall((Start,End),guinea(Start,End),UnsortedIntervals), predsort(compare_guinea,UnsortedIntervals,SortedIntervals).

generate_neg_guinea_aux() :- sort_guinea(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_guinea(NegatedIntervals).

neg_guinea_at_1269(Res) :- setof((Start,End),neg_guinea(Start,End),AllINtervals), checkvalidity(1269,AllINtervals,Res).

check_query() :- write('Query = neg_guinea_at_1269'), (neg_guinea_at_1269(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_guinea_aux().

