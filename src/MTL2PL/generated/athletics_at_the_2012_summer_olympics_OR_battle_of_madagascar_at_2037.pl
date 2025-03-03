:- include('database.pl').
athletics_at_the_2012_summer_olympics(Start,End) :- begin('athletics_at_the_2012_summer_olympics',_,_,Start), end('athletics_at_the_2012_summer_olympics',_,_,End), Start=<End.

battle_of_madagascar(Start,End) :- begin('battle_of_madagascar',_,_,Start), end('battle_of_madagascar',_,_,End), Start=<End.

generate_facts_athletics_at_the_2012_summer_olympics_OR_battle_of_madagascar([]) :- assert(athletics_at_the_2012_summer_olympics_OR_battle_of_madagascar(-1,-1)).

generate_facts_athletics_at_the_2012_summer_olympics_OR_battle_of_madagascar([(Start,End) | Tail]) :- assert(athletics_at_the_2012_summer_olympics_OR_battle_of_madagascar(Start,End)), generate_facts_athletics_at_the_2012_summer_olympics_OR_battle_of_madagascar(Tail).

athletics_at_the_2012_summer_olympics_OR_battle_of_madagascar_aux() :- findall((Start,End),athletics_at_the_2012_summer_olympics(Start,End),Interval1), findall((Start,End),battle_of_madagascar(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_athletics_at_the_2012_summer_olympics_OR_battle_of_madagascar(Interval).

athletics_at_the_2012_summer_olympics_OR_battle_of_madagascar_at_2037(Res) :- setof((Start,End),athletics_at_the_2012_summer_olympics_OR_battle_of_madagascar(Start,End),AllINtervals), checkvalidity(2037,AllINtervals,Res).

check_query() :- write('Query = athletics_at_the_2012_summer_olympics_OR_battle_of_madagascar_at_2037'), (athletics_at_the_2012_summer_olympics_OR_battle_of_madagascar_at_2037(true) -> write('\nRes   = true');write('\nRes   = false')).
?- athletics_at_the_2012_summer_olympics_OR_battle_of_madagascar_aux().

