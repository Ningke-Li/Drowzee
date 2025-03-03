:- include('database.pl').
servant_of_the_people(Start,End) :- begin('servant_of_the_people',_,_,Start), end('servant_of_the_people',_,_,End), Start=<End.

compare_servant_of_the_people(Dir,servant_of_the_people(Start1,_),servant_of_the_people(Start2,_)) :- Start1=<Start2.

generate_neg_servant_of_the_people([]).

generate_neg_servant_of_the_people([(Start,End) | Tail]) :- assert(neg_servant_of_the_people(Start,End)), generate_neg_servant_of_the_people(Tail).

sort_servant_of_the_people(SortedIntervals) :- findall((Start,End),servant_of_the_people(Start,End),UnsortedIntervals), predsort(compare_servant_of_the_people,UnsortedIntervals,SortedIntervals).

generate_neg_servant_of_the_people_aux() :- sort_servant_of_the_people(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_servant_of_the_people(NegatedIntervals).

neg_servant_of_the_people_at_1213(Res) :- setof((Start,End),neg_servant_of_the_people(Start,End),AllINtervals), checkvalidity(1213,AllINtervals,Res).

check_query() :- write('Query = neg_servant_of_the_people_at_1213'), (neg_servant_of_the_people_at_1213(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_servant_of_the_people_aux().

