:- include('database.pl').
codename__kids_next_door(Start,End) :- begin('codename__kids_next_door',_,_,Start), end('codename__kids_next_door',_,_,End), Start=<End.

globally_codename__kids_next_door_during_1_6(Start,End) :- codename__kids_next_door(Start1,End1), Start is (Start1-1), End is (End1-6), Start=<End.

compare_globally_codename__kids_next_door_during_1_6(Dir,globally_codename__kids_next_door_during_1_6(Start1,_),globally_codename__kids_next_door_during_1_6(Start2,_)) :- Start1=<Start2.

generate_neg_globally_codename__kids_next_door_during_1_6([]).

generate_neg_globally_codename__kids_next_door_during_1_6([(Start,End) | Tail]) :- assert(neg_globally_codename__kids_next_door_during_1_6(Start,End)), generate_neg_globally_codename__kids_next_door_during_1_6(Tail).

sort_globally_codename__kids_next_door_during_1_6(SortedIntervals) :- findall((Start,End),globally_codename__kids_next_door_during_1_6(Start,End),UnsortedIntervals), predsort(compare_globally_codename__kids_next_door_during_1_6,UnsortedIntervals,SortedIntervals).

generate_neg_globally_codename__kids_next_door_during_1_6_aux() :- sort_globally_codename__kids_next_door_during_1_6(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_codename__kids_next_door_during_1_6(NegatedIntervals).

neg_globally_codename__kids_next_door_during_1_6_at_1327(Res) :- setof((Start,End),neg_globally_codename__kids_next_door_during_1_6(Start,End),AllINtervals), checkvalidity(1327,AllINtervals,Res).

check_query() :- write('Query = neg_globally_codename__kids_next_door_during_1_6_at_1327'), (neg_globally_codename__kids_next_door_during_1_6_at_1327(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_codename__kids_next_door_during_1_6_aux().

