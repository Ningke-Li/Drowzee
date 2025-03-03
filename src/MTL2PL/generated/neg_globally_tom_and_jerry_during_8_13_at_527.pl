:- include('database.pl').
tom_and_jerry(Start,End) :- begin('tom_and_jerry',_,_,Start), end('tom_and_jerry',_,_,End), Start=<End.

globally_tom_and_jerry_during_8_13(Start,End) :- tom_and_jerry(Start1,End1), Start is (Start1-8), End is (End1-13), Start=<End.

compare_globally_tom_and_jerry_during_8_13(Dir,globally_tom_and_jerry_during_8_13(Start1,_),globally_tom_and_jerry_during_8_13(Start2,_)) :- Start1=<Start2.

generate_neg_globally_tom_and_jerry_during_8_13([]).

generate_neg_globally_tom_and_jerry_during_8_13([(Start,End) | Tail]) :- assert(neg_globally_tom_and_jerry_during_8_13(Start,End)), generate_neg_globally_tom_and_jerry_during_8_13(Tail).

sort_globally_tom_and_jerry_during_8_13(SortedIntervals) :- findall((Start,End),globally_tom_and_jerry_during_8_13(Start,End),UnsortedIntervals), predsort(compare_globally_tom_and_jerry_during_8_13,UnsortedIntervals,SortedIntervals).

generate_neg_globally_tom_and_jerry_during_8_13_aux() :- sort_globally_tom_and_jerry_during_8_13(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_tom_and_jerry_during_8_13(NegatedIntervals).

neg_globally_tom_and_jerry_during_8_13_at_527(Res) :- setof((Start,End),neg_globally_tom_and_jerry_during_8_13(Start,End),AllINtervals), checkvalidity(527,AllINtervals,Res).

check_query() :- write('Query = neg_globally_tom_and_jerry_during_8_13_at_527'), (neg_globally_tom_and_jerry_during_8_13_at_527(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_tom_and_jerry_during_8_13_aux().

