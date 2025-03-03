:- include('database.pl').
siege_of_osaka(Start,End) :- begin('siege_of_osaka',_,_,Start), end('siege_of_osaka',_,_,End), Start=<End.

compare_siege_of_osaka(Dir,siege_of_osaka(Start1,_),siege_of_osaka(Start2,_)) :- Start1=<Start2.

generate_neg_siege_of_osaka([]).

generate_neg_siege_of_osaka([(Start,End) | Tail]) :- assert(neg_siege_of_osaka(Start,End)), generate_neg_siege_of_osaka(Tail).

sort_siege_of_osaka(SortedIntervals) :- findall((Start,End),siege_of_osaka(Start,End),UnsortedIntervals), predsort(compare_siege_of_osaka,UnsortedIntervals,SortedIntervals).

generate_neg_siege_of_osaka_aux() :- sort_siege_of_osaka(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_siege_of_osaka(NegatedIntervals).

neg_siege_of_osaka_at_354(Res) :- setof((Start,End),neg_siege_of_osaka(Start,End),AllINtervals), checkvalidity(354,AllINtervals,Res).

check_query() :- write('Query = neg_siege_of_osaka_at_354'), (neg_siege_of_osaka_at_354(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_siege_of_osaka_aux().

