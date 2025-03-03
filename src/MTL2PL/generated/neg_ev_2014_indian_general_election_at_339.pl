:- include('database.pl').
ev_2014_indian_general_election(Start,End) :- begin('ev_2014_indian_general_election',_,_,Start), end('ev_2014_indian_general_election',_,_,End), Start=<End.

compare_ev_2014_indian_general_election(Dir,ev_2014_indian_general_election(Start1,_),ev_2014_indian_general_election(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2014_indian_general_election([]).

generate_neg_ev_2014_indian_general_election([(Start,End) | Tail]) :- assert(neg_ev_2014_indian_general_election(Start,End)), generate_neg_ev_2014_indian_general_election(Tail).

sort_ev_2014_indian_general_election(SortedIntervals) :- findall((Start,End),ev_2014_indian_general_election(Start,End),UnsortedIntervals), predsort(compare_ev_2014_indian_general_election,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2014_indian_general_election_aux() :- sort_ev_2014_indian_general_election(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2014_indian_general_election(NegatedIntervals).

neg_ev_2014_indian_general_election_at_339(Res) :- setof((Start,End),neg_ev_2014_indian_general_election(Start,End),AllINtervals), checkvalidity(339,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2014_indian_general_election_at_339'), (neg_ev_2014_indian_general_election_at_339(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2014_indian_general_election_aux().

