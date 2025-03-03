:- include('database.pl').
habsburg_spain(Start,End) :- begin('habsburg_spain',_,_,Start), end('habsburg_spain',_,_,End), Start=<End.

compare_habsburg_spain(Dir,habsburg_spain(Start1,_),habsburg_spain(Start2,_)) :- Start1=<Start2.

generate_neg_habsburg_spain([]).

generate_neg_habsburg_spain([(Start,End) | Tail]) :- assert(neg_habsburg_spain(Start,End)), generate_neg_habsburg_spain(Tail).

sort_habsburg_spain(SortedIntervals) :- findall((Start,End),habsburg_spain(Start,End),UnsortedIntervals), predsort(compare_habsburg_spain,UnsortedIntervals,SortedIntervals).

generate_neg_habsburg_spain_aux() :- sort_habsburg_spain(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_habsburg_spain(NegatedIntervals).

neg_habsburg_spain_at_65(Res) :- setof((Start,End),neg_habsburg_spain(Start,End),AllINtervals), checkvalidity(65,AllINtervals,Res).

check_query() :- write('Query = neg_habsburg_spain_at_65'), (neg_habsburg_spain_at_65(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_habsburg_spain_aux().

