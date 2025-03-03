:- include('database.pl').
portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

finally_portuguese_escudo_during_2_18(Start,End) :- portuguese_escudo(Start1,End1), (Start1-18)=<(End1-2), Start is (Start1-18), End is (End1-2), Start=<End.

compare_finally_portuguese_escudo_during_2_18(Dir,finally_portuguese_escudo_during_2_18(Start1,_),finally_portuguese_escudo_during_2_18(Start2,_)) :- Start1=<Start2.

generate_neg_finally_portuguese_escudo_during_2_18([]).

generate_neg_finally_portuguese_escudo_during_2_18([(Start,End) | Tail]) :- assert(neg_finally_portuguese_escudo_during_2_18(Start,End)), generate_neg_finally_portuguese_escudo_during_2_18(Tail).

sort_finally_portuguese_escudo_during_2_18(SortedIntervals) :- findall((Start,End),finally_portuguese_escudo_during_2_18(Start,End),UnsortedIntervals), predsort(compare_finally_portuguese_escudo_during_2_18,UnsortedIntervals,SortedIntervals).

generate_neg_finally_portuguese_escudo_during_2_18_aux() :- sort_finally_portuguese_escudo_during_2_18(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_portuguese_escudo_during_2_18(NegatedIntervals).

neg_finally_portuguese_escudo_during_2_18_at_1156(Res) :- setof((Start,End),neg_finally_portuguese_escudo_during_2_18(Start,End),AllINtervals), checkvalidity(1156,AllINtervals,Res).

check_query() :- write('Query = neg_finally_portuguese_escudo_during_2_18_at_1156'), (neg_finally_portuguese_escudo_during_2_18_at_1156(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_portuguese_escudo_during_2_18_aux().

