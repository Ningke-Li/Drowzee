:- include('database.pl').
turkish_war_of_independence(Start,End) :- begin('turkish_war_of_independence',_,_,Start), end('turkish_war_of_independence',_,_,End), Start=<End.

compare_turkish_war_of_independence(Dir,turkish_war_of_independence(Start1,_),turkish_war_of_independence(Start2,_)) :- Start1=<Start2.

generate_neg_turkish_war_of_independence([]).

generate_neg_turkish_war_of_independence([(Start,End) | Tail]) :- assert(neg_turkish_war_of_independence(Start,End)), generate_neg_turkish_war_of_independence(Tail).

sort_turkish_war_of_independence(SortedIntervals) :- findall((Start,End),turkish_war_of_independence(Start,End),UnsortedIntervals), predsort(compare_turkish_war_of_independence,UnsortedIntervals,SortedIntervals).

generate_neg_turkish_war_of_independence_aux() :- sort_turkish_war_of_independence(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_turkish_war_of_independence(NegatedIntervals).

neg_turkish_war_of_independence_at_1975(Res) :- setof((Start,End),neg_turkish_war_of_independence(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = neg_turkish_war_of_independence_at_1975'), (neg_turkish_war_of_independence_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_turkish_war_of_independence_aux().

