:- include('database.pl').
november_2014(Start,End) :- begin('november_2014',_,_,Start), end('november_2014',_,_,End), Start=<End.

spanish_american_wars_of_independence(Start,End) :- begin('spanish_american_wars_of_independence',_,_,Start), end('spanish_american_wars_of_independence',_,_,End), Start=<End.

generate_facts_november_2014_OR_spanish_american_wars_of_independence([]) :- assert(november_2014_OR_spanish_american_wars_of_independence(-1,-1)).

generate_facts_november_2014_OR_spanish_american_wars_of_independence([(Start,End) | Tail]) :- assert(november_2014_OR_spanish_american_wars_of_independence(Start,End)), generate_facts_november_2014_OR_spanish_american_wars_of_independence(Tail).

november_2014_OR_spanish_american_wars_of_independence_aux() :- findall((Start,End),november_2014(Start,End),Interval1), findall((Start,End),spanish_american_wars_of_independence(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_november_2014_OR_spanish_american_wars_of_independence(Interval).

november_2014_OR_spanish_american_wars_of_independence_at_1813(Res) :- setof((Start,End),november_2014_OR_spanish_american_wars_of_independence(Start,End),AllINtervals), checkvalidity(1813,AllINtervals,Res).

check_query() :- write('Query = november_2014_OR_spanish_american_wars_of_independence_at_1813'), (november_2014_OR_spanish_american_wars_of_independence_at_1813(true) -> write('\nRes   = true');write('\nRes   = false')).
?- november_2014_OR_spanish_american_wars_of_independence_aux().

