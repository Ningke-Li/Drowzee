:- include('database.pl').
seven_years__war(Start,End) :- begin('seven_years__war',_,_,Start), end('seven_years__war',_,_,End), Start=<End.

compare_seven_years__war(Dir,seven_years__war(Start1,_),seven_years__war(Start2,_)) :- Start1=<Start2.

generate_neg_seven_years__war([]).

generate_neg_seven_years__war([(Start,End) | Tail]) :- assert(neg_seven_years__war(Start,End)), generate_neg_seven_years__war(Tail).

sort_seven_years__war(SortedIntervals) :- findall((Start,End),seven_years__war(Start,End),UnsortedIntervals), predsort(compare_seven_years__war,UnsortedIntervals,SortedIntervals).

generate_neg_seven_years__war_aux() :- sort_seven_years__war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_seven_years__war(NegatedIntervals).

neg_seven_years__war_at_1639(Res) :- setof((Start,End),neg_seven_years__war(Start,End),AllINtervals), checkvalidity(1639,AllINtervals,Res).

check_query() :- write('Query = neg_seven_years__war_at_1639'), (neg_seven_years__war_at_1639(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_seven_years__war_aux().

