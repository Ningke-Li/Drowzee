:- include('database.pl').
granada_war(Start,End) :- begin('granada_war',_,_,Start), end('granada_war',_,_,End), Start=<End.

compare_granada_war(Dir,granada_war(Start1,_),granada_war(Start2,_)) :- Start1=<Start2.

generate_neg_granada_war([]).

generate_neg_granada_war([(Start,End) | Tail]) :- assert(neg_granada_war(Start,End)), generate_neg_granada_war(Tail).

sort_granada_war(SortedIntervals) :- findall((Start,End),granada_war(Start,End),UnsortedIntervals), predsort(compare_granada_war,UnsortedIntervals,SortedIntervals).

generate_neg_granada_war_aux() :- sort_granada_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_granada_war(NegatedIntervals).

neg_granada_war_at_1223(Res) :- setof((Start,End),neg_granada_war(Start,End),AllINtervals), checkvalidity(1223,AllINtervals,Res).

check_query() :- write('Query = neg_granada_war_at_1223'), (neg_granada_war_at_1223(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_granada_war_aux().

