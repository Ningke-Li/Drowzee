:- include('database.pl').
the_office(Start,End) :- begin('the_office',_,_,Start), end('the_office',_,_,End), Start=<End.

compare_the_office(Dir,the_office(Start1,_),the_office(Start2,_)) :- Start1=<Start2.

generate_neg_the_office([]).

generate_neg_the_office([(Start,End) | Tail]) :- assert(neg_the_office(Start,End)), generate_neg_the_office(Tail).

sort_the_office(SortedIntervals) :- findall((Start,End),the_office(Start,End),UnsortedIntervals), predsort(compare_the_office,UnsortedIntervals,SortedIntervals).

generate_neg_the_office_aux() :- sort_the_office(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_the_office(NegatedIntervals).

neg_the_office_at_267(Res) :- setof((Start,End),neg_the_office(Start,End),AllINtervals), checkvalidity(267,AllINtervals,Res).

check_query() :- write('Query = neg_the_office_at_267'), (neg_the_office_at_267(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_the_office_aux().

