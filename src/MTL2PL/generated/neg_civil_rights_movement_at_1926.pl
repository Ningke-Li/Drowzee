:- include('database.pl').
civil_rights_movement(Start,End) :- begin('civil_rights_movement',_,_,Start), end('civil_rights_movement',_,_,End), Start=<End.

compare_civil_rights_movement(Dir,civil_rights_movement(Start1,_),civil_rights_movement(Start2,_)) :- Start1=<Start2.

generate_neg_civil_rights_movement([]).

generate_neg_civil_rights_movement([(Start,End) | Tail]) :- assert(neg_civil_rights_movement(Start,End)), generate_neg_civil_rights_movement(Tail).

sort_civil_rights_movement(SortedIntervals) :- findall((Start,End),civil_rights_movement(Start,End),UnsortedIntervals), predsort(compare_civil_rights_movement,UnsortedIntervals,SortedIntervals).

generate_neg_civil_rights_movement_aux() :- sort_civil_rights_movement(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_civil_rights_movement(NegatedIntervals).

neg_civil_rights_movement_at_1926(Res) :- setof((Start,End),neg_civil_rights_movement(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = neg_civil_rights_movement_at_1926'), (neg_civil_rights_movement_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_civil_rights_movement_aux().

