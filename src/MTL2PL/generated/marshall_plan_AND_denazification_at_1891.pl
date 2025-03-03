:- include('database.pl').
marshall_plan(Start,End) :- begin('marshall_plan',_,_,Start), end('marshall_plan',_,_,End), Start=<End.

denazification(Start,End) :- begin('denazification',_,_,Start), end('denazification',_,_,End), Start=<End.

generate_facts_marshall_plan_AND_denazification([]) :- assert(marshall_plan_AND_denazification(-1,-1)).

generate_facts_marshall_plan_AND_denazification([(Start,End) | Tail]) :- assert(marshall_plan_AND_denazification(Start,End)), generate_facts_marshall_plan_AND_denazification(Tail).

marshall_plan_AND_denazification_aux() :- findall((Start,End),marshall_plan(Start,End),Interval1), findall((Start,End),denazification(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_marshall_plan_AND_denazification(Interval).

marshall_plan_AND_denazification_at_1891(Res) :- setof((Start,End),marshall_plan_AND_denazification(Start,End),AllINtervals), checkvalidity(1891,AllINtervals,Res).

check_query() :- write('Query = marshall_plan_AND_denazification_at_1891'), (marshall_plan_AND_denazification_at_1891(true) -> write('\nRes   = true');write('\nRes   = false')).
?- marshall_plan_AND_denazification_aux().

