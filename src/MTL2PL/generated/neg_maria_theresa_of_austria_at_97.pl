:- include('database.pl').
maria_theresa_of_austria(Start,End) :- begin('maria_theresa_of_austria',_,_,Start), end('maria_theresa_of_austria',_,_,End), Start=<End.

compare_maria_theresa_of_austria(Dir,maria_theresa_of_austria(Start1,_),maria_theresa_of_austria(Start2,_)) :- Start1=<Start2.

generate_neg_maria_theresa_of_austria([]).

generate_neg_maria_theresa_of_austria([(Start,End) | Tail]) :- assert(neg_maria_theresa_of_austria(Start,End)), generate_neg_maria_theresa_of_austria(Tail).

sort_maria_theresa_of_austria(SortedIntervals) :- findall((Start,End),maria_theresa_of_austria(Start,End),UnsortedIntervals), predsort(compare_maria_theresa_of_austria,UnsortedIntervals,SortedIntervals).

generate_neg_maria_theresa_of_austria_aux() :- sort_maria_theresa_of_austria(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_maria_theresa_of_austria(NegatedIntervals).

neg_maria_theresa_of_austria_at_97(Res) :- setof((Start,End),neg_maria_theresa_of_austria(Start,End),AllINtervals), checkvalidity(97,AllINtervals,Res).

check_query() :- write('Query = neg_maria_theresa_of_austria_at_97'), (neg_maria_theresa_of_austria_at_97(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_maria_theresa_of_austria_aux().

