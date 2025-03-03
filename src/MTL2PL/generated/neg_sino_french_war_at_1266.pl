:- include('database.pl').
sino_french_war(Start,End) :- begin('sino_french_war',_,_,Start), end('sino_french_war',_,_,End), Start=<End.

compare_sino_french_war(Dir,sino_french_war(Start1,_),sino_french_war(Start2,_)) :- Start1=<Start2.

generate_neg_sino_french_war([]).

generate_neg_sino_french_war([(Start,End) | Tail]) :- assert(neg_sino_french_war(Start,End)), generate_neg_sino_french_war(Tail).

sort_sino_french_war(SortedIntervals) :- findall((Start,End),sino_french_war(Start,End),UnsortedIntervals), predsort(compare_sino_french_war,UnsortedIntervals,SortedIntervals).

generate_neg_sino_french_war_aux() :- sort_sino_french_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_sino_french_war(NegatedIntervals).

neg_sino_french_war_at_1266(Res) :- setof((Start,End),neg_sino_french_war(Start,End),AllINtervals), checkvalidity(1266,AllINtervals,Res).

check_query() :- write('Query = neg_sino_french_war_at_1266'), (neg_sino_french_war_at_1266(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_sino_french_war_aux().

