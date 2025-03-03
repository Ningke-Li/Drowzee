:- include('database.pl').
the_grim_adventures_of_billy___mandy(Start,End) :- begin('the_grim_adventures_of_billy___mandy',_,_,Start), end('the_grim_adventures_of_billy___mandy',_,_,End), Start=<End.

vatican_lira(Start,End) :- begin('vatican_lira',_,_,Start), end('vatican_lira',_,_,End), Start=<End.

generate_facts_the_grim_adventures_of_billy___mandy_AND_vatican_lira([]) :- assert(the_grim_adventures_of_billy___mandy_AND_vatican_lira(-1,-1)).

generate_facts_the_grim_adventures_of_billy___mandy_AND_vatican_lira([(Start,End) | Tail]) :- assert(the_grim_adventures_of_billy___mandy_AND_vatican_lira(Start,End)), generate_facts_the_grim_adventures_of_billy___mandy_AND_vatican_lira(Tail).

the_grim_adventures_of_billy___mandy_AND_vatican_lira_aux() :- findall((Start,End),the_grim_adventures_of_billy___mandy(Start,End),Interval1), findall((Start,End),vatican_lira(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_grim_adventures_of_billy___mandy_AND_vatican_lira(Interval).

the_grim_adventures_of_billy___mandy_AND_vatican_lira_at_1853(Res) :- setof((Start,End),the_grim_adventures_of_billy___mandy_AND_vatican_lira(Start,End),AllINtervals), checkvalidity(1853,AllINtervals,Res).

check_query() :- write('Query = the_grim_adventures_of_billy___mandy_AND_vatican_lira_at_1853'), (the_grim_adventures_of_billy___mandy_AND_vatican_lira_at_1853(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_grim_adventures_of_billy___mandy_AND_vatican_lira_aux().

