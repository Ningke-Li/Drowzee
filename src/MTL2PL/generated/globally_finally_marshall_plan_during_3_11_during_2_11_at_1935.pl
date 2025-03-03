:- include('database.pl').
marshall_plan(Start,End) :- begin('marshall_plan',_,_,Start), end('marshall_plan',_,_,End), Start=<End.

finally_marshall_plan_during_3_11(Start,End) :- marshall_plan(Start1,End1), (Start1-11)=<(End1-3), Start is (Start1-11), End is (End1-3), Start=<End.

globally_finally_marshall_plan_during_3_11_during_2_11(Start,End) :- finally_marshall_plan_during_3_11(Start1,End1), Start is (Start1-2), End is (End1-11), Start=<End.

globally_finally_marshall_plan_during_3_11_during_2_11_at_1935(Res) :- setof((Start,End),globally_finally_marshall_plan_during_3_11_during_2_11(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = globally_finally_marshall_plan_during_3_11_during_2_11_at_1935'), (globally_finally_marshall_plan_during_3_11_during_2_11_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).

