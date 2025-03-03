:- include('database.pl').
boshin_war(Start,End) :- begin('boshin_war',_,_,Start), end('boshin_war',_,_,End), Start=<End.

compare_boshin_war(Dir,boshin_war(Start1,_),boshin_war(Start2,_)) :- Start1=<Start2.

generate_neg_boshin_war([]).

generate_neg_boshin_war([(Start,End) | Tail]) :- assert(neg_boshin_war(Start,End)), generate_neg_boshin_war(Tail).

sort_boshin_war(SortedIntervals) :- findall((Start,End),boshin_war(Start,End),UnsortedIntervals), predsort(compare_boshin_war,UnsortedIntervals,SortedIntervals).

generate_neg_boshin_war_aux() :- sort_boshin_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_boshin_war(NegatedIntervals).

neg_boshin_war_at_427(Res) :- setof((Start,End),neg_boshin_war(Start,End),AllINtervals), checkvalidity(427,AllINtervals,Res).

check_query() :- write('Query = neg_boshin_war_at_427'), (neg_boshin_war_at_427(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_boshin_war_aux().

