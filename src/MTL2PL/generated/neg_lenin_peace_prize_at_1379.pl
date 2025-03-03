:- include('database.pl').
lenin_peace_prize(Start,End) :- begin('lenin_peace_prize',_,_,Start), end('lenin_peace_prize',_,_,End), Start=<End.

compare_lenin_peace_prize(Dir,lenin_peace_prize(Start1,_),lenin_peace_prize(Start2,_)) :- Start1=<Start2.

generate_neg_lenin_peace_prize([]).

generate_neg_lenin_peace_prize([(Start,End) | Tail]) :- assert(neg_lenin_peace_prize(Start,End)), generate_neg_lenin_peace_prize(Tail).

sort_lenin_peace_prize(SortedIntervals) :- findall((Start,End),lenin_peace_prize(Start,End),UnsortedIntervals), predsort(compare_lenin_peace_prize,UnsortedIntervals,SortedIntervals).

generate_neg_lenin_peace_prize_aux() :- sort_lenin_peace_prize(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_lenin_peace_prize(NegatedIntervals).

neg_lenin_peace_prize_at_1379(Res) :- setof((Start,End),neg_lenin_peace_prize(Start,End),AllINtervals), checkvalidity(1379,AllINtervals,Res).

check_query() :- write('Query = neg_lenin_peace_prize_at_1379'), (neg_lenin_peace_prize_at_1379(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_lenin_peace_prize_aux().

