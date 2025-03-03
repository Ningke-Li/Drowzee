:- include('database.pl').
siege_of_belgrade(Start,End) :- begin('siege_of_belgrade',_,_,Start), end('siege_of_belgrade',_,_,End), Start=<End.

compare_siege_of_belgrade(Dir,siege_of_belgrade(Start1,_),siege_of_belgrade(Start2,_)) :- Start1=<Start2.

generate_neg_siege_of_belgrade([]).

generate_neg_siege_of_belgrade([(Start,End) | Tail]) :- assert(neg_siege_of_belgrade(Start,End)), generate_neg_siege_of_belgrade(Tail).

sort_siege_of_belgrade(SortedIntervals) :- findall((Start,End),siege_of_belgrade(Start,End),UnsortedIntervals), predsort(compare_siege_of_belgrade,UnsortedIntervals,SortedIntervals).

generate_neg_siege_of_belgrade_aux() :- sort_siege_of_belgrade(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_siege_of_belgrade(NegatedIntervals).

neg_siege_of_belgrade_at_465(Res) :- setof((Start,End),neg_siege_of_belgrade(Start,End),AllINtervals), checkvalidity(465,AllINtervals,Res).

check_query() :- write('Query = neg_siege_of_belgrade_at_465'), (neg_siege_of_belgrade_at_465(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_siege_of_belgrade_aux().

