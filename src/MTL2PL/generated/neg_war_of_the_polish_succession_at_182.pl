:- include('database.pl').
war_of_the_polish_succession(Start,End) :- begin('war_of_the_polish_succession',_,_,Start), end('war_of_the_polish_succession',_,_,End), Start=<End.

compare_war_of_the_polish_succession(Dir,war_of_the_polish_succession(Start1,_),war_of_the_polish_succession(Start2,_)) :- Start1=<Start2.

generate_neg_war_of_the_polish_succession([]).

generate_neg_war_of_the_polish_succession([(Start,End) | Tail]) :- assert(neg_war_of_the_polish_succession(Start,End)), generate_neg_war_of_the_polish_succession(Tail).

sort_war_of_the_polish_succession(SortedIntervals) :- findall((Start,End),war_of_the_polish_succession(Start,End),UnsortedIntervals), predsort(compare_war_of_the_polish_succession,UnsortedIntervals,SortedIntervals).

generate_neg_war_of_the_polish_succession_aux() :- sort_war_of_the_polish_succession(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_war_of_the_polish_succession(NegatedIntervals).

neg_war_of_the_polish_succession_at_182(Res) :- setof((Start,End),neg_war_of_the_polish_succession(Start,End),AllINtervals), checkvalidity(182,AllINtervals,Res).

check_query() :- write('Query = neg_war_of_the_polish_succession_at_182'), (neg_war_of_the_polish_succession_at_182(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_war_of_the_polish_succession_aux().

