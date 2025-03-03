:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

globally_world_heavyweight_championship_rey_mysterio_during_5_10(Start,End) :- world_heavyweight_championship_rey_mysterio(Start1,End1), Start is (Start1-5), End is (End1-10), Start=<End.

compare_globally_world_heavyweight_championship_rey_mysterio_during_5_10(Dir,globally_world_heavyweight_championship_rey_mysterio_during_5_10(Start1,_),globally_world_heavyweight_championship_rey_mysterio_during_5_10(Start2,_)) :- Start1=<Start2.

generate_neg_globally_world_heavyweight_championship_rey_mysterio_during_5_10([]).

generate_neg_globally_world_heavyweight_championship_rey_mysterio_during_5_10([(Start,End) | Tail]) :- assert(neg_globally_world_heavyweight_championship_rey_mysterio_during_5_10(Start,End)), generate_neg_globally_world_heavyweight_championship_rey_mysterio_during_5_10(Tail).

sort_globally_world_heavyweight_championship_rey_mysterio_during_5_10(SortedIntervals) :- findall((Start,End),globally_world_heavyweight_championship_rey_mysterio_during_5_10(Start,End),UnsortedIntervals), predsort(compare_globally_world_heavyweight_championship_rey_mysterio_during_5_10,UnsortedIntervals,SortedIntervals).

generate_neg_globally_world_heavyweight_championship_rey_mysterio_during_5_10_aux() :- sort_globally_world_heavyweight_championship_rey_mysterio_during_5_10(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_world_heavyweight_championship_rey_mysterio_during_5_10(NegatedIntervals).

neg_globally_world_heavyweight_championship_rey_mysterio_during_5_10_at_1789(Res) :- setof((Start,End),neg_globally_world_heavyweight_championship_rey_mysterio_during_5_10(Start,End),AllINtervals), checkvalidity(1789,AllINtervals,Res).

check_query() :- write('Query = neg_globally_world_heavyweight_championship_rey_mysterio_during_5_10_at_1789'), (neg_globally_world_heavyweight_championship_rey_mysterio_during_5_10_at_1789(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_world_heavyweight_championship_rey_mysterio_during_5_10_aux().

