:- include('database.pl').
green_revolution(Start,End) :- begin('green_revolution',_,_,Start), end('green_revolution',_,_,End), Start=<End.

compare_green_revolution(Dir,green_revolution(Start1,_),green_revolution(Start2,_)) :- Start1=<Start2.

generate_neg_green_revolution([]).

generate_neg_green_revolution([(Start,End) | Tail]) :- assert(neg_green_revolution(Start,End)), generate_neg_green_revolution(Tail).

sort_green_revolution(SortedIntervals) :- findall((Start,End),green_revolution(Start,End),UnsortedIntervals), predsort(compare_green_revolution,UnsortedIntervals,SortedIntervals).

generate_neg_green_revolution_aux() :- sort_green_revolution(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_green_revolution(NegatedIntervals).

neg_green_revolution_at_1433(Res) :- setof((Start,End),neg_green_revolution(Start,End),AllINtervals), checkvalidity(1433,AllINtervals,Res).

check_query() :- write('Query = neg_green_revolution_at_1433'), (neg_green_revolution_at_1433(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_green_revolution_aux().

