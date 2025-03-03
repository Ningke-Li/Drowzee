:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

finally_world_heavyweight_championship_rey_mysterio_during_9_12(Start,End) :- world_heavyweight_championship_rey_mysterio(Start1,End1), (Start1-12)=<(End1-9), Start is (Start1-12), End is (End1-9), Start=<End.

compare_finally_world_heavyweight_championship_rey_mysterio_during_9_12(Dir,finally_world_heavyweight_championship_rey_mysterio_during_9_12(Start1,_),finally_world_heavyweight_championship_rey_mysterio_during_9_12(Start2,_)) :- Start1=<Start2.

generate_neg_finally_world_heavyweight_championship_rey_mysterio_during_9_12([]).

generate_neg_finally_world_heavyweight_championship_rey_mysterio_during_9_12([(Start,End) | Tail]) :- assert(neg_finally_world_heavyweight_championship_rey_mysterio_during_9_12(Start,End)), generate_neg_finally_world_heavyweight_championship_rey_mysterio_during_9_12(Tail).

sort_finally_world_heavyweight_championship_rey_mysterio_during_9_12(SortedIntervals) :- findall((Start,End),finally_world_heavyweight_championship_rey_mysterio_during_9_12(Start,End),UnsortedIntervals), predsort(compare_finally_world_heavyweight_championship_rey_mysterio_during_9_12,UnsortedIntervals,SortedIntervals).

generate_neg_finally_world_heavyweight_championship_rey_mysterio_during_9_12_aux() :- sort_finally_world_heavyweight_championship_rey_mysterio_during_9_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_world_heavyweight_championship_rey_mysterio_during_9_12(NegatedIntervals).

neg_finally_world_heavyweight_championship_rey_mysterio_during_9_12_at_1306(Res) :- setof((Start,End),neg_finally_world_heavyweight_championship_rey_mysterio_during_9_12(Start,End),AllINtervals), checkvalidity(1306,AllINtervals,Res).

check_query() :- write('Query = neg_finally_world_heavyweight_championship_rey_mysterio_during_9_12_at_1306'), (neg_finally_world_heavyweight_championship_rey_mysterio_during_9_12_at_1306(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_world_heavyweight_championship_rey_mysterio_during_9_12_aux().

