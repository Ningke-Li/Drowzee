:- include('database.pl').
boardwalk_empire(Start,End) :- begin('boardwalk_empire',_,_,Start), end('boardwalk_empire',_,_,End), Start=<End.

compare_boardwalk_empire(Dir,boardwalk_empire(Start1,_),boardwalk_empire(Start2,_)) :- Start1=<Start2.

generate_neg_boardwalk_empire([]).

generate_neg_boardwalk_empire([(Start,End) | Tail]) :- assert(neg_boardwalk_empire(Start,End)), generate_neg_boardwalk_empire(Tail).

sort_boardwalk_empire(SortedIntervals) :- findall((Start,End),boardwalk_empire(Start,End),UnsortedIntervals), predsort(compare_boardwalk_empire,UnsortedIntervals,SortedIntervals).

generate_neg_boardwalk_empire_aux() :- sort_boardwalk_empire(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_boardwalk_empire(NegatedIntervals).

neg_boardwalk_empire_at_1843(Res) :- setof((Start,End),neg_boardwalk_empire(Start,End),AllINtervals), checkvalidity(1843,AllINtervals,Res).

check_query() :- write('Query = neg_boardwalk_empire_at_1843'), (neg_boardwalk_empire_at_1843(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_boardwalk_empire_aux().

