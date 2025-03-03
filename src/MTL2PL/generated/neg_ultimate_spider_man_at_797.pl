:- include('database.pl').
ultimate_spider_man(Start,End) :- begin('ultimate_spider_man',_,_,Start), end('ultimate_spider_man',_,_,End), Start=<End.

compare_ultimate_spider_man(Dir,ultimate_spider_man(Start1,_),ultimate_spider_man(Start2,_)) :- Start1=<Start2.

generate_neg_ultimate_spider_man([]).

generate_neg_ultimate_spider_man([(Start,End) | Tail]) :- assert(neg_ultimate_spider_man(Start,End)), generate_neg_ultimate_spider_man(Tail).

sort_ultimate_spider_man(SortedIntervals) :- findall((Start,End),ultimate_spider_man(Start,End),UnsortedIntervals), predsort(compare_ultimate_spider_man,UnsortedIntervals,SortedIntervals).

generate_neg_ultimate_spider_man_aux() :- sort_ultimate_spider_man(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ultimate_spider_man(NegatedIntervals).

neg_ultimate_spider_man_at_797(Res) :- setof((Start,End),neg_ultimate_spider_man(Start,End),AllINtervals), checkvalidity(797,AllINtervals,Res).

check_query() :- write('Query = neg_ultimate_spider_man_at_797'), (neg_ultimate_spider_man_at_797(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ultimate_spider_man_aux().

