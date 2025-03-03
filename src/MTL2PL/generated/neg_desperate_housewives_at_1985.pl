:- include('database.pl').
desperate_housewives(Start,End) :- begin('desperate_housewives',_,_,Start), end('desperate_housewives',_,_,End), Start=<End.

compare_desperate_housewives(Dir,desperate_housewives(Start1,_),desperate_housewives(Start2,_)) :- Start1=<Start2.

generate_neg_desperate_housewives([]).

generate_neg_desperate_housewives([(Start,End) | Tail]) :- assert(neg_desperate_housewives(Start,End)), generate_neg_desperate_housewives(Tail).

sort_desperate_housewives(SortedIntervals) :- findall((Start,End),desperate_housewives(Start,End),UnsortedIntervals), predsort(compare_desperate_housewives,UnsortedIntervals,SortedIntervals).

generate_neg_desperate_housewives_aux() :- sort_desperate_housewives(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_desperate_housewives(NegatedIntervals).

neg_desperate_housewives_at_1985(Res) :- setof((Start,End),neg_desperate_housewives(Start,End),AllINtervals), checkvalidity(1985,AllINtervals,Res).

check_query() :- write('Query = neg_desperate_housewives_at_1985'), (neg_desperate_housewives_at_1985(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_desperate_housewives_aux().

