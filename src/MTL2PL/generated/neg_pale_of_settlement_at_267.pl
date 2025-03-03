:- include('database.pl').
pale_of_settlement(Start,End) :- begin('pale_of_settlement',_,_,Start), end('pale_of_settlement',_,_,End), Start=<End.

compare_pale_of_settlement(Dir,pale_of_settlement(Start1,_),pale_of_settlement(Start2,_)) :- Start1=<Start2.

generate_neg_pale_of_settlement([]).

generate_neg_pale_of_settlement([(Start,End) | Tail]) :- assert(neg_pale_of_settlement(Start,End)), generate_neg_pale_of_settlement(Tail).

sort_pale_of_settlement(SortedIntervals) :- findall((Start,End),pale_of_settlement(Start,End),UnsortedIntervals), predsort(compare_pale_of_settlement,UnsortedIntervals,SortedIntervals).

generate_neg_pale_of_settlement_aux() :- sort_pale_of_settlement(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_pale_of_settlement(NegatedIntervals).

neg_pale_of_settlement_at_267(Res) :- setof((Start,End),neg_pale_of_settlement(Start,End),AllINtervals), checkvalidity(267,AllINtervals,Res).

check_query() :- write('Query = neg_pale_of_settlement_at_267'), (neg_pale_of_settlement_at_267(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_pale_of_settlement_aux().

