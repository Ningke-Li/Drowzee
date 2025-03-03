:- include('database.pl').
jim_crow_laws(Start,End) :- begin('jim_crow_laws',_,_,Start), end('jim_crow_laws',_,_,End), Start=<End.

globally_jim_crow_laws_during_47_88(Start,End) :- jim_crow_laws(Start1,End1), Start is (Start1-47), End is (End1-88), Start=<End.

compare_globally_jim_crow_laws_during_47_88(Dir,globally_jim_crow_laws_during_47_88(Start1,_),globally_jim_crow_laws_during_47_88(Start2,_)) :- Start1=<Start2.

generate_neg_globally_jim_crow_laws_during_47_88([]).

generate_neg_globally_jim_crow_laws_during_47_88([(Start,End) | Tail]) :- assert(neg_globally_jim_crow_laws_during_47_88(Start,End)), generate_neg_globally_jim_crow_laws_during_47_88(Tail).

sort_globally_jim_crow_laws_during_47_88(SortedIntervals) :- findall((Start,End),globally_jim_crow_laws_during_47_88(Start,End),UnsortedIntervals), predsort(compare_globally_jim_crow_laws_during_47_88,UnsortedIntervals,SortedIntervals).

generate_neg_globally_jim_crow_laws_during_47_88_aux() :- sort_globally_jim_crow_laws_during_47_88(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_jim_crow_laws_during_47_88(NegatedIntervals).

neg_globally_jim_crow_laws_during_47_88_at_1393(Res) :- setof((Start,End),neg_globally_jim_crow_laws_during_47_88(Start,End),AllINtervals), checkvalidity(1393,AllINtervals,Res).

check_query() :- write('Query = neg_globally_jim_crow_laws_during_47_88_at_1393'), (neg_globally_jim_crow_laws_during_47_88_at_1393(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_jim_crow_laws_during_47_88_aux().

