:- include('database.pl').
ev_2014_asian_games(Start,End) :- begin('ev_2014_asian_games',_,_,Start), end('ev_2014_asian_games',_,_,End), Start=<End.

compare_ev_2014_asian_games(Dir,ev_2014_asian_games(Start1,_),ev_2014_asian_games(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2014_asian_games([]).

generate_neg_ev_2014_asian_games([(Start,End) | Tail]) :- assert(neg_ev_2014_asian_games(Start,End)), generate_neg_ev_2014_asian_games(Tail).

sort_ev_2014_asian_games(SortedIntervals) :- findall((Start,End),ev_2014_asian_games(Start,End),UnsortedIntervals), predsort(compare_ev_2014_asian_games,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2014_asian_games_aux() :- sort_ev_2014_asian_games(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2014_asian_games(NegatedIntervals).

neg_ev_2014_asian_games_at_1476(Res) :- setof((Start,End),neg_ev_2014_asian_games(Start,End),AllINtervals), checkvalidity(1476,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2014_asian_games_at_1476'), (neg_ev_2014_asian_games_at_1476(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2014_asian_games_aux().

