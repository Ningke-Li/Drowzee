:- include('database.pl').
eastern_front(Start,End) :- begin('eastern_front',_,_,Start), end('eastern_front',_,_,End), Start=<End.

peninsular_war(Start,End) :- begin('peninsular_war',_,_,Start), end('peninsular_war',_,_,End), Start=<End.

generate_facts_eastern_front_OR_peninsular_war([]) :- assert(eastern_front_OR_peninsular_war(-1,-1)).

generate_facts_eastern_front_OR_peninsular_war([(Start,End) | Tail]) :- assert(eastern_front_OR_peninsular_war(Start,End)), generate_facts_eastern_front_OR_peninsular_war(Tail).

eastern_front_OR_peninsular_war_aux() :- findall((Start,End),eastern_front(Start,End),Interval1), findall((Start,End),peninsular_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_eastern_front_OR_peninsular_war(Interval).

eastern_front_OR_peninsular_war_at_1811(Res) :- setof((Start,End),eastern_front_OR_peninsular_war(Start,End),AllINtervals), checkvalidity(1811,AllINtervals,Res).

check_query() :- write('Query = eastern_front_OR_peninsular_war_at_1811'), (eastern_front_OR_peninsular_war_at_1811(true) -> write('\nRes   = true');write('\nRes   = false')).
?- eastern_front_OR_peninsular_war_aux().

