:- include('database.pl').
k_the_kollwitz(Start,End) :- begin('k_the_kollwitz',_,_,Start), end('k_the_kollwitz',_,_,End), Start=<End.

globally_k_the_kollwitz_during_1_4(Start,End) :- k_the_kollwitz(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

finally_globally_k_the_kollwitz_during_1_4_during_10_15(Start,End) :- globally_k_the_kollwitz_during_1_4(Start1,End1), (Start1-15)=<(End1-10), Start is (Start1-15), End is (End1-10), Start=<End.

finally_globally_k_the_kollwitz_during_1_4_during_10_15_at_1941(Res) :- setof((Start,End),finally_globally_k_the_kollwitz_during_1_4_during_10_15(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = finally_globally_k_the_kollwitz_during_1_4_during_10_15_at_1941'), (finally_globally_k_the_kollwitz_during_1_4_during_10_15_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).

