:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

finally_samurai_jack_during_1_13(Start,End) :- samurai_jack(Start1,End1), (Start1-13)=<(End1-1), Start is (Start1-13), End is (End1-1), Start=<End.

compare_finally_samurai_jack_during_1_13(Dir,finally_samurai_jack_during_1_13(Start1,_),finally_samurai_jack_during_1_13(Start2,_)) :- Start1=<Start2.

generate_neg_finally_samurai_jack_during_1_13([]).

generate_neg_finally_samurai_jack_during_1_13([(Start,End) | Tail]) :- assert(neg_finally_samurai_jack_during_1_13(Start,End)), generate_neg_finally_samurai_jack_during_1_13(Tail).

sort_finally_samurai_jack_during_1_13(SortedIntervals) :- findall((Start,End),finally_samurai_jack_during_1_13(Start,End),UnsortedIntervals), predsort(compare_finally_samurai_jack_during_1_13,UnsortedIntervals,SortedIntervals).

generate_neg_finally_samurai_jack_during_1_13_aux() :- sort_finally_samurai_jack_during_1_13(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_samurai_jack_during_1_13(NegatedIntervals).

neg_finally_samurai_jack_during_1_13_at_860(Res) :- setof((Start,End),neg_finally_samurai_jack_during_1_13(Start,End),AllINtervals), checkvalidity(860,AllINtervals,Res).

check_query() :- write('Query = neg_finally_samurai_jack_during_1_13_at_860'), (neg_finally_samurai_jack_during_1_13_at_860(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_samurai_jack_during_1_13_aux().

