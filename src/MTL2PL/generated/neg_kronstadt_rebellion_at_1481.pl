:- include('database.pl').
kronstadt_rebellion(Start,End) :- begin('kronstadt_rebellion',_,_,Start), end('kronstadt_rebellion',_,_,End), Start=<End.

compare_kronstadt_rebellion(Dir,kronstadt_rebellion(Start1,_),kronstadt_rebellion(Start2,_)) :- Start1=<Start2.

generate_neg_kronstadt_rebellion([]).

generate_neg_kronstadt_rebellion([(Start,End) | Tail]) :- assert(neg_kronstadt_rebellion(Start,End)), generate_neg_kronstadt_rebellion(Tail).

sort_kronstadt_rebellion(SortedIntervals) :- findall((Start,End),kronstadt_rebellion(Start,End),UnsortedIntervals), predsort(compare_kronstadt_rebellion,UnsortedIntervals,SortedIntervals).

generate_neg_kronstadt_rebellion_aux() :- sort_kronstadt_rebellion(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_kronstadt_rebellion(NegatedIntervals).

neg_kronstadt_rebellion_at_1481(Res) :- setof((Start,End),neg_kronstadt_rebellion(Start,End),AllINtervals), checkvalidity(1481,AllINtervals,Res).

check_query() :- write('Query = neg_kronstadt_rebellion_at_1481'), (neg_kronstadt_rebellion_at_1481(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_kronstadt_rebellion_aux().

