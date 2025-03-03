:- include('database.pl').
battles_of_saratoga(Start,End) :- begin('battles_of_saratoga',_,_,Start), end('battles_of_saratoga',_,_,End), Start=<End.

compare_battles_of_saratoga(Dir,battles_of_saratoga(Start1,_),battles_of_saratoga(Start2,_)) :- Start1=<Start2.

generate_neg_battles_of_saratoga([]).

generate_neg_battles_of_saratoga([(Start,End) | Tail]) :- assert(neg_battles_of_saratoga(Start,End)), generate_neg_battles_of_saratoga(Tail).

sort_battles_of_saratoga(SortedIntervals) :- findall((Start,End),battles_of_saratoga(Start,End),UnsortedIntervals), predsort(compare_battles_of_saratoga,UnsortedIntervals,SortedIntervals).

generate_neg_battles_of_saratoga_aux() :- sort_battles_of_saratoga(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battles_of_saratoga(NegatedIntervals).

neg_battles_of_saratoga_at_154(Res) :- setof((Start,End),neg_battles_of_saratoga(Start,End),AllINtervals), checkvalidity(154,AllINtervals,Res).

check_query() :- write('Query = neg_battles_of_saratoga_at_154'), (neg_battles_of_saratoga_at_154(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battles_of_saratoga_aux().

