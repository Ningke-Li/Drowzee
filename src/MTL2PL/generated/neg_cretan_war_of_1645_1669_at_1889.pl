:- include('database.pl').
cretan_war_of_1645_1669(Start,End) :- begin('cretan_war_of_1645_1669',_,_,Start), end('cretan_war_of_1645_1669',_,_,End), Start=<End.

compare_cretan_war_of_1645_1669(Dir,cretan_war_of_1645_1669(Start1,_),cretan_war_of_1645_1669(Start2,_)) :- Start1=<Start2.

generate_neg_cretan_war_of_1645_1669([]).

generate_neg_cretan_war_of_1645_1669([(Start,End) | Tail]) :- assert(neg_cretan_war_of_1645_1669(Start,End)), generate_neg_cretan_war_of_1645_1669(Tail).

sort_cretan_war_of_1645_1669(SortedIntervals) :- findall((Start,End),cretan_war_of_1645_1669(Start,End),UnsortedIntervals), predsort(compare_cretan_war_of_1645_1669,UnsortedIntervals,SortedIntervals).

generate_neg_cretan_war_of_1645_1669_aux() :- sort_cretan_war_of_1645_1669(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_cretan_war_of_1645_1669(NegatedIntervals).

neg_cretan_war_of_1645_1669_at_1889(Res) :- setof((Start,End),neg_cretan_war_of_1645_1669(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = neg_cretan_war_of_1645_1669_at_1889'), (neg_cretan_war_of_1645_1669_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_cretan_war_of_1645_1669_aux().

