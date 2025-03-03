:- include('database.pl').
napoleonic_wars(Start,End) :- begin('napoleonic_wars',_,_,Start), end('napoleonic_wars',_,_,End), Start=<End.

basketball_at_the_2004_summer_olympics(Start,End) :- begin('basketball_at_the_2004_summer_olympics',_,_,Start), end('basketball_at_the_2004_summer_olympics',_,_,End), Start=<End.

generate_facts_napoleonic_wars_OR_basketball_at_the_2004_summer_olympics([]) :- assert(napoleonic_wars_OR_basketball_at_the_2004_summer_olympics(-1,-1)).

generate_facts_napoleonic_wars_OR_basketball_at_the_2004_summer_olympics([(Start,End) | Tail]) :- assert(napoleonic_wars_OR_basketball_at_the_2004_summer_olympics(Start,End)), generate_facts_napoleonic_wars_OR_basketball_at_the_2004_summer_olympics(Tail).

napoleonic_wars_OR_basketball_at_the_2004_summer_olympics_aux() :- findall((Start,End),napoleonic_wars(Start,End),Interval1), findall((Start,End),basketball_at_the_2004_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_napoleonic_wars_OR_basketball_at_the_2004_summer_olympics(Interval).

napoleonic_wars_OR_basketball_at_the_2004_summer_olympics_at_1804(Res) :- setof((Start,End),napoleonic_wars_OR_basketball_at_the_2004_summer_olympics(Start,End),AllINtervals), checkvalidity(1804,AllINtervals,Res).

check_query() :- write('Query = napoleonic_wars_OR_basketball_at_the_2004_summer_olympics_at_1804'), (napoleonic_wars_OR_basketball_at_the_2004_summer_olympics_at_1804(true) -> write('\nRes   = true');write('\nRes   = false')).
?- napoleonic_wars_OR_basketball_at_the_2004_summer_olympics_aux().

