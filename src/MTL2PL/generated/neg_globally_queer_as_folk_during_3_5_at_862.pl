:- include('database.pl').
queer_as_folk(Start,End) :- begin('queer_as_folk',_,_,Start), end('queer_as_folk',_,_,End), Start=<End.

globally_queer_as_folk_during_3_5(Start,End) :- queer_as_folk(Start1,End1), Start is (Start1-3), End is (End1-5), Start=<End.

compare_globally_queer_as_folk_during_3_5(Dir,globally_queer_as_folk_during_3_5(Start1,_),globally_queer_as_folk_during_3_5(Start2,_)) :- Start1=<Start2.

generate_neg_globally_queer_as_folk_during_3_5([]).

generate_neg_globally_queer_as_folk_during_3_5([(Start,End) | Tail]) :- assert(neg_globally_queer_as_folk_during_3_5(Start,End)), generate_neg_globally_queer_as_folk_during_3_5(Tail).

sort_globally_queer_as_folk_during_3_5(SortedIntervals) :- findall((Start,End),globally_queer_as_folk_during_3_5(Start,End),UnsortedIntervals), predsort(compare_globally_queer_as_folk_during_3_5,UnsortedIntervals,SortedIntervals).

generate_neg_globally_queer_as_folk_during_3_5_aux() :- sort_globally_queer_as_folk_during_3_5(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_queer_as_folk_during_3_5(NegatedIntervals).

neg_globally_queer_as_folk_during_3_5_at_862(Res) :- setof((Start,End),neg_globally_queer_as_folk_during_3_5(Start,End),AllINtervals), checkvalidity(862,AllINtervals,Res).

check_query() :- write('Query = neg_globally_queer_as_folk_during_3_5_at_862'), (neg_globally_queer_as_folk_during_3_5_at_862(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_queer_as_folk_during_3_5_aux().

