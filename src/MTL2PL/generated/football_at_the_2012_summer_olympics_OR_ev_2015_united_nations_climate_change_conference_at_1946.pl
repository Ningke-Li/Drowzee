:- include('database.pl').
football_at_the_2012_summer_olympics(Start,End) :- begin('football_at_the_2012_summer_olympics',_,_,Start), end('football_at_the_2012_summer_olympics',_,_,End), Start=<End.

ev_2015_united_nations_climate_change_conference(Start,End) :- begin('ev_2015_united_nations_climate_change_conference',_,_,Start), end('ev_2015_united_nations_climate_change_conference',_,_,End), Start=<End.

generate_facts_football_at_the_2012_summer_olympics_OR_ev_2015_united_nations_climate_change_conference([]) :- assert(football_at_the_2012_summer_olympics_OR_ev_2015_united_nations_climate_change_conference(-1,-1)).

generate_facts_football_at_the_2012_summer_olympics_OR_ev_2015_united_nations_climate_change_conference([(Start,End) | Tail]) :- assert(football_at_the_2012_summer_olympics_OR_ev_2015_united_nations_climate_change_conference(Start,End)), generate_facts_football_at_the_2012_summer_olympics_OR_ev_2015_united_nations_climate_change_conference(Tail).

football_at_the_2012_summer_olympics_OR_ev_2015_united_nations_climate_change_conference_aux() :- findall((Start,End),football_at_the_2012_summer_olympics(Start,End),Interval1), findall((Start,End),ev_2015_united_nations_climate_change_conference(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_football_at_the_2012_summer_olympics_OR_ev_2015_united_nations_climate_change_conference(Interval).

football_at_the_2012_summer_olympics_OR_ev_2015_united_nations_climate_change_conference_at_1946(Res) :- setof((Start,End),football_at_the_2012_summer_olympics_OR_ev_2015_united_nations_climate_change_conference(Start,End),AllINtervals), checkvalidity(1946,AllINtervals,Res).

check_query() :- write('Query = football_at_the_2012_summer_olympics_OR_ev_2015_united_nations_climate_change_conference_at_1946'), (football_at_the_2012_summer_olympics_OR_ev_2015_united_nations_climate_change_conference_at_1946(true) -> write('\nRes   = true');write('\nRes   = false')).
?- football_at_the_2012_summer_olympics_OR_ev_2015_united_nations_climate_change_conference_aux().

