:- include('database.pl').
czechoslovak_koruna(Start,End) :- begin('czechoslovak_koruna',_,_,Start), end('czechoslovak_koruna',_,_,End), Start=<End.

globally_czechoslovak_koruna_during_2_20(Start,End) :- czechoslovak_koruna(Start1,End1), Start is (Start1-2), End is (End1-20), Start=<End.

compare_globally_czechoslovak_koruna_during_2_20(Dir,globally_czechoslovak_koruna_during_2_20(Start1,_),globally_czechoslovak_koruna_during_2_20(Start2,_)) :- Start1=<Start2.

generate_neg_globally_czechoslovak_koruna_during_2_20([]).

generate_neg_globally_czechoslovak_koruna_during_2_20([(Start,End) | Tail]) :- assert(neg_globally_czechoslovak_koruna_during_2_20(Start,End)), generate_neg_globally_czechoslovak_koruna_during_2_20(Tail).

sort_globally_czechoslovak_koruna_during_2_20(SortedIntervals) :- findall((Start,End),globally_czechoslovak_koruna_during_2_20(Start,End),UnsortedIntervals), predsort(compare_globally_czechoslovak_koruna_during_2_20,UnsortedIntervals,SortedIntervals).

generate_neg_globally_czechoslovak_koruna_during_2_20_aux() :- sort_globally_czechoslovak_koruna_during_2_20(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_czechoslovak_koruna_during_2_20(NegatedIntervals).

neg_globally_czechoslovak_koruna_during_2_20_at_992(Res) :- setof((Start,End),neg_globally_czechoslovak_koruna_during_2_20(Start,End),AllINtervals), checkvalidity(992,AllINtervals,Res).

check_query() :- write('Query = neg_globally_czechoslovak_koruna_during_2_20_at_992'), (neg_globally_czechoslovak_koruna_during_2_20_at_992(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_czechoslovak_koruna_during_2_20_aux().

