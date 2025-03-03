:- include('database.pl').
hurricane_irma(Start,End) :- begin('hurricane_irma',_,_,Start), end('hurricane_irma',_,_,End), Start=<End.

compare_hurricane_irma(Dir,hurricane_irma(Start1,_),hurricane_irma(Start2,_)) :- Start1=<Start2.

generate_neg_hurricane_irma([]).

generate_neg_hurricane_irma([(Start,End) | Tail]) :- assert(neg_hurricane_irma(Start,End)), generate_neg_hurricane_irma(Tail).

sort_hurricane_irma(SortedIntervals) :- findall((Start,End),hurricane_irma(Start,End),UnsortedIntervals), predsort(compare_hurricane_irma,UnsortedIntervals,SortedIntervals).

generate_neg_hurricane_irma_aux() :- sort_hurricane_irma(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_hurricane_irma(NegatedIntervals).

neg_hurricane_irma_at_1871(Res) :- setof((Start,End),neg_hurricane_irma(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = neg_hurricane_irma_at_1871'), (neg_hurricane_irma_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_hurricane_irma_aux().

