:- include('database.pl').
ev_2014_15_uefa_europa_league(Start,End) :- begin('ev_2014_15_uefa_europa_league',_,_,Start), end('ev_2014_15_uefa_europa_league',_,_,End), Start=<End.

compare_ev_2014_15_uefa_europa_league(Dir,ev_2014_15_uefa_europa_league(Start1,_),ev_2014_15_uefa_europa_league(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2014_15_uefa_europa_league([]).

generate_neg_ev_2014_15_uefa_europa_league([(Start,End) | Tail]) :- assert(neg_ev_2014_15_uefa_europa_league(Start,End)), generate_neg_ev_2014_15_uefa_europa_league(Tail).

sort_ev_2014_15_uefa_europa_league(SortedIntervals) :- findall((Start,End),ev_2014_15_uefa_europa_league(Start,End),UnsortedIntervals), predsort(compare_ev_2014_15_uefa_europa_league,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2014_15_uefa_europa_league_aux() :- sort_ev_2014_15_uefa_europa_league(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2014_15_uefa_europa_league(NegatedIntervals).

neg_ev_2014_15_uefa_europa_league_at_586(Res) :- setof((Start,End),neg_ev_2014_15_uefa_europa_league(Start,End),AllINtervals), checkvalidity(586,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2014_15_uefa_europa_league_at_586'), (neg_ev_2014_15_uefa_europa_league_at_586(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2014_15_uefa_europa_league_aux().

