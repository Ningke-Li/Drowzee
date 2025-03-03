:- include('database.pl').
casablanca_conference(Start,End) :- begin('casablanca_conference',_,_,Start), end('casablanca_conference',_,_,End), Start=<End.

compare_casablanca_conference(Dir,casablanca_conference(Start1,_),casablanca_conference(Start2,_)) :- Start1=<Start2.

generate_neg_casablanca_conference([]).

generate_neg_casablanca_conference([(Start,End) | Tail]) :- assert(neg_casablanca_conference(Start,End)), generate_neg_casablanca_conference(Tail).

sort_casablanca_conference(SortedIntervals) :- findall((Start,End),casablanca_conference(Start,End),UnsortedIntervals), predsort(compare_casablanca_conference,UnsortedIntervals,SortedIntervals).

generate_neg_casablanca_conference_aux() :- sort_casablanca_conference(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_casablanca_conference(NegatedIntervals).

neg_casablanca_conference_at_1889(Res) :- setof((Start,End),neg_casablanca_conference(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = neg_casablanca_conference_at_1889'), (neg_casablanca_conference_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_casablanca_conference_aux().

