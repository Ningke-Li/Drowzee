:- include('database.pl').
iraqi_civil_war_of_2014_2017(Start,End) :- begin('iraqi_civil_war_of_2014_2017',_,_,Start), end('iraqi_civil_war_of_2014_2017',_,_,End), Start=<End.

the_walking_dead(Start,End) :- begin('the_walking_dead',_,_,Start), end('the_walking_dead',_,_,End), Start=<End.

generate_facts_iraqi_civil_war_of_2014_2017_AND_the_walking_dead([]) :- assert(iraqi_civil_war_of_2014_2017_AND_the_walking_dead(-1,-1)).

generate_facts_iraqi_civil_war_of_2014_2017_AND_the_walking_dead([(Start,End) | Tail]) :- assert(iraqi_civil_war_of_2014_2017_AND_the_walking_dead(Start,End)), generate_facts_iraqi_civil_war_of_2014_2017_AND_the_walking_dead(Tail).

iraqi_civil_war_of_2014_2017_AND_the_walking_dead_aux() :- findall((Start,End),iraqi_civil_war_of_2014_2017(Start,End),Interval1), findall((Start,End),the_walking_dead(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_iraqi_civil_war_of_2014_2017_AND_the_walking_dead(Interval).

iraqi_civil_war_of_2014_2017_AND_the_walking_dead_at_1882(Res) :- setof((Start,End),iraqi_civil_war_of_2014_2017_AND_the_walking_dead(Start,End),AllINtervals), checkvalidity(1882,AllINtervals,Res).

check_query() :- write('Query = iraqi_civil_war_of_2014_2017_AND_the_walking_dead_at_1882'), (iraqi_civil_war_of_2014_2017_AND_the_walking_dead_at_1882(true) -> write('\nRes   = true');write('\nRes   = false')).
?- iraqi_civil_war_of_2014_2017_AND_the_walking_dead_aux().

