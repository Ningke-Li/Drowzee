:- include('database.pl').
interwar_period(Start,End) :- begin('interwar_period',_,_,Start), end('interwar_period',_,_,End), Start=<End.

compare_interwar_period(Dir,interwar_period(Start1,_),interwar_period(Start2,_)) :- Start1=<Start2.

generate_neg_interwar_period([]).

generate_neg_interwar_period([(Start,End) | Tail]) :- assert(neg_interwar_period(Start,End)), generate_neg_interwar_period(Tail).

sort_interwar_period(SortedIntervals) :- findall((Start,End),interwar_period(Start,End),UnsortedIntervals), predsort(compare_interwar_period,UnsortedIntervals,SortedIntervals).

generate_neg_interwar_period_aux() :- sort_interwar_period(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_interwar_period(NegatedIntervals).

neg_interwar_period_at_1270(Res) :- setof((Start,End),neg_interwar_period(Start,End),AllINtervals), checkvalidity(1270,AllINtervals,Res).

check_query() :- write('Query = neg_interwar_period_at_1270'), (neg_interwar_period_at_1270(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_interwar_period_aux().

