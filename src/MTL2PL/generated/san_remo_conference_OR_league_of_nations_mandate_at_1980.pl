:- include('database.pl').
san_remo_conference(Start,End) :- begin('san_remo_conference',_,_,Start), end('san_remo_conference',_,_,End), Start=<End.

league_of_nations_mandate(Start,End) :- begin('league_of_nations_mandate',_,_,Start), end('league_of_nations_mandate',_,_,End), Start=<End.

generate_facts_san_remo_conference_OR_league_of_nations_mandate([]) :- assert(san_remo_conference_OR_league_of_nations_mandate(-1,-1)).

generate_facts_san_remo_conference_OR_league_of_nations_mandate([(Start,End) | Tail]) :- assert(san_remo_conference_OR_league_of_nations_mandate(Start,End)), generate_facts_san_remo_conference_OR_league_of_nations_mandate(Tail).

san_remo_conference_OR_league_of_nations_mandate_aux() :- findall((Start,End),san_remo_conference(Start,End),Interval1), findall((Start,End),league_of_nations_mandate(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_san_remo_conference_OR_league_of_nations_mandate(Interval).

san_remo_conference_OR_league_of_nations_mandate_at_1980(Res) :- setof((Start,End),san_remo_conference_OR_league_of_nations_mandate(Start,End),AllINtervals), checkvalidity(1980,AllINtervals,Res).

check_query() :- write('Query = san_remo_conference_OR_league_of_nations_mandate_at_1980'), (san_remo_conference_OR_league_of_nations_mandate_at_1980(true) -> write('\nRes   = true');write('\nRes   = false')).
?- san_remo_conference_OR_league_of_nations_mandate_aux().

