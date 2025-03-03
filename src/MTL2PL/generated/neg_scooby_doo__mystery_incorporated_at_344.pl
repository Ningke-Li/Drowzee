:- include('database.pl').
scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

compare_scooby_doo__mystery_incorporated(Dir,scooby_doo__mystery_incorporated(Start1,_),scooby_doo__mystery_incorporated(Start2,_)) :- Start1=<Start2.

generate_neg_scooby_doo__mystery_incorporated([]).

generate_neg_scooby_doo__mystery_incorporated([(Start,End) | Tail]) :- assert(neg_scooby_doo__mystery_incorporated(Start,End)), generate_neg_scooby_doo__mystery_incorporated(Tail).

sort_scooby_doo__mystery_incorporated(SortedIntervals) :- findall((Start,End),scooby_doo__mystery_incorporated(Start,End),UnsortedIntervals), predsort(compare_scooby_doo__mystery_incorporated,UnsortedIntervals,SortedIntervals).

generate_neg_scooby_doo__mystery_incorporated_aux() :- sort_scooby_doo__mystery_incorporated(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_scooby_doo__mystery_incorporated(NegatedIntervals).

neg_scooby_doo__mystery_incorporated_at_344(Res) :- setof((Start,End),neg_scooby_doo__mystery_incorporated(Start,End),AllINtervals), checkvalidity(344,AllINtervals,Res).

check_query() :- write('Query = neg_scooby_doo__mystery_incorporated_at_344'), (neg_scooby_doo__mystery_incorporated_at_344(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_scooby_doo__mystery_incorporated_aux().

