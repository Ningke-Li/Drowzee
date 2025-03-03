:- include('database.pl').
codename__kids_next_door(Start,End) :- begin('codename__kids_next_door',_,_,Start), end('codename__kids_next_door',_,_,End), Start=<End.

compare_codename__kids_next_door(Dir,codename__kids_next_door(Start1,_),codename__kids_next_door(Start2,_)) :- Start1=<Start2.

generate_neg_codename__kids_next_door([]).

generate_neg_codename__kids_next_door([(Start,End) | Tail]) :- assert(neg_codename__kids_next_door(Start,End)), generate_neg_codename__kids_next_door(Tail).

sort_codename__kids_next_door(SortedIntervals) :- findall((Start,End),codename__kids_next_door(Start,End),UnsortedIntervals), predsort(compare_codename__kids_next_door,UnsortedIntervals,SortedIntervals).

generate_neg_codename__kids_next_door_aux() :- sort_codename__kids_next_door(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_codename__kids_next_door(NegatedIntervals).

neg_codename__kids_next_door_at_1663(Res) :- setof((Start,End),neg_codename__kids_next_door(Start,End),AllINtervals), checkvalidity(1663,AllINtervals,Res).

check_query() :- write('Query = neg_codename__kids_next_door_at_1663'), (neg_codename__kids_next_door_at_1663(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_codename__kids_next_door_aux().

