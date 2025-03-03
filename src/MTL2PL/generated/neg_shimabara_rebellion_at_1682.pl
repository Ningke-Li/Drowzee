:- include('database.pl').
shimabara_rebellion(Start,End) :- begin('shimabara_rebellion',_,_,Start), end('shimabara_rebellion',_,_,End), Start=<End.

compare_shimabara_rebellion(Dir,shimabara_rebellion(Start1,_),shimabara_rebellion(Start2,_)) :- Start1=<Start2.

generate_neg_shimabara_rebellion([]).

generate_neg_shimabara_rebellion([(Start,End) | Tail]) :- assert(neg_shimabara_rebellion(Start,End)), generate_neg_shimabara_rebellion(Tail).

sort_shimabara_rebellion(SortedIntervals) :- findall((Start,End),shimabara_rebellion(Start,End),UnsortedIntervals), predsort(compare_shimabara_rebellion,UnsortedIntervals,SortedIntervals).

generate_neg_shimabara_rebellion_aux() :- sort_shimabara_rebellion(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_shimabara_rebellion(NegatedIntervals).

neg_shimabara_rebellion_at_1682(Res) :- setof((Start,End),neg_shimabara_rebellion(Start,End),AllINtervals), checkvalidity(1682,AllINtervals,Res).

check_query() :- write('Query = neg_shimabara_rebellion_at_1682'), (neg_shimabara_rebellion_at_1682(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_shimabara_rebellion_aux().

