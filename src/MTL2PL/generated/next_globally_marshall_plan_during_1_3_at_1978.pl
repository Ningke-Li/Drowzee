:- include('database.pl').
marshall_plan(Start,End) :- begin('marshall_plan',_,_,Start), end('marshall_plan',_,_,End), Start=<End.

globally_marshall_plan_during_1_3(Start,End) :- marshall_plan(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_marshall_plan_during_1_3(Start,End) :- globally_marshall_plan_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_marshall_plan_during_1_3_at_1978(Res) :- setof((Start,End),next_globally_marshall_plan_during_1_3(Start,End),AllINtervals), checkvalidity(1978,AllINtervals,Res).

check_query() :- write('Query = next_globally_marshall_plan_during_1_3_at_1978'), (next_globally_marshall_plan_during_1_3_at_1978(true) -> write('\nRes   = true');write('\nRes   = false')).

