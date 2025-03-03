:- include('database.pl').
tulsa_race_massacre(Start,End) :- begin('tulsa_race_massacre',_,_,Start), end('tulsa_race_massacre',_,_,End), Start=<End.

compare_tulsa_race_massacre(Dir,tulsa_race_massacre(Start1,_),tulsa_race_massacre(Start2,_)) :- Start1=<Start2.

generate_neg_tulsa_race_massacre([]).

generate_neg_tulsa_race_massacre([(Start,End) | Tail]) :- assert(neg_tulsa_race_massacre(Start,End)), generate_neg_tulsa_race_massacre(Tail).

sort_tulsa_race_massacre(SortedIntervals) :- findall((Start,End),tulsa_race_massacre(Start,End),UnsortedIntervals), predsort(compare_tulsa_race_massacre,UnsortedIntervals,SortedIntervals).

generate_neg_tulsa_race_massacre_aux() :- sort_tulsa_race_massacre(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_tulsa_race_massacre(NegatedIntervals).

neg_tulsa_race_massacre_at_527(Res) :- setof((Start,End),neg_tulsa_race_massacre(Start,End),AllINtervals), checkvalidity(527,AllINtervals,Res).

check_query() :- write('Query = neg_tulsa_race_massacre_at_527'), (neg_tulsa_race_massacre_at_527(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_tulsa_race_massacre_aux().

