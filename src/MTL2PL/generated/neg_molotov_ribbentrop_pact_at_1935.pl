:- include('database.pl').
molotov_ribbentrop_pact(Start,End) :- begin('molotov_ribbentrop_pact',_,_,Start), end('molotov_ribbentrop_pact',_,_,End), Start=<End.

compare_molotov_ribbentrop_pact(Dir,molotov_ribbentrop_pact(Start1,_),molotov_ribbentrop_pact(Start2,_)) :- Start1=<Start2.

generate_neg_molotov_ribbentrop_pact([]).

generate_neg_molotov_ribbentrop_pact([(Start,End) | Tail]) :- assert(neg_molotov_ribbentrop_pact(Start,End)), generate_neg_molotov_ribbentrop_pact(Tail).

sort_molotov_ribbentrop_pact(SortedIntervals) :- findall((Start,End),molotov_ribbentrop_pact(Start,End),UnsortedIntervals), predsort(compare_molotov_ribbentrop_pact,UnsortedIntervals,SortedIntervals).

generate_neg_molotov_ribbentrop_pact_aux() :- sort_molotov_ribbentrop_pact(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_molotov_ribbentrop_pact(NegatedIntervals).

neg_molotov_ribbentrop_pact_at_1935(Res) :- setof((Start,End),neg_molotov_ribbentrop_pact(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = neg_molotov_ribbentrop_pact_at_1935'), (neg_molotov_ribbentrop_pact_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_molotov_ribbentrop_pact_aux().

