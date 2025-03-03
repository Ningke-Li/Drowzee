:- include('database.pl').
iron_fist(Start,End) :- begin('iron_fist',_,_,Start), end('iron_fist',_,_,End), Start=<End.

compare_iron_fist(Dir,iron_fist(Start1,_),iron_fist(Start2,_)) :- Start1=<Start2.

generate_neg_iron_fist([]).

generate_neg_iron_fist([(Start,End) | Tail]) :- assert(neg_iron_fist(Start,End)), generate_neg_iron_fist(Tail).

sort_iron_fist(SortedIntervals) :- findall((Start,End),iron_fist(Start,End),UnsortedIntervals), predsort(compare_iron_fist,UnsortedIntervals,SortedIntervals).

generate_neg_iron_fist_aux() :- sort_iron_fist(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_iron_fist(NegatedIntervals).

neg_iron_fist_at_1265(Res) :- setof((Start,End),neg_iron_fist(Start,End),AllINtervals), checkvalidity(1265,AllINtervals,Res).

check_query() :- write('Query = neg_iron_fist_at_1265'), (neg_iron_fist_at_1265(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_iron_fist_aux().

