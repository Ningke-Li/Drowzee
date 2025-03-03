:- include('database.pl').
csi__crime_scene_investigation(Start,End) :- begin('csi__crime_scene_investigation',_,_,Start), end('csi__crime_scene_investigation',_,_,End), Start=<End.

compare_csi__crime_scene_investigation(Dir,csi__crime_scene_investigation(Start1,_),csi__crime_scene_investigation(Start2,_)) :- Start1=<Start2.

generate_neg_csi__crime_scene_investigation([]).

generate_neg_csi__crime_scene_investigation([(Start,End) | Tail]) :- assert(neg_csi__crime_scene_investigation(Start,End)), generate_neg_csi__crime_scene_investigation(Tail).

sort_csi__crime_scene_investigation(SortedIntervals) :- findall((Start,End),csi__crime_scene_investigation(Start,End),UnsortedIntervals), predsort(compare_csi__crime_scene_investigation,UnsortedIntervals,SortedIntervals).

generate_neg_csi__crime_scene_investigation_aux() :- sort_csi__crime_scene_investigation(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_csi__crime_scene_investigation(NegatedIntervals).

neg_csi__crime_scene_investigation_at_1571(Res) :- setof((Start,End),neg_csi__crime_scene_investigation(Start,End),AllINtervals), checkvalidity(1571,AllINtervals,Res).

check_query() :- write('Query = neg_csi__crime_scene_investigation_at_1571'), (neg_csi__crime_scene_investigation_at_1571(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_csi__crime_scene_investigation_aux().

