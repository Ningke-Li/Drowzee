:- include('database.pl').
granada_war(Start,End) :- begin('granada_war',_,_,Start), end('granada_war',_,_,End), Start=<End.

danny_phantom(Start,End) :- begin('danny_phantom',_,_,Start), end('danny_phantom',_,_,End), Start=<End.

generate_facts_granada_war_OR_danny_phantom([]) :- assert(granada_war_OR_danny_phantom(-1,-1)).

generate_facts_granada_war_OR_danny_phantom([(Start,End) | Tail]) :- assert(granada_war_OR_danny_phantom(Start,End)), generate_facts_granada_war_OR_danny_phantom(Tail).

granada_war_OR_danny_phantom_aux() :- findall((Start,End),granada_war(Start,End),Interval1), findall((Start,End),danny_phantom(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_granada_war_OR_danny_phantom(Interval).

granada_war_OR_danny_phantom_at_2007(Res) :- setof((Start,End),granada_war_OR_danny_phantom(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = granada_war_OR_danny_phantom_at_2007'), (granada_war_OR_danny_phantom_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- granada_war_OR_danny_phantom_aux().

