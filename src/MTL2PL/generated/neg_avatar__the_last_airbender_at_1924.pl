:- include('database.pl').
avatar__the_last_airbender(Start,End) :- begin('avatar__the_last_airbender',_,_,Start), end('avatar__the_last_airbender',_,_,End), Start=<End.

compare_avatar__the_last_airbender(Dir,avatar__the_last_airbender(Start1,_),avatar__the_last_airbender(Start2,_)) :- Start1=<Start2.

generate_neg_avatar__the_last_airbender([]).

generate_neg_avatar__the_last_airbender([(Start,End) | Tail]) :- assert(neg_avatar__the_last_airbender(Start,End)), generate_neg_avatar__the_last_airbender(Tail).

sort_avatar__the_last_airbender(SortedIntervals) :- findall((Start,End),avatar__the_last_airbender(Start,End),UnsortedIntervals), predsort(compare_avatar__the_last_airbender,UnsortedIntervals,SortedIntervals).

generate_neg_avatar__the_last_airbender_aux() :- sort_avatar__the_last_airbender(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_avatar__the_last_airbender(NegatedIntervals).

neg_avatar__the_last_airbender_at_1924(Res) :- setof((Start,End),neg_avatar__the_last_airbender(Start,End),AllINtervals), checkvalidity(1924,AllINtervals,Res).

check_query() :- write('Query = neg_avatar__the_last_airbender_at_1924'), (neg_avatar__the_last_airbender_at_1924(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_avatar__the_last_airbender_aux().

