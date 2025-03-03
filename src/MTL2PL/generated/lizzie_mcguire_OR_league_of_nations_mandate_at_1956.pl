:- include('database.pl').
lizzie_mcguire(Start,End) :- begin('lizzie_mcguire',_,_,Start), end('lizzie_mcguire',_,_,End), Start=<End.

league_of_nations_mandate(Start,End) :- begin('league_of_nations_mandate',_,_,Start), end('league_of_nations_mandate',_,_,End), Start=<End.

generate_facts_lizzie_mcguire_OR_league_of_nations_mandate([]) :- assert(lizzie_mcguire_OR_league_of_nations_mandate(-1,-1)).

generate_facts_lizzie_mcguire_OR_league_of_nations_mandate([(Start,End) | Tail]) :- assert(lizzie_mcguire_OR_league_of_nations_mandate(Start,End)), generate_facts_lizzie_mcguire_OR_league_of_nations_mandate(Tail).

lizzie_mcguire_OR_league_of_nations_mandate_aux() :- findall((Start,End),lizzie_mcguire(Start,End),Interval1), findall((Start,End),league_of_nations_mandate(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_lizzie_mcguire_OR_league_of_nations_mandate(Interval).

lizzie_mcguire_OR_league_of_nations_mandate_at_1956(Res) :- setof((Start,End),lizzie_mcguire_OR_league_of_nations_mandate(Start,End),AllINtervals), checkvalidity(1956,AllINtervals,Res).

check_query() :- write('Query = lizzie_mcguire_OR_league_of_nations_mandate_at_1956'), (lizzie_mcguire_OR_league_of_nations_mandate_at_1956(true) -> write('\nRes   = true');write('\nRes   = false')).
?- lizzie_mcguire_OR_league_of_nations_mandate_aux().

