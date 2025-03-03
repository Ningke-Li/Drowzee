:- include('database.pl').
sonic_x(Start,End) :- begin('sonic_x',_,_,Start), end('sonic_x',_,_,End), Start=<End.

alias(Start,End) :- begin('alias',_,_,Start), end('alias',_,_,End), Start=<End.

generate_facts_sonic_x_AND_alias([]) :- assert(sonic_x_AND_alias(-1,-1)).

generate_facts_sonic_x_AND_alias([(Start,End) | Tail]) :- assert(sonic_x_AND_alias(Start,End)), generate_facts_sonic_x_AND_alias(Tail).

sonic_x_AND_alias_aux() :- findall((Start,End),sonic_x(Start,End),Interval1), findall((Start,End),alias(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_sonic_x_AND_alias(Interval).

sonic_x_AND_alias_at_1917(Res) :- setof((Start,End),sonic_x_AND_alias(Start,End),AllINtervals), checkvalidity(1917,AllINtervals,Res).

check_query() :- write('Query = sonic_x_AND_alias_at_1917'), (sonic_x_AND_alias_at_1917(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sonic_x_AND_alias_aux().

