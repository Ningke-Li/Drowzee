:- include('database.pl').
council_of_florence(Start,End) :- begin('council_of_florence',_,_,Start), end('council_of_florence',_,_,End), Start=<End.

compare_council_of_florence(Dir,council_of_florence(Start1,_),council_of_florence(Start2,_)) :- Start1=<Start2.

generate_neg_council_of_florence([]).

generate_neg_council_of_florence([(Start,End) | Tail]) :- assert(neg_council_of_florence(Start,End)), generate_neg_council_of_florence(Tail).

sort_council_of_florence(SortedIntervals) :- findall((Start,End),council_of_florence(Start,End),UnsortedIntervals), predsort(compare_council_of_florence,UnsortedIntervals,SortedIntervals).

generate_neg_council_of_florence_aux() :- sort_council_of_florence(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_council_of_florence(NegatedIntervals).

neg_council_of_florence_at_84(Res) :- setof((Start,End),neg_council_of_florence(Start,End),AllINtervals), checkvalidity(84,AllINtervals,Res).

check_query() :- write('Query = neg_council_of_florence_at_84'), (neg_council_of_florence_at_84(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_council_of_florence_aux().

