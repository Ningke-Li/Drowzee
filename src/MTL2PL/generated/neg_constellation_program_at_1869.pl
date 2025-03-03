:- include('database.pl').
constellation_program(Start,End) :- begin('constellation_program',_,_,Start), end('constellation_program',_,_,End), Start=<End.

compare_constellation_program(Dir,constellation_program(Start1,_),constellation_program(Start2,_)) :- Start1=<Start2.

generate_neg_constellation_program([]).

generate_neg_constellation_program([(Start,End) | Tail]) :- assert(neg_constellation_program(Start,End)), generate_neg_constellation_program(Tail).

sort_constellation_program(SortedIntervals) :- findall((Start,End),constellation_program(Start,End),UnsortedIntervals), predsort(compare_constellation_program,UnsortedIntervals,SortedIntervals).

generate_neg_constellation_program_aux() :- sort_constellation_program(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_constellation_program(NegatedIntervals).

neg_constellation_program_at_1869(Res) :- setof((Start,End),neg_constellation_program(Start,End),AllINtervals), checkvalidity(1869,AllINtervals,Res).

check_query() :- write('Query = neg_constellation_program_at_1869'), (neg_constellation_program_at_1869(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_constellation_program_aux().

