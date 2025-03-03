:- include('database.pl').
eighth_russo_turkish_war(Start,End) :- begin('eighth_russo_turkish_war',_,_,Start), end('eighth_russo_turkish_war',_,_,End), Start=<End.

volleyball_at_the_2016_summer_olympics(Start,End) :- begin('volleyball_at_the_2016_summer_olympics',_,_,Start), end('volleyball_at_the_2016_summer_olympics',_,_,End), Start=<End.

generate_facts_eighth_russo_turkish_war_OR_volleyball_at_the_2016_summer_olympics([]) :- assert(eighth_russo_turkish_war_OR_volleyball_at_the_2016_summer_olympics(-1,-1)).

generate_facts_eighth_russo_turkish_war_OR_volleyball_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(eighth_russo_turkish_war_OR_volleyball_at_the_2016_summer_olympics(Start,End)), generate_facts_eighth_russo_turkish_war_OR_volleyball_at_the_2016_summer_olympics(Tail).

eighth_russo_turkish_war_OR_volleyball_at_the_2016_summer_olympics_aux() :- findall((Start,End),eighth_russo_turkish_war(Start,End),Interval1), findall((Start,End),volleyball_at_the_2016_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_eighth_russo_turkish_war_OR_volleyball_at_the_2016_summer_olympics(Interval).

eighth_russo_turkish_war_OR_volleyball_at_the_2016_summer_olympics_at_1782(Res) :- setof((Start,End),eighth_russo_turkish_war_OR_volleyball_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1782,AllINtervals,Res).

check_query() :- write('Query = eighth_russo_turkish_war_OR_volleyball_at_the_2016_summer_olympics_at_1782'), (eighth_russo_turkish_war_OR_volleyball_at_the_2016_summer_olympics_at_1782(true) -> write('\nRes   = true');write('\nRes   = false')).
?- eighth_russo_turkish_war_OR_volleyball_at_the_2016_summer_olympics_aux().

