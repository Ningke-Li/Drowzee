:- include('database.pl').
veep(Start,End) :- begin('veep',_,_,Start), end('veep',_,_,End), Start=<End.

compare_veep(Dir,veep(Start1,_),veep(Start2,_)) :- Start1=<Start2.

generate_neg_veep([]).

generate_neg_veep([(Start,End) | Tail]) :- assert(neg_veep(Start,End)), generate_neg_veep(Tail).

sort_veep(SortedIntervals) :- findall((Start,End),veep(Start,End),UnsortedIntervals), predsort(compare_veep,UnsortedIntervals,SortedIntervals).

generate_neg_veep_aux() :- sort_veep(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_veep(NegatedIntervals).

neg_veep_at_243(Res) :- setof((Start,End),neg_veep(Start,End),AllINtervals), checkvalidity(243,AllINtervals,Res).

check_query() :- write('Query = neg_veep_at_243'), (neg_veep_at_243(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_veep_aux().

