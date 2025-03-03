:- include('database.pl').
sinking_of_the_rms_titanic(Start,End) :- begin('sinking_of_the_rms_titanic',_,_,Start), end('sinking_of_the_rms_titanic',_,_,End), Start=<End.

compare_sinking_of_the_rms_titanic(Dir,sinking_of_the_rms_titanic(Start1,_),sinking_of_the_rms_titanic(Start2,_)) :- Start1=<Start2.

generate_neg_sinking_of_the_rms_titanic([]).

generate_neg_sinking_of_the_rms_titanic([(Start,End) | Tail]) :- assert(neg_sinking_of_the_rms_titanic(Start,End)), generate_neg_sinking_of_the_rms_titanic(Tail).

sort_sinking_of_the_rms_titanic(SortedIntervals) :- findall((Start,End),sinking_of_the_rms_titanic(Start,End),UnsortedIntervals), predsort(compare_sinking_of_the_rms_titanic,UnsortedIntervals,SortedIntervals).

generate_neg_sinking_of_the_rms_titanic_aux() :- sort_sinking_of_the_rms_titanic(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_sinking_of_the_rms_titanic(NegatedIntervals).

neg_sinking_of_the_rms_titanic_at_1830(Res) :- setof((Start,End),neg_sinking_of_the_rms_titanic(Start,End),AllINtervals), checkvalidity(1830,AllINtervals,Res).

check_query() :- write('Query = neg_sinking_of_the_rms_titanic_at_1830'), (neg_sinking_of_the_rms_titanic_at_1830(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_sinking_of_the_rms_titanic_aux().

