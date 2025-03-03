:- include('database.pl').
wikipedia_asian_month_2015(Start,End) :- begin('wikipedia_asian_month_2015',_,_,Start), end('wikipedia_asian_month_2015',_,_,End), Start=<End.

compare_wikipedia_asian_month_2015(Dir,wikipedia_asian_month_2015(Start1,_),wikipedia_asian_month_2015(Start2,_)) :- Start1=<Start2.

generate_neg_wikipedia_asian_month_2015([]).

generate_neg_wikipedia_asian_month_2015([(Start,End) | Tail]) :- assert(neg_wikipedia_asian_month_2015(Start,End)), generate_neg_wikipedia_asian_month_2015(Tail).

sort_wikipedia_asian_month_2015(SortedIntervals) :- findall((Start,End),wikipedia_asian_month_2015(Start,End),UnsortedIntervals), predsort(compare_wikipedia_asian_month_2015,UnsortedIntervals,SortedIntervals).

generate_neg_wikipedia_asian_month_2015_aux() :- sort_wikipedia_asian_month_2015(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_wikipedia_asian_month_2015(NegatedIntervals).

neg_wikipedia_asian_month_2015_at_40(Res) :- setof((Start,End),neg_wikipedia_asian_month_2015(Start,End),AllINtervals), checkvalidity(40,AllINtervals,Res).

check_query() :- write('Query = neg_wikipedia_asian_month_2015_at_40'), (neg_wikipedia_asian_month_2015_at_40(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_wikipedia_asian_month_2015_aux().

