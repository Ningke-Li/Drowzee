:- include('database.pl').
camp_rock_2__the_final_jam(Start,End) :- begin('camp_rock_2__the_final_jam',_,_,Start), end('camp_rock_2__the_final_jam',_,_,End), Start=<End.

compare_camp_rock_2__the_final_jam(Dir,camp_rock_2__the_final_jam(Start1,_),camp_rock_2__the_final_jam(Start2,_)) :- Start1=<Start2.

generate_neg_camp_rock_2__the_final_jam([]).

generate_neg_camp_rock_2__the_final_jam([(Start,End) | Tail]) :- assert(neg_camp_rock_2__the_final_jam(Start,End)), generate_neg_camp_rock_2__the_final_jam(Tail).

sort_camp_rock_2__the_final_jam(SortedIntervals) :- findall((Start,End),camp_rock_2__the_final_jam(Start,End),UnsortedIntervals), predsort(compare_camp_rock_2__the_final_jam,UnsortedIntervals,SortedIntervals).

generate_neg_camp_rock_2__the_final_jam_aux() :- sort_camp_rock_2__the_final_jam(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_camp_rock_2__the_final_jam(NegatedIntervals).

neg_camp_rock_2__the_final_jam_at_847(Res) :- setof((Start,End),neg_camp_rock_2__the_final_jam(Start,End),AllINtervals), checkvalidity(847,AllINtervals,Res).

check_query() :- write('Query = neg_camp_rock_2__the_final_jam_at_847'), (neg_camp_rock_2__the_final_jam_at_847(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_camp_rock_2__the_final_jam_aux().

