:- include('database.pl').
herero_and_namaqua_genocide(Start,End) :- begin('herero_and_namaqua_genocide',_,_,Start), end('herero_and_namaqua_genocide',_,_,End), Start=<End.

globally_herero_and_namaqua_genocide_during_3_4(Start,End) :- herero_and_namaqua_genocide(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

compare_globally_herero_and_namaqua_genocide_during_3_4(Dir,globally_herero_and_namaqua_genocide_during_3_4(Start1,_),globally_herero_and_namaqua_genocide_during_3_4(Start2,_)) :- Start1=<Start2.

generate_neg_globally_herero_and_namaqua_genocide_during_3_4([]).

generate_neg_globally_herero_and_namaqua_genocide_during_3_4([(Start,End) | Tail]) :- assert(neg_globally_herero_and_namaqua_genocide_during_3_4(Start,End)), generate_neg_globally_herero_and_namaqua_genocide_during_3_4(Tail).

sort_globally_herero_and_namaqua_genocide_during_3_4(SortedIntervals) :- findall((Start,End),globally_herero_and_namaqua_genocide_during_3_4(Start,End),UnsortedIntervals), predsort(compare_globally_herero_and_namaqua_genocide_during_3_4,UnsortedIntervals,SortedIntervals).

generate_neg_globally_herero_and_namaqua_genocide_during_3_4_aux() :- sort_globally_herero_and_namaqua_genocide_during_3_4(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_herero_and_namaqua_genocide_during_3_4(NegatedIntervals).

neg_globally_herero_and_namaqua_genocide_during_3_4_at_225(Res) :- setof((Start,End),neg_globally_herero_and_namaqua_genocide_during_3_4(Start,End),AllINtervals), checkvalidity(225,AllINtervals,Res).

check_query() :- write('Query = neg_globally_herero_and_namaqua_genocide_during_3_4_at_225'), (neg_globally_herero_and_namaqua_genocide_during_3_4_at_225(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_herero_and_namaqua_genocide_during_3_4_aux().

