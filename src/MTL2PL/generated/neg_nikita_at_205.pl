:- include('database.pl').
nikita(Start,End) :- begin('nikita',_,_,Start), end('nikita',_,_,End), Start=<End.

compare_nikita(Dir,nikita(Start1,_),nikita(Start2,_)) :- Start1=<Start2.

generate_neg_nikita([]).

generate_neg_nikita([(Start,End) | Tail]) :- assert(neg_nikita(Start,End)), generate_neg_nikita(Tail).

sort_nikita(SortedIntervals) :- findall((Start,End),nikita(Start,End),UnsortedIntervals), predsort(compare_nikita,UnsortedIntervals,SortedIntervals).

generate_neg_nikita_aux() :- sort_nikita(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_nikita(NegatedIntervals).

neg_nikita_at_205(Res) :- setof((Start,End),neg_nikita(Start,End),AllINtervals), checkvalidity(205,AllINtervals,Res).

check_query() :- write('Query = neg_nikita_at_205'), (neg_nikita_at_205(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_nikita_aux().

