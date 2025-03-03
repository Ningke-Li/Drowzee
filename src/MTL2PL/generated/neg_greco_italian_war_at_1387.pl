:- include('database.pl').
greco_italian_war(Start,End) :- begin('greco_italian_war',_,_,Start), end('greco_italian_war',_,_,End), Start=<End.

compare_greco_italian_war(Dir,greco_italian_war(Start1,_),greco_italian_war(Start2,_)) :- Start1=<Start2.

generate_neg_greco_italian_war([]).

generate_neg_greco_italian_war([(Start,End) | Tail]) :- assert(neg_greco_italian_war(Start,End)), generate_neg_greco_italian_war(Tail).

sort_greco_italian_war(SortedIntervals) :- findall((Start,End),greco_italian_war(Start,End),UnsortedIntervals), predsort(compare_greco_italian_war,UnsortedIntervals,SortedIntervals).

generate_neg_greco_italian_war_aux() :- sort_greco_italian_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_greco_italian_war(NegatedIntervals).

neg_greco_italian_war_at_1387(Res) :- setof((Start,End),neg_greco_italian_war(Start,End),AllINtervals), checkvalidity(1387,AllINtervals,Res).

check_query() :- write('Query = neg_greco_italian_war_at_1387'), (neg_greco_italian_war_at_1387(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_greco_italian_war_aux().

