:- include('database.pl').
world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

globally_world_war_ii_in_yugoslavia_during_1_4(Start,End) :- world_war_ii_in_yugoslavia(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

compare_globally_world_war_ii_in_yugoslavia_during_1_4(Dir,globally_world_war_ii_in_yugoslavia_during_1_4(Start1,_),globally_world_war_ii_in_yugoslavia_during_1_4(Start2,_)) :- Start1=<Start2.

generate_neg_globally_world_war_ii_in_yugoslavia_during_1_4([]).

generate_neg_globally_world_war_ii_in_yugoslavia_during_1_4([(Start,End) | Tail]) :- assert(neg_globally_world_war_ii_in_yugoslavia_during_1_4(Start,End)), generate_neg_globally_world_war_ii_in_yugoslavia_during_1_4(Tail).

sort_globally_world_war_ii_in_yugoslavia_during_1_4(SortedIntervals) :- findall((Start,End),globally_world_war_ii_in_yugoslavia_during_1_4(Start,End),UnsortedIntervals), predsort(compare_globally_world_war_ii_in_yugoslavia_during_1_4,UnsortedIntervals,SortedIntervals).

generate_neg_globally_world_war_ii_in_yugoslavia_during_1_4_aux() :- sort_globally_world_war_ii_in_yugoslavia_during_1_4(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_world_war_ii_in_yugoslavia_during_1_4(NegatedIntervals).

neg_globally_world_war_ii_in_yugoslavia_during_1_4_at_1849(Res) :- setof((Start,End),neg_globally_world_war_ii_in_yugoslavia_during_1_4(Start,End),AllINtervals), checkvalidity(1849,AllINtervals,Res).

check_query() :- write('Query = neg_globally_world_war_ii_in_yugoslavia_during_1_4_at_1849'), (neg_globally_world_war_ii_in_yugoslavia_during_1_4_at_1849(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_world_war_ii_in_yugoslavia_during_1_4_aux().

