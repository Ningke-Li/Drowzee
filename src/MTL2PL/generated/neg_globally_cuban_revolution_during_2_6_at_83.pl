:- include('database.pl').
cuban_revolution(Start,End) :- begin('cuban_revolution',_,_,Start), end('cuban_revolution',_,_,End), Start=<End.

globally_cuban_revolution_during_2_6(Start,End) :- cuban_revolution(Start1,End1), Start is (Start1-2), End is (End1-6), Start=<End.

compare_globally_cuban_revolution_during_2_6(Dir,globally_cuban_revolution_during_2_6(Start1,_),globally_cuban_revolution_during_2_6(Start2,_)) :- Start1=<Start2.

generate_neg_globally_cuban_revolution_during_2_6([]).

generate_neg_globally_cuban_revolution_during_2_6([(Start,End) | Tail]) :- assert(neg_globally_cuban_revolution_during_2_6(Start,End)), generate_neg_globally_cuban_revolution_during_2_6(Tail).

sort_globally_cuban_revolution_during_2_6(SortedIntervals) :- findall((Start,End),globally_cuban_revolution_during_2_6(Start,End),UnsortedIntervals), predsort(compare_globally_cuban_revolution_during_2_6,UnsortedIntervals,SortedIntervals).

generate_neg_globally_cuban_revolution_during_2_6_aux() :- sort_globally_cuban_revolution_during_2_6(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_cuban_revolution_during_2_6(NegatedIntervals).

neg_globally_cuban_revolution_during_2_6_at_83(Res) :- setof((Start,End),neg_globally_cuban_revolution_during_2_6(Start,End),AllINtervals), checkvalidity(83,AllINtervals,Res).

check_query() :- write('Query = neg_globally_cuban_revolution_during_2_6_at_83'), (neg_globally_cuban_revolution_during_2_6_at_83(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_cuban_revolution_during_2_6_aux().

