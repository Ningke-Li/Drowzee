:- include('database.pl').
prison_break(Start,End) :- begin('prison_break',_,_,Start), end('prison_break',_,_,End), Start=<End.

compare_prison_break(Dir,prison_break(Start1,_),prison_break(Start2,_)) :- Start1=<Start2.

generate_neg_prison_break([]).

generate_neg_prison_break([(Start,End) | Tail]) :- assert(neg_prison_break(Start,End)), generate_neg_prison_break(Tail).

sort_prison_break(SortedIntervals) :- findall((Start,End),prison_break(Start,End),UnsortedIntervals), predsort(compare_prison_break,UnsortedIntervals,SortedIntervals).

generate_neg_prison_break_aux() :- sort_prison_break(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_prison_break(NegatedIntervals).

neg_prison_break_at_1266(Res) :- setof((Start,End),neg_prison_break(Start,End),AllINtervals), checkvalidity(1266,AllINtervals,Res).

check_query() :- write('Query = neg_prison_break_at_1266'), (neg_prison_break_at_1266(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_prison_break_aux().

