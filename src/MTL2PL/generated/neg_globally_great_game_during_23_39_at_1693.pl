:- include('database.pl').
great_game(Start,End) :- begin('great_game',_,_,Start), end('great_game',_,_,End), Start=<End.

globally_great_game_during_23_39(Start,End) :- great_game(Start1,End1), Start is (Start1-23), End is (End1-39), Start=<End.

compare_globally_great_game_during_23_39(Dir,globally_great_game_during_23_39(Start1,_),globally_great_game_during_23_39(Start2,_)) :- Start1=<Start2.

generate_neg_globally_great_game_during_23_39([]).

generate_neg_globally_great_game_during_23_39([(Start,End) | Tail]) :- assert(neg_globally_great_game_during_23_39(Start,End)), generate_neg_globally_great_game_during_23_39(Tail).

sort_globally_great_game_during_23_39(SortedIntervals) :- findall((Start,End),globally_great_game_during_23_39(Start,End),UnsortedIntervals), predsort(compare_globally_great_game_during_23_39,UnsortedIntervals,SortedIntervals).

generate_neg_globally_great_game_during_23_39_aux() :- sort_globally_great_game_during_23_39(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_great_game_during_23_39(NegatedIntervals).

neg_globally_great_game_during_23_39_at_1693(Res) :- setof((Start,End),neg_globally_great_game_during_23_39(Start,End),AllINtervals), checkvalidity(1693,AllINtervals,Res).

check_query() :- write('Query = neg_globally_great_game_during_23_39_at_1693'), (neg_globally_great_game_during_23_39_at_1693(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_great_game_during_23_39_aux().

