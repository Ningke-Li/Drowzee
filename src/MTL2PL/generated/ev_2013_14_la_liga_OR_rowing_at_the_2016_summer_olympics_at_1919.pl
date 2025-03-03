:- include('database.pl').
ev_2013_14_la_liga(Start,End) :- begin('ev_2013_14_la_liga',_,_,Start), end('ev_2013_14_la_liga',_,_,End), Start=<End.

rowing_at_the_2016_summer_olympics(Start,End) :- begin('rowing_at_the_2016_summer_olympics',_,_,Start), end('rowing_at_the_2016_summer_olympics',_,_,End), Start=<End.

generate_facts_ev_2013_14_la_liga_OR_rowing_at_the_2016_summer_olympics([]) :- assert(ev_2013_14_la_liga_OR_rowing_at_the_2016_summer_olympics(-1,-1)).

generate_facts_ev_2013_14_la_liga_OR_rowing_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(ev_2013_14_la_liga_OR_rowing_at_the_2016_summer_olympics(Start,End)), generate_facts_ev_2013_14_la_liga_OR_rowing_at_the_2016_summer_olympics(Tail).

ev_2013_14_la_liga_OR_rowing_at_the_2016_summer_olympics_aux() :- findall((Start,End),ev_2013_14_la_liga(Start,End),Interval1), findall((Start,End),rowing_at_the_2016_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2013_14_la_liga_OR_rowing_at_the_2016_summer_olympics(Interval).

ev_2013_14_la_liga_OR_rowing_at_the_2016_summer_olympics_at_1919(Res) :- setof((Start,End),ev_2013_14_la_liga_OR_rowing_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1919,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_la_liga_OR_rowing_at_the_2016_summer_olympics_at_1919'), (ev_2013_14_la_liga_OR_rowing_at_the_2016_summer_olympics_at_1919(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_la_liga_OR_rowing_at_the_2016_summer_olympics_aux().

