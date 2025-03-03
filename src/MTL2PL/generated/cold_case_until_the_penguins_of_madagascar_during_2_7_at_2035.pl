:- include('database.pl').
cold_case(Start,End) :- begin('cold_case',_,_,Start), end('cold_case',_,_,End), Start=<End.

the_penguins_of_madagascar(Start,End) :- begin('the_penguins_of_madagascar',_,_,Start), end('the_penguins_of_madagascar',_,_,End), Start=<End.

cold_case_last_till_2_7(Start,End) :- cold_case(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

cold_case_until_the_penguins_of_madagascar_during_2_7_overlap(Start,End) :- cold_case_last_till_2_7(Start1,End1), the_penguins_of_madagascar(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

cold_case_until_the_penguins_of_madagascar_during_2_7(Start,End) :- cold_case(W1,_), cold_case_until_the_penguins_of_madagascar_during_2_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-2), Start=<End.

cold_case_until_the_penguins_of_madagascar_during_2_7_at_2035(Res) :- setof((Start,End),cold_case_until_the_penguins_of_madagascar_during_2_7(Start,End),AllINtervals), checkvalidity(2035,AllINtervals,Res).

check_query() :- write('Query = cold_case_until_the_penguins_of_madagascar_during_2_7_at_2035'), (cold_case_until_the_penguins_of_madagascar_during_2_7_at_2035(true) -> write('\nRes   = true');write('\nRes   = false')).

