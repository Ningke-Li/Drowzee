:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

finally_samurai_jack_during_8_19(Start,End) :- samurai_jack(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

compare_finally_samurai_jack_during_8_19(Dir,finally_samurai_jack_during_8_19(Start1,_),finally_samurai_jack_during_8_19(Start2,_)) :- Start1=<Start2.

generate_neg_finally_samurai_jack_during_8_19([]).

generate_neg_finally_samurai_jack_during_8_19([(Start,End) | Tail]) :- assert(neg_finally_samurai_jack_during_8_19(Start,End)), generate_neg_finally_samurai_jack_during_8_19(Tail).

sort_finally_samurai_jack_during_8_19(SortedIntervals) :- findall((Start,End),finally_samurai_jack_during_8_19(Start,End),UnsortedIntervals), predsort(compare_finally_samurai_jack_during_8_19,UnsortedIntervals,SortedIntervals).

generate_neg_finally_samurai_jack_during_8_19_aux() :- sort_finally_samurai_jack_during_8_19(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_samurai_jack_during_8_19(NegatedIntervals).

neg_finally_samurai_jack_during_8_19_at_1872(Res) :- setof((Start,End),neg_finally_samurai_jack_during_8_19(Start,End),AllINtervals), checkvalidity(1872,AllINtervals,Res).

check_query() :- write('Query = neg_finally_samurai_jack_during_8_19_at_1872'), (neg_finally_samurai_jack_during_8_19_at_1872(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_samurai_jack_during_8_19_aux().

