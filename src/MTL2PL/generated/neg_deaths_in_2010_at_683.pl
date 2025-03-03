:- include('database.pl').
deaths_in_2010(Start,End) :- begin('deaths_in_2010',_,_,Start), end('deaths_in_2010',_,_,End), Start=<End.

compare_deaths_in_2010(Dir,deaths_in_2010(Start1,_),deaths_in_2010(Start2,_)) :- Start1=<Start2.

generate_neg_deaths_in_2010([]).

generate_neg_deaths_in_2010([(Start,End) | Tail]) :- assert(neg_deaths_in_2010(Start,End)), generate_neg_deaths_in_2010(Tail).

sort_deaths_in_2010(SortedIntervals) :- findall((Start,End),deaths_in_2010(Start,End),UnsortedIntervals), predsort(compare_deaths_in_2010,UnsortedIntervals,SortedIntervals).

generate_neg_deaths_in_2010_aux() :- sort_deaths_in_2010(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_deaths_in_2010(NegatedIntervals).

neg_deaths_in_2010_at_683(Res) :- setof((Start,End),neg_deaths_in_2010(Start,End),AllINtervals), checkvalidity(683,AllINtervals,Res).

check_query() :- write('Query = neg_deaths_in_2010_at_683'), (neg_deaths_in_2010_at_683(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_deaths_in_2010_aux().

