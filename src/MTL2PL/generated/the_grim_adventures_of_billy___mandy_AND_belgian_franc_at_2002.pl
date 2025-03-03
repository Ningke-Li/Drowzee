:- include('database.pl').
the_grim_adventures_of_billy___mandy(Start,End) :- begin('the_grim_adventures_of_billy___mandy',_,_,Start), end('the_grim_adventures_of_billy___mandy',_,_,End), Start=<End.

belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

generate_facts_the_grim_adventures_of_billy___mandy_AND_belgian_franc([]) :- assert(the_grim_adventures_of_billy___mandy_AND_belgian_franc(-1,-1)).

generate_facts_the_grim_adventures_of_billy___mandy_AND_belgian_franc([(Start,End) | Tail]) :- assert(the_grim_adventures_of_billy___mandy_AND_belgian_franc(Start,End)), generate_facts_the_grim_adventures_of_billy___mandy_AND_belgian_franc(Tail).

the_grim_adventures_of_billy___mandy_AND_belgian_franc_aux() :- findall((Start,End),the_grim_adventures_of_billy___mandy(Start,End),Interval1), findall((Start,End),belgian_franc(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_grim_adventures_of_billy___mandy_AND_belgian_franc(Interval).

the_grim_adventures_of_billy___mandy_AND_belgian_franc_at_2002(Res) :- setof((Start,End),the_grim_adventures_of_billy___mandy_AND_belgian_franc(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = the_grim_adventures_of_billy___mandy_AND_belgian_franc_at_2002'), (the_grim_adventures_of_billy___mandy_AND_belgian_franc_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_grim_adventures_of_billy___mandy_AND_belgian_franc_aux().

