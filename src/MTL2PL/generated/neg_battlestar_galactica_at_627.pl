:- include('database.pl').
battlestar_galactica(Start,End) :- begin('battlestar_galactica',_,_,Start), end('battlestar_galactica',_,_,End), Start=<End.

compare_battlestar_galactica(Dir,battlestar_galactica(Start1,_),battlestar_galactica(Start2,_)) :- Start1=<Start2.

generate_neg_battlestar_galactica([]).

generate_neg_battlestar_galactica([(Start,End) | Tail]) :- assert(neg_battlestar_galactica(Start,End)), generate_neg_battlestar_galactica(Tail).

sort_battlestar_galactica(SortedIntervals) :- findall((Start,End),battlestar_galactica(Start,End),UnsortedIntervals), predsort(compare_battlestar_galactica,UnsortedIntervals,SortedIntervals).

generate_neg_battlestar_galactica_aux() :- sort_battlestar_galactica(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battlestar_galactica(NegatedIntervals).

neg_battlestar_galactica_at_627(Res) :- setof((Start,End),neg_battlestar_galactica(Start,End),AllINtervals), checkvalidity(627,AllINtervals,Res).

check_query() :- write('Query = neg_battlestar_galactica_at_627'), (neg_battlestar_galactica_at_627(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battlestar_galactica_aux().

