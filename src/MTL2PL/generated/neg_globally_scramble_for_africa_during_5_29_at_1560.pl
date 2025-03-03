:- include('database.pl').
scramble_for_africa(Start,End) :- begin('scramble_for_africa',_,_,Start), end('scramble_for_africa',_,_,End), Start=<End.

globally_scramble_for_africa_during_5_29(Start,End) :- scramble_for_africa(Start1,End1), Start is (Start1-5), End is (End1-29), Start=<End.

compare_globally_scramble_for_africa_during_5_29(Dir,globally_scramble_for_africa_during_5_29(Start1,_),globally_scramble_for_africa_during_5_29(Start2,_)) :- Start1=<Start2.

generate_neg_globally_scramble_for_africa_during_5_29([]).

generate_neg_globally_scramble_for_africa_during_5_29([(Start,End) | Tail]) :- assert(neg_globally_scramble_for_africa_during_5_29(Start,End)), generate_neg_globally_scramble_for_africa_during_5_29(Tail).

sort_globally_scramble_for_africa_during_5_29(SortedIntervals) :- findall((Start,End),globally_scramble_for_africa_during_5_29(Start,End),UnsortedIntervals), predsort(compare_globally_scramble_for_africa_during_5_29,UnsortedIntervals,SortedIntervals).

generate_neg_globally_scramble_for_africa_during_5_29_aux() :- sort_globally_scramble_for_africa_during_5_29(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_scramble_for_africa_during_5_29(NegatedIntervals).

neg_globally_scramble_for_africa_during_5_29_at_1560(Res) :- setof((Start,End),neg_globally_scramble_for_africa_during_5_29(Start,End),AllINtervals), checkvalidity(1560,AllINtervals,Res).

check_query() :- write('Query = neg_globally_scramble_for_africa_during_5_29_at_1560'), (neg_globally_scramble_for_africa_during_5_29_at_1560(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_scramble_for_africa_during_5_29_aux().

