:- include('database.pl').
pale_of_settlement(Start,End) :- begin('pale_of_settlement',_,_,Start), end('pale_of_settlement',_,_,End), Start=<End.

globally_pale_of_settlement_during_14_121(Start,End) :- pale_of_settlement(Start1,End1), Start is (Start1-14), End is (End1-121), Start=<End.

compare_globally_pale_of_settlement_during_14_121(Dir,globally_pale_of_settlement_during_14_121(Start1,_),globally_pale_of_settlement_during_14_121(Start2,_)) :- Start1=<Start2.

generate_neg_globally_pale_of_settlement_during_14_121([]).

generate_neg_globally_pale_of_settlement_during_14_121([(Start,End) | Tail]) :- assert(neg_globally_pale_of_settlement_during_14_121(Start,End)), generate_neg_globally_pale_of_settlement_during_14_121(Tail).

sort_globally_pale_of_settlement_during_14_121(SortedIntervals) :- findall((Start,End),globally_pale_of_settlement_during_14_121(Start,End),UnsortedIntervals), predsort(compare_globally_pale_of_settlement_during_14_121,UnsortedIntervals,SortedIntervals).

generate_neg_globally_pale_of_settlement_during_14_121_aux() :- sort_globally_pale_of_settlement_during_14_121(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_pale_of_settlement_during_14_121(NegatedIntervals).

neg_globally_pale_of_settlement_during_14_121_at_750(Res) :- setof((Start,End),neg_globally_pale_of_settlement_during_14_121(Start,End),AllINtervals), checkvalidity(750,AllINtervals,Res).

check_query() :- write('Query = neg_globally_pale_of_settlement_during_14_121_at_750'), (neg_globally_pale_of_settlement_during_14_121_at_750(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_pale_of_settlement_during_14_121_aux().

