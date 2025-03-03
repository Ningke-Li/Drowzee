:- include('database.pl').
volleyball_at_the_2012_summer_olympics(Start,End) :- begin('volleyball_at_the_2012_summer_olympics',_,_,Start), end('volleyball_at_the_2012_summer_olympics',_,_,End), Start=<End.

finnish_war(Start,End) :- begin('finnish_war',_,_,Start), end('finnish_war',_,_,End), Start=<End.

generate_facts_volleyball_at_the_2012_summer_olympics_OR_finnish_war([]) :- assert(volleyball_at_the_2012_summer_olympics_OR_finnish_war(-1,-1)).

generate_facts_volleyball_at_the_2012_summer_olympics_OR_finnish_war([(Start,End) | Tail]) :- assert(volleyball_at_the_2012_summer_olympics_OR_finnish_war(Start,End)), generate_facts_volleyball_at_the_2012_summer_olympics_OR_finnish_war(Tail).

volleyball_at_the_2012_summer_olympics_OR_finnish_war_aux() :- findall((Start,End),volleyball_at_the_2012_summer_olympics(Start,End),Interval1), findall((Start,End),finnish_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_volleyball_at_the_2012_summer_olympics_OR_finnish_war(Interval).

volleyball_at_the_2012_summer_olympics_OR_finnish_war_at_1721(Res) :- setof((Start,End),volleyball_at_the_2012_summer_olympics_OR_finnish_war(Start,End),AllINtervals), checkvalidity(1721,AllINtervals,Res).

check_query() :- write('Query = volleyball_at_the_2012_summer_olympics_OR_finnish_war_at_1721'), (volleyball_at_the_2012_summer_olympics_OR_finnish_war_at_1721(true) -> write('\nRes   = true');write('\nRes   = false')).
?- volleyball_at_the_2012_summer_olympics_OR_finnish_war_aux().

