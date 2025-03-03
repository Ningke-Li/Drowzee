:- include('database.pl').
soviet_invasion_of_poland(Start,End) :- begin('soviet_invasion_of_poland',_,_,Start), end('soviet_invasion_of_poland',_,_,End), Start=<End.

compare_soviet_invasion_of_poland(Dir,soviet_invasion_of_poland(Start1,_),soviet_invasion_of_poland(Start2,_)) :- Start1=<Start2.

generate_neg_soviet_invasion_of_poland([]).

generate_neg_soviet_invasion_of_poland([(Start,End) | Tail]) :- assert(neg_soviet_invasion_of_poland(Start,End)), generate_neg_soviet_invasion_of_poland(Tail).

sort_soviet_invasion_of_poland(SortedIntervals) :- findall((Start,End),soviet_invasion_of_poland(Start,End),UnsortedIntervals), predsort(compare_soviet_invasion_of_poland,UnsortedIntervals,SortedIntervals).

generate_neg_soviet_invasion_of_poland_aux() :- sort_soviet_invasion_of_poland(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_soviet_invasion_of_poland(NegatedIntervals).

neg_soviet_invasion_of_poland_at_1751(Res) :- setof((Start,End),neg_soviet_invasion_of_poland(Start,End),AllINtervals), checkvalidity(1751,AllINtervals,Res).

check_query() :- write('Query = neg_soviet_invasion_of_poland_at_1751'), (neg_soviet_invasion_of_poland_at_1751(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_soviet_invasion_of_poland_aux().

