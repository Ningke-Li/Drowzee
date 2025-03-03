:- include('database.pl').
downton_abbey(Start,End) :- begin('downton_abbey',_,_,Start), end('downton_abbey',_,_,End), Start=<End.

compare_downton_abbey(Dir,downton_abbey(Start1,_),downton_abbey(Start2,_)) :- Start1=<Start2.

generate_neg_downton_abbey([]).

generate_neg_downton_abbey([(Start,End) | Tail]) :- assert(neg_downton_abbey(Start,End)), generate_neg_downton_abbey(Tail).

sort_downton_abbey(SortedIntervals) :- findall((Start,End),downton_abbey(Start,End),UnsortedIntervals), predsort(compare_downton_abbey,UnsortedIntervals,SortedIntervals).

generate_neg_downton_abbey_aux() :- sort_downton_abbey(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_downton_abbey(NegatedIntervals).

neg_downton_abbey_at_1106(Res) :- setof((Start,End),neg_downton_abbey(Start,End),AllINtervals), checkvalidity(1106,AllINtervals,Res).

check_query() :- write('Query = neg_downton_abbey_at_1106'), (neg_downton_abbey_at_1106(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_downton_abbey_aux().

