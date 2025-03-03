:- include('database.pl').
siege_of_warsaw(Start,End) :- begin('siege_of_warsaw',_,_,Start), end('siege_of_warsaw',_,_,End), Start=<End.

compare_siege_of_warsaw(Dir,siege_of_warsaw(Start1,_),siege_of_warsaw(Start2,_)) :- Start1=<Start2.

generate_neg_siege_of_warsaw([]).

generate_neg_siege_of_warsaw([(Start,End) | Tail]) :- assert(neg_siege_of_warsaw(Start,End)), generate_neg_siege_of_warsaw(Tail).

sort_siege_of_warsaw(SortedIntervals) :- findall((Start,End),siege_of_warsaw(Start,End),UnsortedIntervals), predsort(compare_siege_of_warsaw,UnsortedIntervals,SortedIntervals).

generate_neg_siege_of_warsaw_aux() :- sort_siege_of_warsaw(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_siege_of_warsaw(NegatedIntervals).

neg_siege_of_warsaw_at_977(Res) :- setof((Start,End),neg_siege_of_warsaw(Start,End),AllINtervals), checkvalidity(977,AllINtervals,Res).

check_query() :- write('Query = neg_siege_of_warsaw_at_977'), (neg_siege_of_warsaw_at_977(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_siege_of_warsaw_aux().

