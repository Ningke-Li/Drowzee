:- include('database.pl').
queer_as_folk(Start,End) :- begin('queer_as_folk',_,_,Start), end('queer_as_folk',_,_,End), Start=<End.

finally_queer_as_folk_during_4_19(Start,End) :- queer_as_folk(Start1,End1), (Start1-19)=<(End1-4), Start is (Start1-19), End is (End1-4), Start=<End.

compare_finally_queer_as_folk_during_4_19(Dir,finally_queer_as_folk_during_4_19(Start1,_),finally_queer_as_folk_during_4_19(Start2,_)) :- Start1=<Start2.

generate_neg_finally_queer_as_folk_during_4_19([]).

generate_neg_finally_queer_as_folk_during_4_19([(Start,End) | Tail]) :- assert(neg_finally_queer_as_folk_during_4_19(Start,End)), generate_neg_finally_queer_as_folk_during_4_19(Tail).

sort_finally_queer_as_folk_during_4_19(SortedIntervals) :- findall((Start,End),finally_queer_as_folk_during_4_19(Start,End),UnsortedIntervals), predsort(compare_finally_queer_as_folk_during_4_19,UnsortedIntervals,SortedIntervals).

generate_neg_finally_queer_as_folk_during_4_19_aux() :- sort_finally_queer_as_folk_during_4_19(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_queer_as_folk_during_4_19(NegatedIntervals).

neg_finally_queer_as_folk_during_4_19_at_453(Res) :- setof((Start,End),neg_finally_queer_as_folk_during_4_19(Start,End),AllINtervals), checkvalidity(453,AllINtervals,Res).

check_query() :- write('Query = neg_finally_queer_as_folk_during_4_19_at_453'), (neg_finally_queer_as_folk_during_4_19_at_453(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_queer_as_folk_during_4_19_aux().

