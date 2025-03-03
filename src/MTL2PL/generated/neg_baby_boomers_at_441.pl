:- include('database.pl').
baby_boomers(Start,End) :- begin('baby_boomers',_,_,Start), end('baby_boomers',_,_,End), Start=<End.

compare_baby_boomers(Dir,baby_boomers(Start1,_),baby_boomers(Start2,_)) :- Start1=<Start2.

generate_neg_baby_boomers([]).

generate_neg_baby_boomers([(Start,End) | Tail]) :- assert(neg_baby_boomers(Start,End)), generate_neg_baby_boomers(Tail).

sort_baby_boomers(SortedIntervals) :- findall((Start,End),baby_boomers(Start,End),UnsortedIntervals), predsort(compare_baby_boomers,UnsortedIntervals,SortedIntervals).

generate_neg_baby_boomers_aux() :- sort_baby_boomers(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_baby_boomers(NegatedIntervals).

neg_baby_boomers_at_441(Res) :- setof((Start,End),neg_baby_boomers(Start,End),AllINtervals), checkvalidity(441,AllINtervals,Res).

check_query() :- write('Query = neg_baby_boomers_at_441'), (neg_baby_boomers_at_441(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_baby_boomers_aux().

