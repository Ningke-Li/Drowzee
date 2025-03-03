:- include('database.pl').
american_dragon__jake_long(Start,End) :- begin('american_dragon__jake_long',_,_,Start), end('american_dragon__jake_long',_,_,End), Start=<End.

compare_american_dragon__jake_long(Dir,american_dragon__jake_long(Start1,_),american_dragon__jake_long(Start2,_)) :- Start1=<Start2.

generate_neg_american_dragon__jake_long([]).

generate_neg_american_dragon__jake_long([(Start,End) | Tail]) :- assert(neg_american_dragon__jake_long(Start,End)), generate_neg_american_dragon__jake_long(Tail).

sort_american_dragon__jake_long(SortedIntervals) :- findall((Start,End),american_dragon__jake_long(Start,End),UnsortedIntervals), predsort(compare_american_dragon__jake_long,UnsortedIntervals,SortedIntervals).

generate_neg_american_dragon__jake_long_aux() :- sort_american_dragon__jake_long(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_american_dragon__jake_long(NegatedIntervals).

neg_american_dragon__jake_long_at_53(Res) :- setof((Start,End),neg_american_dragon__jake_long(Start,End),AllINtervals), checkvalidity(53,AllINtervals,Res).

check_query() :- write('Query = neg_american_dragon__jake_long_at_53'), (neg_american_dragon__jake_long_at_53(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_american_dragon__jake_long_aux().

