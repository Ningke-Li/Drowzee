:- include('database.pl').
great_turkish_war(Start,End) :- begin('great_turkish_war',_,_,Start), end('great_turkish_war',_,_,End), Start=<End.

basketball_at_the_1948_summer_olympics(Start,End) :- begin('basketball_at_the_1948_summer_olympics',_,_,Start), end('basketball_at_the_1948_summer_olympics',_,_,End), Start=<End.

generate_facts_great_turkish_war_OR_basketball_at_the_1948_summer_olympics([]) :- assert(great_turkish_war_OR_basketball_at_the_1948_summer_olympics(-1,-1)).

generate_facts_great_turkish_war_OR_basketball_at_the_1948_summer_olympics([(Start,End) | Tail]) :- assert(great_turkish_war_OR_basketball_at_the_1948_summer_olympics(Start,End)), generate_facts_great_turkish_war_OR_basketball_at_the_1948_summer_olympics(Tail).

great_turkish_war_OR_basketball_at_the_1948_summer_olympics_aux() :- findall((Start,End),great_turkish_war(Start,End),Interval1), findall((Start,End),basketball_at_the_1948_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_great_turkish_war_OR_basketball_at_the_1948_summer_olympics(Interval).

great_turkish_war_OR_basketball_at_the_1948_summer_olympics_at_1948(Res) :- setof((Start,End),great_turkish_war_OR_basketball_at_the_1948_summer_olympics(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = great_turkish_war_OR_basketball_at_the_1948_summer_olympics_at_1948'), (great_turkish_war_OR_basketball_at_the_1948_summer_olympics_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- great_turkish_war_OR_basketball_at_the_1948_summer_olympics_aux().

