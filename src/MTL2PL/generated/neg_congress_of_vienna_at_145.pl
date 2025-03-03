:- include('database.pl').
congress_of_vienna(Start,End) :- begin('congress_of_vienna',_,_,Start), end('congress_of_vienna',_,_,End), Start=<End.

compare_congress_of_vienna(Dir,congress_of_vienna(Start1,_),congress_of_vienna(Start2,_)) :- Start1=<Start2.

generate_neg_congress_of_vienna([]).

generate_neg_congress_of_vienna([(Start,End) | Tail]) :- assert(neg_congress_of_vienna(Start,End)), generate_neg_congress_of_vienna(Tail).

sort_congress_of_vienna(SortedIntervals) :- findall((Start,End),congress_of_vienna(Start,End),UnsortedIntervals), predsort(compare_congress_of_vienna,UnsortedIntervals,SortedIntervals).

generate_neg_congress_of_vienna_aux() :- sort_congress_of_vienna(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_congress_of_vienna(NegatedIntervals).

neg_congress_of_vienna_at_145(Res) :- setof((Start,End),neg_congress_of_vienna(Start,End),AllINtervals), checkvalidity(145,AllINtervals,Res).

check_query() :- write('Query = neg_congress_of_vienna_at_145'), (neg_congress_of_vienna_at_145(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_congress_of_vienna_aux().

