:- include('database.pl').
greco_turkish_war_of_1897(Start,End) :- begin('greco_turkish_war_of_1897',_,_,Start), end('greco_turkish_war_of_1897',_,_,End), Start=<End.

basketball_at_the_2008_summer_olympics(Start,End) :- begin('basketball_at_the_2008_summer_olympics',_,_,Start), end('basketball_at_the_2008_summer_olympics',_,_,End), Start=<End.

generate_facts_greco_turkish_war_of_1897_OR_basketball_at_the_2008_summer_olympics([]) :- assert(greco_turkish_war_of_1897_OR_basketball_at_the_2008_summer_olympics(-1,-1)).

generate_facts_greco_turkish_war_of_1897_OR_basketball_at_the_2008_summer_olympics([(Start,End) | Tail]) :- assert(greco_turkish_war_of_1897_OR_basketball_at_the_2008_summer_olympics(Start,End)), generate_facts_greco_turkish_war_of_1897_OR_basketball_at_the_2008_summer_olympics(Tail).

greco_turkish_war_of_1897_OR_basketball_at_the_2008_summer_olympics_aux() :- findall((Start,End),greco_turkish_war_of_1897(Start,End),Interval1), findall((Start,End),basketball_at_the_2008_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_greco_turkish_war_of_1897_OR_basketball_at_the_2008_summer_olympics(Interval).

greco_turkish_war_of_1897_OR_basketball_at_the_2008_summer_olympics_at_1942(Res) :- setof((Start,End),greco_turkish_war_of_1897_OR_basketball_at_the_2008_summer_olympics(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = greco_turkish_war_of_1897_OR_basketball_at_the_2008_summer_olympics_at_1942'), (greco_turkish_war_of_1897_OR_basketball_at_the_2008_summer_olympics_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).
?- greco_turkish_war_of_1897_OR_basketball_at_the_2008_summer_olympics_aux().

