:- include('database.pl').
great_northern_war(Start,End) :- begin('great_northern_war',_,_,Start), end('great_northern_war',_,_,End), Start=<End.

compare_great_northern_war(Dir,great_northern_war(Start1,_),great_northern_war(Start2,_)) :- Start1=<Start2.

generate_neg_great_northern_war([]).

generate_neg_great_northern_war([(Start,End) | Tail]) :- assert(neg_great_northern_war(Start,End)), generate_neg_great_northern_war(Tail).

sort_great_northern_war(SortedIntervals) :- findall((Start,End),great_northern_war(Start,End),UnsortedIntervals), predsort(compare_great_northern_war,UnsortedIntervals,SortedIntervals).

generate_neg_great_northern_war_aux() :- sort_great_northern_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_great_northern_war(NegatedIntervals).

neg_great_northern_war_at_854(Res) :- setof((Start,End),neg_great_northern_war(Start,End),AllINtervals), checkvalidity(854,AllINtervals,Res).

check_query() :- write('Query = neg_great_northern_war_at_854'), (neg_great_northern_war_at_854(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_great_northern_war_aux().

