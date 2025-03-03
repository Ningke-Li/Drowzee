:- include('database.pl').
massacres_of_poles_in_volhynia_and_eastern_galicia(Start,End) :- begin('massacres_of_poles_in_volhynia_and_eastern_galicia',_,_,Start), end('massacres_of_poles_in_volhynia_and_eastern_galicia',_,_,End), Start=<End.

compare_massacres_of_poles_in_volhynia_and_eastern_galicia(Dir,massacres_of_poles_in_volhynia_and_eastern_galicia(Start1,_),massacres_of_poles_in_volhynia_and_eastern_galicia(Start2,_)) :- Start1=<Start2.

generate_neg_massacres_of_poles_in_volhynia_and_eastern_galicia([]).

generate_neg_massacres_of_poles_in_volhynia_and_eastern_galicia([(Start,End) | Tail]) :- assert(neg_massacres_of_poles_in_volhynia_and_eastern_galicia(Start,End)), generate_neg_massacres_of_poles_in_volhynia_and_eastern_galicia(Tail).

sort_massacres_of_poles_in_volhynia_and_eastern_galicia(SortedIntervals) :- findall((Start,End),massacres_of_poles_in_volhynia_and_eastern_galicia(Start,End),UnsortedIntervals), predsort(compare_massacres_of_poles_in_volhynia_and_eastern_galicia,UnsortedIntervals,SortedIntervals).

generate_neg_massacres_of_poles_in_volhynia_and_eastern_galicia_aux() :- sort_massacres_of_poles_in_volhynia_and_eastern_galicia(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_massacres_of_poles_in_volhynia_and_eastern_galicia(NegatedIntervals).

neg_massacres_of_poles_in_volhynia_and_eastern_galicia_at_952(Res) :- setof((Start,End),neg_massacres_of_poles_in_volhynia_and_eastern_galicia(Start,End),AllINtervals), checkvalidity(952,AllINtervals,Res).

check_query() :- write('Query = neg_massacres_of_poles_in_volhynia_and_eastern_galicia_at_952'), (neg_massacres_of_poles_in_volhynia_and_eastern_galicia_at_952(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_massacres_of_poles_in_volhynia_and_eastern_galicia_aux().

