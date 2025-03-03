:- include('database.pl').
jumong(Start,End) :- begin('jumong',_,_,Start), end('jumong',_,_,End), Start=<End.

compare_jumong(Dir,jumong(Start1,_),jumong(Start2,_)) :- Start1=<Start2.

generate_neg_jumong([]).

generate_neg_jumong([(Start,End) | Tail]) :- assert(neg_jumong(Start,End)), generate_neg_jumong(Tail).

sort_jumong(SortedIntervals) :- findall((Start,End),jumong(Start,End),UnsortedIntervals), predsort(compare_jumong,UnsortedIntervals,SortedIntervals).

generate_neg_jumong_aux() :- sort_jumong(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_jumong(NegatedIntervals).

neg_jumong_at_1005(Res) :- setof((Start,End),neg_jumong(Start,End),AllINtervals), checkvalidity(1005,AllINtervals,Res).

check_query() :- write('Query = neg_jumong_at_1005'), (neg_jumong_at_1005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_jumong_aux().

