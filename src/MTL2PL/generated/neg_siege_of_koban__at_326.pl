:- include('database.pl').
siege_of_koban_(Start,End) :- begin('siege_of_koban_',_,_,Start), end('siege_of_koban_',_,_,End), Start=<End.

compare_siege_of_koban_(Dir,siege_of_koban_(Start1,_),siege_of_koban_(Start2,_)) :- Start1=<Start2.

generate_neg_siege_of_koban_([]).

generate_neg_siege_of_koban_([(Start,End) | Tail]) :- assert(neg_siege_of_koban_(Start,End)), generate_neg_siege_of_koban_(Tail).

sort_siege_of_koban_(SortedIntervals) :- findall((Start,End),siege_of_koban_(Start,End),UnsortedIntervals), predsort(compare_siege_of_koban_,UnsortedIntervals,SortedIntervals).

generate_neg_siege_of_koban__aux() :- sort_siege_of_koban_(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_siege_of_koban_(NegatedIntervals).

neg_siege_of_koban__at_326(Res) :- setof((Start,End),neg_siege_of_koban_(Start,End),AllINtervals), checkvalidity(326,AllINtervals,Res).

check_query() :- write('Query = neg_siege_of_koban__at_326'), (neg_siege_of_koban__at_326(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_siege_of_koban__aux().

