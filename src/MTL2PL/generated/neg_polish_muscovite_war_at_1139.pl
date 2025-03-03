:- include('database.pl').
polish_muscovite_war(Start,End) :- begin('polish_muscovite_war',_,_,Start), end('polish_muscovite_war',_,_,End), Start=<End.

compare_polish_muscovite_war(Dir,polish_muscovite_war(Start1,_),polish_muscovite_war(Start2,_)) :- Start1=<Start2.

generate_neg_polish_muscovite_war([]).

generate_neg_polish_muscovite_war([(Start,End) | Tail]) :- assert(neg_polish_muscovite_war(Start,End)), generate_neg_polish_muscovite_war(Tail).

sort_polish_muscovite_war(SortedIntervals) :- findall((Start,End),polish_muscovite_war(Start,End),UnsortedIntervals), predsort(compare_polish_muscovite_war,UnsortedIntervals,SortedIntervals).

generate_neg_polish_muscovite_war_aux() :- sort_polish_muscovite_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_polish_muscovite_war(NegatedIntervals).

neg_polish_muscovite_war_at_1139(Res) :- setof((Start,End),neg_polish_muscovite_war(Start,End),AllINtervals), checkvalidity(1139,AllINtervals,Res).

check_query() :- write('Query = neg_polish_muscovite_war_at_1139'), (neg_polish_muscovite_war_at_1139(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_polish_muscovite_war_aux().

