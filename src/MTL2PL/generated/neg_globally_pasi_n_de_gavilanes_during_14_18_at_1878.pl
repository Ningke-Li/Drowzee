:- include('database.pl').
pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

globally_pasi_n_de_gavilanes_during_14_18(Start,End) :- pasi_n_de_gavilanes(Start1,End1), Start is (Start1-14), End is (End1-18), Start=<End.

compare_globally_pasi_n_de_gavilanes_during_14_18(Dir,globally_pasi_n_de_gavilanes_during_14_18(Start1,_),globally_pasi_n_de_gavilanes_during_14_18(Start2,_)) :- Start1=<Start2.

generate_neg_globally_pasi_n_de_gavilanes_during_14_18([]).

generate_neg_globally_pasi_n_de_gavilanes_during_14_18([(Start,End) | Tail]) :- assert(neg_globally_pasi_n_de_gavilanes_during_14_18(Start,End)), generate_neg_globally_pasi_n_de_gavilanes_during_14_18(Tail).

sort_globally_pasi_n_de_gavilanes_during_14_18(SortedIntervals) :- findall((Start,End),globally_pasi_n_de_gavilanes_during_14_18(Start,End),UnsortedIntervals), predsort(compare_globally_pasi_n_de_gavilanes_during_14_18,UnsortedIntervals,SortedIntervals).

generate_neg_globally_pasi_n_de_gavilanes_during_14_18_aux() :- sort_globally_pasi_n_de_gavilanes_during_14_18(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_pasi_n_de_gavilanes_during_14_18(NegatedIntervals).

neg_globally_pasi_n_de_gavilanes_during_14_18_at_1878(Res) :- setof((Start,End),neg_globally_pasi_n_de_gavilanes_during_14_18(Start,End),AllINtervals), checkvalidity(1878,AllINtervals,Res).

check_query() :- write('Query = neg_globally_pasi_n_de_gavilanes_during_14_18_at_1878'), (neg_globally_pasi_n_de_gavilanes_during_14_18_at_1878(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_pasi_n_de_gavilanes_during_14_18_aux().

