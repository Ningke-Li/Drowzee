:- include('database.pl').
chaco_war(Start,End) :- begin('chaco_war',_,_,Start), end('chaco_war',_,_,End), Start=<End.

compare_chaco_war(Dir,chaco_war(Start1,_),chaco_war(Start2,_)) :- Start1=<Start2.

generate_neg_chaco_war([]).

generate_neg_chaco_war([(Start,End) | Tail]) :- assert(neg_chaco_war(Start,End)), generate_neg_chaco_war(Tail).

sort_chaco_war(SortedIntervals) :- findall((Start,End),chaco_war(Start,End),UnsortedIntervals), predsort(compare_chaco_war,UnsortedIntervals,SortedIntervals).

generate_neg_chaco_war_aux() :- sort_chaco_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_chaco_war(NegatedIntervals).

neg_chaco_war_at_125(Res) :- setof((Start,End),neg_chaco_war(Start,End),AllINtervals), checkvalidity(125,AllINtervals,Res).

check_query() :- write('Query = neg_chaco_war_at_125'), (neg_chaco_war_at_125(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_chaco_war_aux().

