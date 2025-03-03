:- include('database.pl').
cold_case(Start,End) :- begin('cold_case',_,_,Start), end('cold_case',_,_,End), Start=<End.

finally_cold_case_during_6_20(Start,End) :- cold_case(Start1,End1), (Start1-20)=<(End1-6), Start is (Start1-20), End is (End1-6), Start=<End.

globally_finally_cold_case_during_6_20_during_11_15(Start,End) :- finally_cold_case_during_6_20(Start1,End1), Start is (Start1-11), End is (End1-15), Start=<End.

globally_finally_cold_case_during_6_20_during_11_15_at_1909(Res) :- setof((Start,End),globally_finally_cold_case_during_6_20_during_11_15(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = globally_finally_cold_case_during_6_20_during_11_15_at_1909'), (globally_finally_cold_case_during_6_20_during_11_15_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).

