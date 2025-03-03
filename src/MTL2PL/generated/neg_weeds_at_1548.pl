:- include('database.pl').
weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

compare_weeds(Dir,weeds(Start1,_),weeds(Start2,_)) :- Start1=<Start2.

generate_neg_weeds([]).

generate_neg_weeds([(Start,End) | Tail]) :- assert(neg_weeds(Start,End)), generate_neg_weeds(Tail).

sort_weeds(SortedIntervals) :- findall((Start,End),weeds(Start,End),UnsortedIntervals), predsort(compare_weeds,UnsortedIntervals,SortedIntervals).

generate_neg_weeds_aux() :- sort_weeds(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_weeds(NegatedIntervals).

neg_weeds_at_1548(Res) :- setof((Start,End),neg_weeds(Start,End),AllINtervals), checkvalidity(1548,AllINtervals,Res).

check_query() :- write('Query = neg_weeds_at_1548'), (neg_weeds_at_1548(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_weeds_aux().

