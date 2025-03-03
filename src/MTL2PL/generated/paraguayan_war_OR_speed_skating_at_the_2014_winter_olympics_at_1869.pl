:- include('database.pl').
paraguayan_war(Start,End) :- begin('paraguayan_war',_,_,Start), end('paraguayan_war',_,_,End), Start=<End.

speed_skating_at_the_2014_winter_olympics(Start,End) :- begin('speed_skating_at_the_2014_winter_olympics',_,_,Start), end('speed_skating_at_the_2014_winter_olympics',_,_,End), Start=<End.

generate_facts_paraguayan_war_OR_speed_skating_at_the_2014_winter_olympics([]) :- assert(paraguayan_war_OR_speed_skating_at_the_2014_winter_olympics(-1,-1)).

generate_facts_paraguayan_war_OR_speed_skating_at_the_2014_winter_olympics([(Start,End) | Tail]) :- assert(paraguayan_war_OR_speed_skating_at_the_2014_winter_olympics(Start,End)), generate_facts_paraguayan_war_OR_speed_skating_at_the_2014_winter_olympics(Tail).

paraguayan_war_OR_speed_skating_at_the_2014_winter_olympics_aux() :- findall((Start,End),paraguayan_war(Start,End),Interval1), findall((Start,End),speed_skating_at_the_2014_winter_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_paraguayan_war_OR_speed_skating_at_the_2014_winter_olympics(Interval).

paraguayan_war_OR_speed_skating_at_the_2014_winter_olympics_at_1869(Res) :- setof((Start,End),paraguayan_war_OR_speed_skating_at_the_2014_winter_olympics(Start,End),AllINtervals), checkvalidity(1869,AllINtervals,Res).

check_query() :- write('Query = paraguayan_war_OR_speed_skating_at_the_2014_winter_olympics_at_1869'), (paraguayan_war_OR_speed_skating_at_the_2014_winter_olympics_at_1869(true) -> write('\nRes   = true');write('\nRes   = false')).
?- paraguayan_war_OR_speed_skating_at_the_2014_winter_olympics_aux().

