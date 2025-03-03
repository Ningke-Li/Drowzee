:- include('database.pl').
northern_seven_years__war(Start,End) :- begin('northern_seven_years__war',_,_,Start), end('northern_seven_years__war',_,_,End), Start=<End.

compare_northern_seven_years__war(Dir,northern_seven_years__war(Start1,_),northern_seven_years__war(Start2,_)) :- Start1=<Start2.

generate_neg_northern_seven_years__war([]).

generate_neg_northern_seven_years__war([(Start,End) | Tail]) :- assert(neg_northern_seven_years__war(Start,End)), generate_neg_northern_seven_years__war(Tail).

sort_northern_seven_years__war(SortedIntervals) :- findall((Start,End),northern_seven_years__war(Start,End),UnsortedIntervals), predsort(compare_northern_seven_years__war,UnsortedIntervals,SortedIntervals).

generate_neg_northern_seven_years__war_aux() :- sort_northern_seven_years__war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_northern_seven_years__war(NegatedIntervals).

neg_northern_seven_years__war_at_1916(Res) :- setof((Start,End),neg_northern_seven_years__war(Start,End),AllINtervals), checkvalidity(1916,AllINtervals,Res).

check_query() :- write('Query = neg_northern_seven_years__war_at_1916'), (neg_northern_seven_years__war_at_1916(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_northern_seven_years__war_aux().

