:- include('database.pl').
the_walking_dead(Start,End) :- begin('the_walking_dead',_,_,Start), end('the_walking_dead',_,_,End), Start=<End.

weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

generate_facts_the_walking_dead_AND_weeds([]) :- assert(the_walking_dead_AND_weeds(-1,-1)).

generate_facts_the_walking_dead_AND_weeds([(Start,End) | Tail]) :- assert(the_walking_dead_AND_weeds(Start,End)), generate_facts_the_walking_dead_AND_weeds(Tail).

the_walking_dead_AND_weeds_aux() :- findall((Start,End),the_walking_dead(Start,End),Interval1), findall((Start,End),weeds(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_walking_dead_AND_weeds(Interval).

the_walking_dead_AND_weeds_at_2041(Res) :- setof((Start,End),the_walking_dead_AND_weeds(Start,End),AllINtervals), checkvalidity(2041,AllINtervals,Res).

check_query() :- write('Query = the_walking_dead_AND_weeds_at_2041'), (the_walking_dead_AND_weeds_at_2041(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_walking_dead_AND_weeds_aux().

