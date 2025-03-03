:- include('database.pl').
ev_2013_14_uefa_champions_league(Start,End) :- begin('ev_2013_14_uefa_champions_league',_,_,Start), end('ev_2013_14_uefa_champions_league',_,_,End), Start=<End.

compare_ev_2013_14_uefa_champions_league(Dir,ev_2013_14_uefa_champions_league(Start1,_),ev_2013_14_uefa_champions_league(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2013_14_uefa_champions_league([]).

generate_neg_ev_2013_14_uefa_champions_league([(Start,End) | Tail]) :- assert(neg_ev_2013_14_uefa_champions_league(Start,End)), generate_neg_ev_2013_14_uefa_champions_league(Tail).

sort_ev_2013_14_uefa_champions_league(SortedIntervals) :- findall((Start,End),ev_2013_14_uefa_champions_league(Start,End),UnsortedIntervals), predsort(compare_ev_2013_14_uefa_champions_league,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2013_14_uefa_champions_league_aux() :- sort_ev_2013_14_uefa_champions_league(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2013_14_uefa_champions_league(NegatedIntervals).

neg_ev_2013_14_uefa_champions_league_at_0(Res) :- setof((Start,End),neg_ev_2013_14_uefa_champions_league(Start,End),AllINtervals), checkvalidity(0,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2013_14_uefa_champions_league_at_0'), (neg_ev_2013_14_uefa_champions_league_at_0(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2013_14_uefa_champions_league_aux().

