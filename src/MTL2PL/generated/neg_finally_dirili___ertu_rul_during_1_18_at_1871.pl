:- include('database.pl').
dirili___ertu_rul(Start,End) :- begin('dirili___ertu_rul',_,_,Start), end('dirili___ertu_rul',_,_,End), Start=<End.

finally_dirili___ertu_rul_during_1_18(Start,End) :- dirili___ertu_rul(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

compare_finally_dirili___ertu_rul_during_1_18(Dir,finally_dirili___ertu_rul_during_1_18(Start1,_),finally_dirili___ertu_rul_during_1_18(Start2,_)) :- Start1=<Start2.

generate_neg_finally_dirili___ertu_rul_during_1_18([]).

generate_neg_finally_dirili___ertu_rul_during_1_18([(Start,End) | Tail]) :- assert(neg_finally_dirili___ertu_rul_during_1_18(Start,End)), generate_neg_finally_dirili___ertu_rul_during_1_18(Tail).

sort_finally_dirili___ertu_rul_during_1_18(SortedIntervals) :- findall((Start,End),finally_dirili___ertu_rul_during_1_18(Start,End),UnsortedIntervals), predsort(compare_finally_dirili___ertu_rul_during_1_18,UnsortedIntervals,SortedIntervals).

generate_neg_finally_dirili___ertu_rul_during_1_18_aux() :- sort_finally_dirili___ertu_rul_during_1_18(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_dirili___ertu_rul_during_1_18(NegatedIntervals).

neg_finally_dirili___ertu_rul_during_1_18_at_1871(Res) :- setof((Start,End),neg_finally_dirili___ertu_rul_during_1_18(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = neg_finally_dirili___ertu_rul_during_1_18_at_1871'), (neg_finally_dirili___ertu_rul_during_1_18_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_dirili___ertu_rul_during_1_18_aux().

