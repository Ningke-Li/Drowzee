:- include('database.pl').
dunkirk_evacuation(Start,End) :- begin('dunkirk_evacuation',_,_,Start), end('dunkirk_evacuation',_,_,End), Start=<End.

compare_dunkirk_evacuation(Dir,dunkirk_evacuation(Start1,_),dunkirk_evacuation(Start2,_)) :- Start1=<Start2.

generate_neg_dunkirk_evacuation([]).

generate_neg_dunkirk_evacuation([(Start,End) | Tail]) :- assert(neg_dunkirk_evacuation(Start,End)), generate_neg_dunkirk_evacuation(Tail).

sort_dunkirk_evacuation(SortedIntervals) :- findall((Start,End),dunkirk_evacuation(Start,End),UnsortedIntervals), predsort(compare_dunkirk_evacuation,UnsortedIntervals,SortedIntervals).

generate_neg_dunkirk_evacuation_aux() :- sort_dunkirk_evacuation(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_dunkirk_evacuation(NegatedIntervals).

neg_dunkirk_evacuation_at_226(Res) :- setof((Start,End),neg_dunkirk_evacuation(Start,End),AllINtervals), checkvalidity(226,AllINtervals,Res).

check_query() :- write('Query = neg_dunkirk_evacuation_at_226'), (neg_dunkirk_evacuation_at_226(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_dunkirk_evacuation_aux().

