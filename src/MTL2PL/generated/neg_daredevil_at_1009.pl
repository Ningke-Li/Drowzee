:- include('database.pl').
daredevil(Start,End) :- begin('daredevil',_,_,Start), end('daredevil',_,_,End), Start=<End.

compare_daredevil(Dir,daredevil(Start1,_),daredevil(Start2,_)) :- Start1=<Start2.

generate_neg_daredevil([]).

generate_neg_daredevil([(Start,End) | Tail]) :- assert(neg_daredevil(Start,End)), generate_neg_daredevil(Tail).

sort_daredevil(SortedIntervals) :- findall((Start,End),daredevil(Start,End),UnsortedIntervals), predsort(compare_daredevil,UnsortedIntervals,SortedIntervals).

generate_neg_daredevil_aux() :- sort_daredevil(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_daredevil(NegatedIntervals).

neg_daredevil_at_1009(Res) :- setof((Start,End),neg_daredevil(Start,End),AllINtervals), checkvalidity(1009,AllINtervals,Res).

check_query() :- write('Query = neg_daredevil_at_1009'), (neg_daredevil_at_1009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_daredevil_aux().

