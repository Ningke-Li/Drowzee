:- include('database.pl').
catholic_league(Start,End) :- begin('catholic_league',_,_,Start), end('catholic_league',_,_,End), Start=<End.

compare_catholic_league(Dir,catholic_league(Start1,_),catholic_league(Start2,_)) :- Start1=<Start2.

generate_neg_catholic_league([]).

generate_neg_catholic_league([(Start,End) | Tail]) :- assert(neg_catholic_league(Start,End)), generate_neg_catholic_league(Tail).

sort_catholic_league(SortedIntervals) :- findall((Start,End),catholic_league(Start,End),UnsortedIntervals), predsort(compare_catholic_league,UnsortedIntervals,SortedIntervals).

generate_neg_catholic_league_aux() :- sort_catholic_league(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_catholic_league(NegatedIntervals).

neg_catholic_league_at_835(Res) :- setof((Start,End),neg_catholic_league(Start,End),AllINtervals), checkvalidity(835,AllINtervals,Res).

check_query() :- write('Query = neg_catholic_league_at_835'), (neg_catholic_league_at_835(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_catholic_league_aux().

