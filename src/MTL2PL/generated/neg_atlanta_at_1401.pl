:- include('database.pl').
atlanta(Start,End) :- begin('atlanta',_,_,Start), end('atlanta',_,_,End), Start=<End.

compare_atlanta(Dir,atlanta(Start1,_),atlanta(Start2,_)) :- Start1=<Start2.

generate_neg_atlanta([]).

generate_neg_atlanta([(Start,End) | Tail]) :- assert(neg_atlanta(Start,End)), generate_neg_atlanta(Tail).

sort_atlanta(SortedIntervals) :- findall((Start,End),atlanta(Start,End),UnsortedIntervals), predsort(compare_atlanta,UnsortedIntervals,SortedIntervals).

generate_neg_atlanta_aux() :- sort_atlanta(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_atlanta(NegatedIntervals).

neg_atlanta_at_1401(Res) :- setof((Start,End),neg_atlanta(Start,End),AllINtervals), checkvalidity(1401,AllINtervals,Res).

check_query() :- write('Query = neg_atlanta_at_1401'), (neg_atlanta_at_1401(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_atlanta_aux().

