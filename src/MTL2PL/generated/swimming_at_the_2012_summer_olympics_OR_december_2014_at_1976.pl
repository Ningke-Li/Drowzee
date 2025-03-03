:- include('database.pl').
swimming_at_the_2012_summer_olympics(Start,End) :- begin('swimming_at_the_2012_summer_olympics',_,_,Start), end('swimming_at_the_2012_summer_olympics',_,_,End), Start=<End.

december_2014(Start,End) :- begin('december_2014',_,_,Start), end('december_2014',_,_,End), Start=<End.

generate_facts_swimming_at_the_2012_summer_olympics_OR_december_2014([]) :- assert(swimming_at_the_2012_summer_olympics_OR_december_2014(-1,-1)).

generate_facts_swimming_at_the_2012_summer_olympics_OR_december_2014([(Start,End) | Tail]) :- assert(swimming_at_the_2012_summer_olympics_OR_december_2014(Start,End)), generate_facts_swimming_at_the_2012_summer_olympics_OR_december_2014(Tail).

swimming_at_the_2012_summer_olympics_OR_december_2014_aux() :- findall((Start,End),swimming_at_the_2012_summer_olympics(Start,End),Interval1), findall((Start,End),december_2014(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_swimming_at_the_2012_summer_olympics_OR_december_2014(Interval).

swimming_at_the_2012_summer_olympics_OR_december_2014_at_1976(Res) :- setof((Start,End),swimming_at_the_2012_summer_olympics_OR_december_2014(Start,End),AllINtervals), checkvalidity(1976,AllINtervals,Res).

check_query() :- write('Query = swimming_at_the_2012_summer_olympics_OR_december_2014_at_1976'), (swimming_at_the_2012_summer_olympics_OR_december_2014_at_1976(true) -> write('\nRes   = true');write('\nRes   = false')).
?- swimming_at_the_2012_summer_olympics_OR_december_2014_aux().

