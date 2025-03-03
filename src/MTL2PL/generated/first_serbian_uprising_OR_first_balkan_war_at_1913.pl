:- include('database.pl').
first_serbian_uprising(Start,End) :- begin('first_serbian_uprising',_,_,Start), end('first_serbian_uprising',_,_,End), Start=<End.

first_balkan_war(Start,End) :- begin('first_balkan_war',_,_,Start), end('first_balkan_war',_,_,End), Start=<End.

generate_facts_first_serbian_uprising_OR_first_balkan_war([]) :- assert(first_serbian_uprising_OR_first_balkan_war(-1,-1)).

generate_facts_first_serbian_uprising_OR_first_balkan_war([(Start,End) | Tail]) :- assert(first_serbian_uprising_OR_first_balkan_war(Start,End)), generate_facts_first_serbian_uprising_OR_first_balkan_war(Tail).

first_serbian_uprising_OR_first_balkan_war_aux() :- findall((Start,End),first_serbian_uprising(Start,End),Interval1), findall((Start,End),first_balkan_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_first_serbian_uprising_OR_first_balkan_war(Interval).

first_serbian_uprising_OR_first_balkan_war_at_1913(Res) :- setof((Start,End),first_serbian_uprising_OR_first_balkan_war(Start,End),AllINtervals), checkvalidity(1913,AllINtervals,Res).

check_query() :- write('Query = first_serbian_uprising_OR_first_balkan_war_at_1913'), (first_serbian_uprising_OR_first_balkan_war_at_1913(true) -> write('\nRes   = true');write('\nRes   = false')).
?- first_serbian_uprising_OR_first_balkan_war_aux().

