:- include('database.pl').
new_deal(Start,End) :- begin('new_deal',_,_,Start), end('new_deal',_,_,End), Start=<End.

compare_new_deal(Dir,new_deal(Start1,_),new_deal(Start2,_)) :- Start1=<Start2.

generate_neg_new_deal([]).

generate_neg_new_deal([(Start,End) | Tail]) :- assert(neg_new_deal(Start,End)), generate_neg_new_deal(Tail).

sort_new_deal(SortedIntervals) :- findall((Start,End),new_deal(Start,End),UnsortedIntervals), predsort(compare_new_deal,UnsortedIntervals,SortedIntervals).

generate_neg_new_deal_aux() :- sort_new_deal(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_new_deal(NegatedIntervals).

neg_new_deal_at_1790(Res) :- setof((Start,End),neg_new_deal(Start,End),AllINtervals), checkvalidity(1790,AllINtervals,Res).

check_query() :- write('Query = neg_new_deal_at_1790'), (neg_new_deal_at_1790(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_new_deal_aux().

