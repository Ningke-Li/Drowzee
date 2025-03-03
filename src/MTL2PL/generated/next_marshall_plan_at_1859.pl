:- include('database.pl').
marshall_plan(Start,End) :- begin('marshall_plan',_,_,Start), end('marshall_plan',_,_,End), Start=<End.

next_marshall_plan(Start,End) :- marshall_plan(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_marshall_plan_at_1859(Res) :- setof((Start,End),next_marshall_plan(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = next_marshall_plan_at_1859'), (next_marshall_plan_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).

