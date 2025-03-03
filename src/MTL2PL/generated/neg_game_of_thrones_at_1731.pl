:- include('database.pl').
game_of_thrones(Start,End) :- begin('game_of_thrones',_,_,Start), end('game_of_thrones',_,_,End), Start=<End.

compare_game_of_thrones(Dir,game_of_thrones(Start1,_),game_of_thrones(Start2,_)) :- Start1=<Start2.

generate_neg_game_of_thrones([]).

generate_neg_game_of_thrones([(Start,End) | Tail]) :- assert(neg_game_of_thrones(Start,End)), generate_neg_game_of_thrones(Tail).

sort_game_of_thrones(SortedIntervals) :- findall((Start,End),game_of_thrones(Start,End),UnsortedIntervals), predsort(compare_game_of_thrones,UnsortedIntervals,SortedIntervals).

generate_neg_game_of_thrones_aux() :- sort_game_of_thrones(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_game_of_thrones(NegatedIntervals).

neg_game_of_thrones_at_1731(Res) :- setof((Start,End),neg_game_of_thrones(Start,End),AllINtervals), checkvalidity(1731,AllINtervals,Res).

check_query() :- write('Query = neg_game_of_thrones_at_1731'), (neg_game_of_thrones_at_1731(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_game_of_thrones_aux().

