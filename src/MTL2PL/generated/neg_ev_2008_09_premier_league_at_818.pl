:- include('database.pl').
ev_2008_09_premier_league(Start,End) :- begin('ev_2008_09_premier_league',_,_,Start), end('ev_2008_09_premier_league',_,_,End), Start=<End.

compare_ev_2008_09_premier_league(Dir,ev_2008_09_premier_league(Start1,_),ev_2008_09_premier_league(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2008_09_premier_league([]).

generate_neg_ev_2008_09_premier_league([(Start,End) | Tail]) :- assert(neg_ev_2008_09_premier_league(Start,End)), generate_neg_ev_2008_09_premier_league(Tail).

sort_ev_2008_09_premier_league(SortedIntervals) :- findall((Start,End),ev_2008_09_premier_league(Start,End),UnsortedIntervals), predsort(compare_ev_2008_09_premier_league,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2008_09_premier_league_aux() :- sort_ev_2008_09_premier_league(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2008_09_premier_league(NegatedIntervals).

neg_ev_2008_09_premier_league_at_818(Res) :- setof((Start,End),neg_ev_2008_09_premier_league(Start,End),AllINtervals), checkvalidity(818,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2008_09_premier_league_at_818'), (neg_ev_2008_09_premier_league_at_818(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2008_09_premier_league_aux().

