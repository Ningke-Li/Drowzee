:- include('database.pl').
december_2014(Start,End) :- begin('december_2014',_,_,Start), end('december_2014',_,_,End), Start=<End.

arrested_development(Start,End) :- begin('arrested_development',_,_,Start), end('arrested_development',_,_,End), Start=<End.

generate_facts_december_2014_OR_arrested_development([]) :- assert(december_2014_OR_arrested_development(-1,-1)).

generate_facts_december_2014_OR_arrested_development([(Start,End) | Tail]) :- assert(december_2014_OR_arrested_development(Start,End)), generate_facts_december_2014_OR_arrested_development(Tail).

december_2014_OR_arrested_development_aux() :- findall((Start,End),december_2014(Start,End),Interval1), findall((Start,End),arrested_development(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_december_2014_OR_arrested_development(Interval).

december_2014_OR_arrested_development_at_2019(Res) :- setof((Start,End),december_2014_OR_arrested_development(Start,End),AllINtervals), checkvalidity(2019,AllINtervals,Res).

check_query() :- write('Query = december_2014_OR_arrested_development_at_2019'), (december_2014_OR_arrested_development_at_2019(true) -> write('\nRes   = true');write('\nRes   = false')).
?- december_2014_OR_arrested_development_aux().

