:- include('database.pl').
jewish_exodus_from_the_muslim_world(Start,End) :- begin('jewish_exodus_from_the_muslim_world',_,_,Start), end('jewish_exodus_from_the_muslim_world',_,_,End), Start=<End.

globally_jewish_exodus_from_the_muslim_world_during_2_38(Start,End) :- jewish_exodus_from_the_muslim_world(Start1,End1), Start is (Start1-2), End is (End1-38), Start=<End.

compare_globally_jewish_exodus_from_the_muslim_world_during_2_38(Dir,globally_jewish_exodus_from_the_muslim_world_during_2_38(Start1,_),globally_jewish_exodus_from_the_muslim_world_during_2_38(Start2,_)) :- Start1=<Start2.

generate_neg_globally_jewish_exodus_from_the_muslim_world_during_2_38([]).

generate_neg_globally_jewish_exodus_from_the_muslim_world_during_2_38([(Start,End) | Tail]) :- assert(neg_globally_jewish_exodus_from_the_muslim_world_during_2_38(Start,End)), generate_neg_globally_jewish_exodus_from_the_muslim_world_during_2_38(Tail).

sort_globally_jewish_exodus_from_the_muslim_world_during_2_38(SortedIntervals) :- findall((Start,End),globally_jewish_exodus_from_the_muslim_world_during_2_38(Start,End),UnsortedIntervals), predsort(compare_globally_jewish_exodus_from_the_muslim_world_during_2_38,UnsortedIntervals,SortedIntervals).

generate_neg_globally_jewish_exodus_from_the_muslim_world_during_2_38_aux() :- sort_globally_jewish_exodus_from_the_muslim_world_during_2_38(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_jewish_exodus_from_the_muslim_world_during_2_38(NegatedIntervals).

neg_globally_jewish_exodus_from_the_muslim_world_during_2_38_at_1821(Res) :- setof((Start,End),neg_globally_jewish_exodus_from_the_muslim_world_during_2_38(Start,End),AllINtervals), checkvalidity(1821,AllINtervals,Res).

check_query() :- write('Query = neg_globally_jewish_exodus_from_the_muslim_world_during_2_38_at_1821'), (neg_globally_jewish_exodus_from_the_muslim_world_during_2_38_at_1821(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_jewish_exodus_from_the_muslim_world_during_2_38_aux().

