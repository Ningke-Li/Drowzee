:- include('database.pl').
game_of_thrones__season_1(Start,End) :- begin('game_of_thrones__season_1',_,_,Start), end('game_of_thrones__season_1',_,_,End), Start=<End.

compare_game_of_thrones__season_1(Dir,game_of_thrones__season_1(Start1,_),game_of_thrones__season_1(Start2,_)) :- Start1=<Start2.

generate_neg_game_of_thrones__season_1([]).

generate_neg_game_of_thrones__season_1([(Start,End) | Tail]) :- assert(neg_game_of_thrones__season_1(Start,End)), generate_neg_game_of_thrones__season_1(Tail).

sort_game_of_thrones__season_1(SortedIntervals) :- findall((Start,End),game_of_thrones__season_1(Start,End),UnsortedIntervals), predsort(compare_game_of_thrones__season_1,UnsortedIntervals,SortedIntervals).

generate_neg_game_of_thrones__season_1_aux() :- sort_game_of_thrones__season_1(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_game_of_thrones__season_1(NegatedIntervals).

neg_game_of_thrones__season_1_at_1203(Res) :- setof((Start,End),neg_game_of_thrones__season_1(Start,End),AllINtervals), checkvalidity(1203,AllINtervals,Res).

check_query() :- write('Query = neg_game_of_thrones__season_1_at_1203'), (neg_game_of_thrones__season_1_at_1203(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_game_of_thrones__season_1_aux().

