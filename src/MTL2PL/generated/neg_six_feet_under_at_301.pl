:- include('database.pl').
six_feet_under(Start,End) :- begin('six_feet_under',_,_,Start), end('six_feet_under',_,_,End), Start=<End.

compare_six_feet_under(Dir,six_feet_under(Start1,_),six_feet_under(Start2,_)) :- Start1=<Start2.

generate_neg_six_feet_under([]).

generate_neg_six_feet_under([(Start,End) | Tail]) :- assert(neg_six_feet_under(Start,End)), generate_neg_six_feet_under(Tail).

sort_six_feet_under(SortedIntervals) :- findall((Start,End),six_feet_under(Start,End),UnsortedIntervals), predsort(compare_six_feet_under,UnsortedIntervals,SortedIntervals).

generate_neg_six_feet_under_aux() :- sort_six_feet_under(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_six_feet_under(NegatedIntervals).

neg_six_feet_under_at_301(Res) :- setof((Start,End),neg_six_feet_under(Start,End),AllINtervals), checkvalidity(301,AllINtervals,Res).

check_query() :- write('Query = neg_six_feet_under_at_301'), (neg_six_feet_under_at_301(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_six_feet_under_aux().

