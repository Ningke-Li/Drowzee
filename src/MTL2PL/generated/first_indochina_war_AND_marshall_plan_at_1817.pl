:- include('database.pl').
first_indochina_war(Start,End) :- begin('first_indochina_war',_,_,Start), end('first_indochina_war',_,_,End), Start=<End.

marshall_plan(Start,End) :- begin('marshall_plan',_,_,Start), end('marshall_plan',_,_,End), Start=<End.

generate_facts_first_indochina_war_AND_marshall_plan([]) :- assert(first_indochina_war_AND_marshall_plan(-1,-1)).

generate_facts_first_indochina_war_AND_marshall_plan([(Start,End) | Tail]) :- assert(first_indochina_war_AND_marshall_plan(Start,End)), generate_facts_first_indochina_war_AND_marshall_plan(Tail).

first_indochina_war_AND_marshall_plan_aux() :- findall((Start,End),first_indochina_war(Start,End),Interval1), findall((Start,End),marshall_plan(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_first_indochina_war_AND_marshall_plan(Interval).

first_indochina_war_AND_marshall_plan_at_1817(Res) :- setof((Start,End),first_indochina_war_AND_marshall_plan(Start,End),AllINtervals), checkvalidity(1817,AllINtervals,Res).

check_query() :- write('Query = first_indochina_war_AND_marshall_plan_at_1817'), (first_indochina_war_AND_marshall_plan_at_1817(true) -> write('\nRes   = true');write('\nRes   = false')).
?- first_indochina_war_AND_marshall_plan_aux().

