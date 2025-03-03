:- include('database.pl').
war_of_the_second_coalition(Start,End) :- begin('war_of_the_second_coalition',_,_,Start), end('war_of_the_second_coalition',_,_,End), Start=<End.

compare_war_of_the_second_coalition(Dir,war_of_the_second_coalition(Start1,_),war_of_the_second_coalition(Start2,_)) :- Start1=<Start2.

generate_neg_war_of_the_second_coalition([]).

generate_neg_war_of_the_second_coalition([(Start,End) | Tail]) :- assert(neg_war_of_the_second_coalition(Start,End)), generate_neg_war_of_the_second_coalition(Tail).

sort_war_of_the_second_coalition(SortedIntervals) :- findall((Start,End),war_of_the_second_coalition(Start,End),UnsortedIntervals), predsort(compare_war_of_the_second_coalition,UnsortedIntervals,SortedIntervals).

generate_neg_war_of_the_second_coalition_aux() :- sort_war_of_the_second_coalition(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_war_of_the_second_coalition(NegatedIntervals).

neg_war_of_the_second_coalition_at_1781(Res) :- setof((Start,End),neg_war_of_the_second_coalition(Start,End),AllINtervals), checkvalidity(1781,AllINtervals,Res).

check_query() :- write('Query = neg_war_of_the_second_coalition_at_1781'), (neg_war_of_the_second_coalition_at_1781(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_war_of_the_second_coalition_aux().

