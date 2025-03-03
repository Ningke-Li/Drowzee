:- include('database.pl').
better_call_saul(Start,End) :- begin('better_call_saul',_,_,Start), end('better_call_saul',_,_,End), Start=<End.

finally_better_call_saul_during_4_11(Start,End) :- better_call_saul(Start1,End1), (Start1-11)=<(End1-4), Start is (Start1-11), End is (End1-4), Start=<End.

next_finally_better_call_saul_during_4_11(Start,End) :- finally_better_call_saul_during_4_11(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_better_call_saul_during_4_11_at_2018(Res) :- setof((Start,End),next_finally_better_call_saul_during_4_11(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = next_finally_better_call_saul_during_4_11_at_2018'), (next_finally_better_call_saul_during_4_11_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).

