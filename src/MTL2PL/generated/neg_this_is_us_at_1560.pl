:- include('database.pl').
this_is_us(Start,End) :- begin('this_is_us',_,_,Start), end('this_is_us',_,_,End), Start=<End.

compare_this_is_us(Dir,this_is_us(Start1,_),this_is_us(Start2,_)) :- Start1=<Start2.

generate_neg_this_is_us([]).

generate_neg_this_is_us([(Start,End) | Tail]) :- assert(neg_this_is_us(Start,End)), generate_neg_this_is_us(Tail).

sort_this_is_us(SortedIntervals) :- findall((Start,End),this_is_us(Start,End),UnsortedIntervals), predsort(compare_this_is_us,UnsortedIntervals,SortedIntervals).

generate_neg_this_is_us_aux() :- sort_this_is_us(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_this_is_us(NegatedIntervals).

neg_this_is_us_at_1560(Res) :- setof((Start,End),neg_this_is_us(Start,End),AllINtervals), checkvalidity(1560,AllINtervals,Res).

check_query() :- write('Query = neg_this_is_us_at_1560'), (neg_this_is_us_at_1560(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_this_is_us_aux().

