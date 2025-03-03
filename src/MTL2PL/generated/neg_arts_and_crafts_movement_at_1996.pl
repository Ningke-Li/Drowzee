:- include('database.pl').
arts_and_crafts_movement(Start,End) :- begin('arts_and_crafts_movement',_,_,Start), end('arts_and_crafts_movement',_,_,End), Start=<End.

compare_arts_and_crafts_movement(Dir,arts_and_crafts_movement(Start1,_),arts_and_crafts_movement(Start2,_)) :- Start1=<Start2.

generate_neg_arts_and_crafts_movement([]).

generate_neg_arts_and_crafts_movement([(Start,End) | Tail]) :- assert(neg_arts_and_crafts_movement(Start,End)), generate_neg_arts_and_crafts_movement(Tail).

sort_arts_and_crafts_movement(SortedIntervals) :- findall((Start,End),arts_and_crafts_movement(Start,End),UnsortedIntervals), predsort(compare_arts_and_crafts_movement,UnsortedIntervals,SortedIntervals).

generate_neg_arts_and_crafts_movement_aux() :- sort_arts_and_crafts_movement(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_arts_and_crafts_movement(NegatedIntervals).

neg_arts_and_crafts_movement_at_1996(Res) :- setof((Start,End),neg_arts_and_crafts_movement(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = neg_arts_and_crafts_movement_at_1996'), (neg_arts_and_crafts_movement_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_arts_and_crafts_movement_aux().

