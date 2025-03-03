:- include('database.pl').
first_italo_ethiopian_war(Start,End) :- begin('first_italo_ethiopian_war',_,_,Start), end('first_italo_ethiopian_war',_,_,End), Start=<End.

compare_first_italo_ethiopian_war(Dir,first_italo_ethiopian_war(Start1,_),first_italo_ethiopian_war(Start2,_)) :- Start1=<Start2.

generate_neg_first_italo_ethiopian_war([]).

generate_neg_first_italo_ethiopian_war([(Start,End) | Tail]) :- assert(neg_first_italo_ethiopian_war(Start,End)), generate_neg_first_italo_ethiopian_war(Tail).

sort_first_italo_ethiopian_war(SortedIntervals) :- findall((Start,End),first_italo_ethiopian_war(Start,End),UnsortedIntervals), predsort(compare_first_italo_ethiopian_war,UnsortedIntervals,SortedIntervals).

generate_neg_first_italo_ethiopian_war_aux() :- sort_first_italo_ethiopian_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_first_italo_ethiopian_war(NegatedIntervals).

neg_first_italo_ethiopian_war_at_1981(Res) :- setof((Start,End),neg_first_italo_ethiopian_war(Start,End),AllINtervals), checkvalidity(1981,AllINtervals,Res).

check_query() :- write('Query = neg_first_italo_ethiopian_war_at_1981'), (neg_first_italo_ethiopian_war_at_1981(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_first_italo_ethiopian_war_aux().

