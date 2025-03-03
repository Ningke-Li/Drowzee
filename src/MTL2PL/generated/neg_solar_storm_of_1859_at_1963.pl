:- include('database.pl').
solar_storm_of_1859(Start,End) :- begin('solar_storm_of_1859',_,_,Start), end('solar_storm_of_1859',_,_,End), Start=<End.

compare_solar_storm_of_1859(Dir,solar_storm_of_1859(Start1,_),solar_storm_of_1859(Start2,_)) :- Start1=<Start2.

generate_neg_solar_storm_of_1859([]).

generate_neg_solar_storm_of_1859([(Start,End) | Tail]) :- assert(neg_solar_storm_of_1859(Start,End)), generate_neg_solar_storm_of_1859(Tail).

sort_solar_storm_of_1859(SortedIntervals) :- findall((Start,End),solar_storm_of_1859(Start,End),UnsortedIntervals), predsort(compare_solar_storm_of_1859,UnsortedIntervals,SortedIntervals).

generate_neg_solar_storm_of_1859_aux() :- sort_solar_storm_of_1859(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_solar_storm_of_1859(NegatedIntervals).

neg_solar_storm_of_1859_at_1963(Res) :- setof((Start,End),neg_solar_storm_of_1859(Start,End),AllINtervals), checkvalidity(1963,AllINtervals,Res).

check_query() :- write('Query = neg_solar_storm_of_1859_at_1963'), (neg_solar_storm_of_1859_at_1963(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_solar_storm_of_1859_aux().

