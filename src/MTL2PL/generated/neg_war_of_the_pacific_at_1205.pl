:- include('database.pl').
war_of_the_pacific(Start,End) :- begin('war_of_the_pacific',_,_,Start), end('war_of_the_pacific',_,_,End), Start=<End.

compare_war_of_the_pacific(Dir,war_of_the_pacific(Start1,_),war_of_the_pacific(Start2,_)) :- Start1=<Start2.

generate_neg_war_of_the_pacific([]).

generate_neg_war_of_the_pacific([(Start,End) | Tail]) :- assert(neg_war_of_the_pacific(Start,End)), generate_neg_war_of_the_pacific(Tail).

sort_war_of_the_pacific(SortedIntervals) :- findall((Start,End),war_of_the_pacific(Start,End),UnsortedIntervals), predsort(compare_war_of_the_pacific,UnsortedIntervals,SortedIntervals).

generate_neg_war_of_the_pacific_aux() :- sort_war_of_the_pacific(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_war_of_the_pacific(NegatedIntervals).

neg_war_of_the_pacific_at_1205(Res) :- setof((Start,End),neg_war_of_the_pacific(Start,End),AllINtervals), checkvalidity(1205,AllINtervals,Res).

check_query() :- write('Query = neg_war_of_the_pacific_at_1205'), (neg_war_of_the_pacific_at_1205(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_war_of_the_pacific_aux().

