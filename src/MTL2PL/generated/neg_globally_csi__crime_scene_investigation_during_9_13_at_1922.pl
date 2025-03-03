:- include('database.pl').
csi__crime_scene_investigation(Start,End) :- begin('csi__crime_scene_investigation',_,_,Start), end('csi__crime_scene_investigation',_,_,End), Start=<End.

globally_csi__crime_scene_investigation_during_9_13(Start,End) :- csi__crime_scene_investigation(Start1,End1), Start is (Start1-9), End is (End1-13), Start=<End.

compare_globally_csi__crime_scene_investigation_during_9_13(Dir,globally_csi__crime_scene_investigation_during_9_13(Start1,_),globally_csi__crime_scene_investigation_during_9_13(Start2,_)) :- Start1=<Start2.

generate_neg_globally_csi__crime_scene_investigation_during_9_13([]).

generate_neg_globally_csi__crime_scene_investigation_during_9_13([(Start,End) | Tail]) :- assert(neg_globally_csi__crime_scene_investigation_during_9_13(Start,End)), generate_neg_globally_csi__crime_scene_investigation_during_9_13(Tail).

sort_globally_csi__crime_scene_investigation_during_9_13(SortedIntervals) :- findall((Start,End),globally_csi__crime_scene_investigation_during_9_13(Start,End),UnsortedIntervals), predsort(compare_globally_csi__crime_scene_investigation_during_9_13,UnsortedIntervals,SortedIntervals).

generate_neg_globally_csi__crime_scene_investigation_during_9_13_aux() :- sort_globally_csi__crime_scene_investigation_during_9_13(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_csi__crime_scene_investigation_during_9_13(NegatedIntervals).

neg_globally_csi__crime_scene_investigation_during_9_13_at_1922(Res) :- setof((Start,End),neg_globally_csi__crime_scene_investigation_during_9_13(Start,End),AllINtervals), checkvalidity(1922,AllINtervals,Res).

check_query() :- write('Query = neg_globally_csi__crime_scene_investigation_during_9_13_at_1922'), (neg_globally_csi__crime_scene_investigation_during_9_13_at_1922(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_csi__crime_scene_investigation_during_9_13_aux().

