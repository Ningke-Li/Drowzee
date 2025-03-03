:- include('database.pl').
the_grim_adventures_of_billy___mandy(Start,End) :- begin('the_grim_adventures_of_billy___mandy',_,_,Start), end('the_grim_adventures_of_billy___mandy',_,_,End), Start=<End.

compare_the_grim_adventures_of_billy___mandy(Dir,the_grim_adventures_of_billy___mandy(Start1,_),the_grim_adventures_of_billy___mandy(Start2,_)) :- Start1=<Start2.

generate_neg_the_grim_adventures_of_billy___mandy([]).

generate_neg_the_grim_adventures_of_billy___mandy([(Start,End) | Tail]) :- assert(neg_the_grim_adventures_of_billy___mandy(Start,End)), generate_neg_the_grim_adventures_of_billy___mandy(Tail).

sort_the_grim_adventures_of_billy___mandy(SortedIntervals) :- findall((Start,End),the_grim_adventures_of_billy___mandy(Start,End),UnsortedIntervals), predsort(compare_the_grim_adventures_of_billy___mandy,UnsortedIntervals,SortedIntervals).

generate_neg_the_grim_adventures_of_billy___mandy_aux() :- sort_the_grim_adventures_of_billy___mandy(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_the_grim_adventures_of_billy___mandy(NegatedIntervals).

neg_the_grim_adventures_of_billy___mandy_at_779(Res) :- setof((Start,End),neg_the_grim_adventures_of_billy___mandy(Start,End),AllINtervals), checkvalidity(779,AllINtervals,Res).

check_query() :- write('Query = neg_the_grim_adventures_of_billy___mandy_at_779'), (neg_the_grim_adventures_of_billy___mandy_at_779(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_the_grim_adventures_of_billy___mandy_aux().

