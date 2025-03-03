:- include('database.pl').
operation_spring_awakening(Start,End) :- begin('operation_spring_awakening',_,_,Start), end('operation_spring_awakening',_,_,End), Start=<End.

compare_operation_spring_awakening(Dir,operation_spring_awakening(Start1,_),operation_spring_awakening(Start2,_)) :- Start1=<Start2.

generate_neg_operation_spring_awakening([]).

generate_neg_operation_spring_awakening([(Start,End) | Tail]) :- assert(neg_operation_spring_awakening(Start,End)), generate_neg_operation_spring_awakening(Tail).

sort_operation_spring_awakening(SortedIntervals) :- findall((Start,End),operation_spring_awakening(Start,End),UnsortedIntervals), predsort(compare_operation_spring_awakening,UnsortedIntervals,SortedIntervals).

generate_neg_operation_spring_awakening_aux() :- sort_operation_spring_awakening(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_operation_spring_awakening(NegatedIntervals).

neg_operation_spring_awakening_at_1871(Res) :- setof((Start,End),neg_operation_spring_awakening(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = neg_operation_spring_awakening_at_1871'), (neg_operation_spring_awakening_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_operation_spring_awakening_aux().

