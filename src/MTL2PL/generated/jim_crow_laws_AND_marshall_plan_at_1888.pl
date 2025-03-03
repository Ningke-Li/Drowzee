:- include('database.pl').
jim_crow_laws(Start,End) :- begin('jim_crow_laws',_,_,Start), end('jim_crow_laws',_,_,End), Start=<End.

marshall_plan(Start,End) :- begin('marshall_plan',_,_,Start), end('marshall_plan',_,_,End), Start=<End.

generate_facts_jim_crow_laws_AND_marshall_plan([]) :- assert(jim_crow_laws_AND_marshall_plan(-1,-1)).

generate_facts_jim_crow_laws_AND_marshall_plan([(Start,End) | Tail]) :- assert(jim_crow_laws_AND_marshall_plan(Start,End)), generate_facts_jim_crow_laws_AND_marshall_plan(Tail).

jim_crow_laws_AND_marshall_plan_aux() :- findall((Start,End),jim_crow_laws(Start,End),Interval1), findall((Start,End),marshall_plan(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jim_crow_laws_AND_marshall_plan(Interval).

jim_crow_laws_AND_marshall_plan_at_1888(Res) :- setof((Start,End),jim_crow_laws_AND_marshall_plan(Start,End),AllINtervals), checkvalidity(1888,AllINtervals,Res).

check_query() :- write('Query = jim_crow_laws_AND_marshall_plan_at_1888'), (jim_crow_laws_AND_marshall_plan_at_1888(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jim_crow_laws_AND_marshall_plan_aux().

