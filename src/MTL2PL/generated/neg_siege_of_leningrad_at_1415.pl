:- include('database.pl').
siege_of_leningrad(Start,End) :- begin('siege_of_leningrad',_,_,Start), end('siege_of_leningrad',_,_,End), Start=<End.

compare_siege_of_leningrad(Dir,siege_of_leningrad(Start1,_),siege_of_leningrad(Start2,_)) :- Start1=<Start2.

generate_neg_siege_of_leningrad([]).

generate_neg_siege_of_leningrad([(Start,End) | Tail]) :- assert(neg_siege_of_leningrad(Start,End)), generate_neg_siege_of_leningrad(Tail).

sort_siege_of_leningrad(SortedIntervals) :- findall((Start,End),siege_of_leningrad(Start,End),UnsortedIntervals), predsort(compare_siege_of_leningrad,UnsortedIntervals,SortedIntervals).

generate_neg_siege_of_leningrad_aux() :- sort_siege_of_leningrad(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_siege_of_leningrad(NegatedIntervals).

neg_siege_of_leningrad_at_1415(Res) :- setof((Start,End),neg_siege_of_leningrad(Start,End),AllINtervals), checkvalidity(1415,AllINtervals,Res).

check_query() :- write('Query = neg_siege_of_leningrad_at_1415'), (neg_siege_of_leningrad_at_1415(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_siege_of_leningrad_aux().

