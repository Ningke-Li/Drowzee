:- include('database.pl').
tom_and_jerry(Start,End) :- begin('tom_and_jerry',_,_,Start), end('tom_and_jerry',_,_,End), Start=<End.

compare_tom_and_jerry(Dir,tom_and_jerry(Start1,_),tom_and_jerry(Start2,_)) :- Start1=<Start2.

generate_neg_tom_and_jerry([]).

generate_neg_tom_and_jerry([(Start,End) | Tail]) :- assert(neg_tom_and_jerry(Start,End)), generate_neg_tom_and_jerry(Tail).

sort_tom_and_jerry(SortedIntervals) :- findall((Start,End),tom_and_jerry(Start,End),UnsortedIntervals), predsort(compare_tom_and_jerry,UnsortedIntervals,SortedIntervals).

generate_neg_tom_and_jerry_aux() :- sort_tom_and_jerry(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_tom_and_jerry(NegatedIntervals).

neg_tom_and_jerry_at_246(Res) :- setof((Start,End),neg_tom_and_jerry(Start,End),AllINtervals), checkvalidity(246,AllINtervals,Res).

check_query() :- write('Query = neg_tom_and_jerry_at_246'), (neg_tom_and_jerry_at_246(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_tom_and_jerry_aux().

