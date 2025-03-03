:- include('database.pl').
classicism(Start,End) :- begin('classicism',_,_,Start), end('classicism',_,_,End), Start=<End.

basketball_at_the_2016_summer_olympics(Start,End) :- begin('basketball_at_the_2016_summer_olympics',_,_,Start), end('basketball_at_the_2016_summer_olympics',_,_,End), Start=<End.

generate_facts_classicism_OR_basketball_at_the_2016_summer_olympics([]) :- assert(classicism_OR_basketball_at_the_2016_summer_olympics(-1,-1)).

generate_facts_classicism_OR_basketball_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(classicism_OR_basketball_at_the_2016_summer_olympics(Start,End)), generate_facts_classicism_OR_basketball_at_the_2016_summer_olympics(Tail).

classicism_OR_basketball_at_the_2016_summer_olympics_aux() :- findall((Start,End),classicism(Start,End),Interval1), findall((Start,End),basketball_at_the_2016_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_classicism_OR_basketball_at_the_2016_summer_olympics(Interval).

classicism_OR_basketball_at_the_2016_summer_olympics_at_1943(Res) :- setof((Start,End),classicism_OR_basketball_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = classicism_OR_basketball_at_the_2016_summer_olympics_at_1943'), (classicism_OR_basketball_at_the_2016_summer_olympics_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- classicism_OR_basketball_at_the_2016_summer_olympics_aux().

