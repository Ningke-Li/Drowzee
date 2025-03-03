:- include('database.pl').
ev_2002_french_presidential_election(Start,End) :- begin('ev_2002_french_presidential_election',_,_,Start), end('ev_2002_french_presidential_election',_,_,End), Start=<End.

compare_ev_2002_french_presidential_election(Dir,ev_2002_french_presidential_election(Start1,_),ev_2002_french_presidential_election(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2002_french_presidential_election([]).

generate_neg_ev_2002_french_presidential_election([(Start,End) | Tail]) :- assert(neg_ev_2002_french_presidential_election(Start,End)), generate_neg_ev_2002_french_presidential_election(Tail).

sort_ev_2002_french_presidential_election(SortedIntervals) :- findall((Start,End),ev_2002_french_presidential_election(Start,End),UnsortedIntervals), predsort(compare_ev_2002_french_presidential_election,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2002_french_presidential_election_aux() :- sort_ev_2002_french_presidential_election(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2002_french_presidential_election(NegatedIntervals).

neg_ev_2002_french_presidential_election_at_1482(Res) :- setof((Start,End),neg_ev_2002_french_presidential_election(Start,End),AllINtervals), checkvalidity(1482,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2002_french_presidential_election_at_1482'), (neg_ev_2002_french_presidential_election_at_1482(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2002_french_presidential_election_aux().

