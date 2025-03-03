:- include('database.pl').
ukrainian_war_of_independence(Start,End) :- begin('ukrainian_war_of_independence',_,_,Start), end('ukrainian_war_of_independence',_,_,End), Start=<End.

winter_war(Start,End) :- begin('winter_war',_,_,Start), end('winter_war',_,_,End), Start=<End.

generate_facts_ukrainian_war_of_independence_OR_winter_war([]) :- assert(ukrainian_war_of_independence_OR_winter_war(-1,-1)).

generate_facts_ukrainian_war_of_independence_OR_winter_war([(Start,End) | Tail]) :- assert(ukrainian_war_of_independence_OR_winter_war(Start,End)), generate_facts_ukrainian_war_of_independence_OR_winter_war(Tail).

ukrainian_war_of_independence_OR_winter_war_aux() :- findall((Start,End),ukrainian_war_of_independence(Start,End),Interval1), findall((Start,End),winter_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ukrainian_war_of_independence_OR_winter_war(Interval).

ukrainian_war_of_independence_OR_winter_war_at_1920(Res) :- setof((Start,End),ukrainian_war_of_independence_OR_winter_war(Start,End),AllINtervals), checkvalidity(1920,AllINtervals,Res).

check_query() :- write('Query = ukrainian_war_of_independence_OR_winter_war_at_1920'), (ukrainian_war_of_independence_OR_winter_war_at_1920(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ukrainian_war_of_independence_OR_winter_war_aux().

