:- include('database.pl').
portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

finally_portuguese_escudo_during_8_12(Start,End) :- portuguese_escudo(Start1,End1), (Start1-12)=<(End1-8), Start is (Start1-12), End is (End1-8), Start=<End.

compare_finally_portuguese_escudo_during_8_12(Dir,finally_portuguese_escudo_during_8_12(Start1,_),finally_portuguese_escudo_during_8_12(Start2,_)) :- Start1=<Start2.

generate_neg_finally_portuguese_escudo_during_8_12([]).

generate_neg_finally_portuguese_escudo_during_8_12([(Start,End) | Tail]) :- assert(neg_finally_portuguese_escudo_during_8_12(Start,End)), generate_neg_finally_portuguese_escudo_during_8_12(Tail).

sort_finally_portuguese_escudo_during_8_12(SortedIntervals) :- findall((Start,End),finally_portuguese_escudo_during_8_12(Start,End),UnsortedIntervals), predsort(compare_finally_portuguese_escudo_during_8_12,UnsortedIntervals,SortedIntervals).

generate_neg_finally_portuguese_escudo_during_8_12_aux() :- sort_finally_portuguese_escudo_during_8_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_portuguese_escudo_during_8_12(NegatedIntervals).

neg_finally_portuguese_escudo_during_8_12_at_1257(Res) :- setof((Start,End),neg_finally_portuguese_escudo_during_8_12(Start,End),AllINtervals), checkvalidity(1257,AllINtervals,Res).

check_query() :- write('Query = neg_finally_portuguese_escudo_during_8_12_at_1257'), (neg_finally_portuguese_escudo_during_8_12_at_1257(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_portuguese_escudo_during_8_12_aux().

