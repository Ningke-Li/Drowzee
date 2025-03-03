:- include('database.pl').
klondike_gold_rush(Start,End) :- begin('klondike_gold_rush',_,_,Start), end('klondike_gold_rush',_,_,End), Start=<End.

globally_klondike_gold_rush_during_1_3(Start,End) :- klondike_gold_rush(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

compare_globally_klondike_gold_rush_during_1_3(Dir,globally_klondike_gold_rush_during_1_3(Start1,_),globally_klondike_gold_rush_during_1_3(Start2,_)) :- Start1=<Start2.

generate_neg_globally_klondike_gold_rush_during_1_3([]).

generate_neg_globally_klondike_gold_rush_during_1_3([(Start,End) | Tail]) :- assert(neg_globally_klondike_gold_rush_during_1_3(Start,End)), generate_neg_globally_klondike_gold_rush_during_1_3(Tail).

sort_globally_klondike_gold_rush_during_1_3(SortedIntervals) :- findall((Start,End),globally_klondike_gold_rush_during_1_3(Start,End),UnsortedIntervals), predsort(compare_globally_klondike_gold_rush_during_1_3,UnsortedIntervals,SortedIntervals).

generate_neg_globally_klondike_gold_rush_during_1_3_aux() :- sort_globally_klondike_gold_rush_during_1_3(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_klondike_gold_rush_during_1_3(NegatedIntervals).

neg_globally_klondike_gold_rush_during_1_3_at_1047(Res) :- setof((Start,End),neg_globally_klondike_gold_rush_during_1_3(Start,End),AllINtervals), checkvalidity(1047,AllINtervals,Res).

check_query() :- write('Query = neg_globally_klondike_gold_rush_during_1_3_at_1047'), (neg_globally_klondike_gold_rush_during_1_3_at_1047(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_klondike_gold_rush_during_1_3_aux().

