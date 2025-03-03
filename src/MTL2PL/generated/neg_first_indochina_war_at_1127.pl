:- include('database.pl').
first_indochina_war(Start,End) :- begin('first_indochina_war',_,_,Start), end('first_indochina_war',_,_,End), Start=<End.

compare_first_indochina_war(Dir,first_indochina_war(Start1,_),first_indochina_war(Start2,_)) :- Start1=<Start2.

generate_neg_first_indochina_war([]).

generate_neg_first_indochina_war([(Start,End) | Tail]) :- assert(neg_first_indochina_war(Start,End)), generate_neg_first_indochina_war(Tail).

sort_first_indochina_war(SortedIntervals) :- findall((Start,End),first_indochina_war(Start,End),UnsortedIntervals), predsort(compare_first_indochina_war,UnsortedIntervals,SortedIntervals).

generate_neg_first_indochina_war_aux() :- sort_first_indochina_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_first_indochina_war(NegatedIntervals).

neg_first_indochina_war_at_1127(Res) :- setof((Start,End),neg_first_indochina_war(Start,End),AllINtervals), checkvalidity(1127,AllINtervals,Res).

check_query() :- write('Query = neg_first_indochina_war_at_1127'), (neg_first_indochina_war_at_1127(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_first_indochina_war_aux().

