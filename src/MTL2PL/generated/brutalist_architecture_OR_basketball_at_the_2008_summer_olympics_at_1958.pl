:- include('database.pl').
brutalist_architecture(Start,End) :- begin('brutalist_architecture',_,_,Start), end('brutalist_architecture',_,_,End), Start=<End.

basketball_at_the_2008_summer_olympics(Start,End) :- begin('basketball_at_the_2008_summer_olympics',_,_,Start), end('basketball_at_the_2008_summer_olympics',_,_,End), Start=<End.

generate_facts_brutalist_architecture_OR_basketball_at_the_2008_summer_olympics([]) :- assert(brutalist_architecture_OR_basketball_at_the_2008_summer_olympics(-1,-1)).

generate_facts_brutalist_architecture_OR_basketball_at_the_2008_summer_olympics([(Start,End) | Tail]) :- assert(brutalist_architecture_OR_basketball_at_the_2008_summer_olympics(Start,End)), generate_facts_brutalist_architecture_OR_basketball_at_the_2008_summer_olympics(Tail).

brutalist_architecture_OR_basketball_at_the_2008_summer_olympics_aux() :- findall((Start,End),brutalist_architecture(Start,End),Interval1), findall((Start,End),basketball_at_the_2008_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_brutalist_architecture_OR_basketball_at_the_2008_summer_olympics(Interval).

brutalist_architecture_OR_basketball_at_the_2008_summer_olympics_at_1958(Res) :- setof((Start,End),brutalist_architecture_OR_basketball_at_the_2008_summer_olympics(Start,End),AllINtervals), checkvalidity(1958,AllINtervals,Res).

check_query() :- write('Query = brutalist_architecture_OR_basketball_at_the_2008_summer_olympics_at_1958'), (brutalist_architecture_OR_basketball_at_the_2008_summer_olympics_at_1958(true) -> write('\nRes   = true');write('\nRes   = false')).
?- brutalist_architecture_OR_basketball_at_the_2008_summer_olympics_aux().

