:- include('database.pl').
the_grim_adventures_of_billy___mandy(Start,End) :- begin('the_grim_adventures_of_billy___mandy',_,_,Start), end('the_grim_adventures_of_billy___mandy',_,_,End), Start=<End.

long_war(Start,End) :- begin('long_war',_,_,Start), end('long_war',_,_,End), Start=<End.

generate_facts_the_grim_adventures_of_billy___mandy_OR_long_war([]) :- assert(the_grim_adventures_of_billy___mandy_OR_long_war(-1,-1)).

generate_facts_the_grim_adventures_of_billy___mandy_OR_long_war([(Start,End) | Tail]) :- assert(the_grim_adventures_of_billy___mandy_OR_long_war(Start,End)), generate_facts_the_grim_adventures_of_billy___mandy_OR_long_war(Tail).

the_grim_adventures_of_billy___mandy_OR_long_war_aux() :- findall((Start,End),the_grim_adventures_of_billy___mandy(Start,End),Interval1), findall((Start,End),long_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_grim_adventures_of_billy___mandy_OR_long_war(Interval).

the_grim_adventures_of_billy___mandy_OR_long_war_at_1606(Res) :- setof((Start,End),the_grim_adventures_of_billy___mandy_OR_long_war(Start,End),AllINtervals), checkvalidity(1606,AllINtervals,Res).

check_query() :- write('Query = the_grim_adventures_of_billy___mandy_OR_long_war_at_1606'), (the_grim_adventures_of_billy___mandy_OR_long_war_at_1606(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_grim_adventures_of_billy___mandy_OR_long_war_aux().

