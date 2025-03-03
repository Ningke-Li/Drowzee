:- include('database.pl').
second_industrial_revolution(Start,End) :- begin('second_industrial_revolution',_,_,Start), end('second_industrial_revolution',_,_,End), Start=<End.

compare_second_industrial_revolution(Dir,second_industrial_revolution(Start1,_),second_industrial_revolution(Start2,_)) :- Start1=<Start2.

generate_neg_second_industrial_revolution([]).

generate_neg_second_industrial_revolution([(Start,End) | Tail]) :- assert(neg_second_industrial_revolution(Start,End)), generate_neg_second_industrial_revolution(Tail).

sort_second_industrial_revolution(SortedIntervals) :- findall((Start,End),second_industrial_revolution(Start,End),UnsortedIntervals), predsort(compare_second_industrial_revolution,UnsortedIntervals,SortedIntervals).

generate_neg_second_industrial_revolution_aux() :- sort_second_industrial_revolution(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_second_industrial_revolution(NegatedIntervals).

neg_second_industrial_revolution_at_1610(Res) :- setof((Start,End),neg_second_industrial_revolution(Start,End),AllINtervals), checkvalidity(1610,AllINtervals,Res).

check_query() :- write('Query = neg_second_industrial_revolution_at_1610'), (neg_second_industrial_revolution_at_1610(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_second_industrial_revolution_aux().

