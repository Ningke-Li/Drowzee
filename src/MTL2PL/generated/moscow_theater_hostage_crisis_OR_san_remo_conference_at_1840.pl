:- include('database.pl').
moscow_theater_hostage_crisis(Start,End) :- begin('moscow_theater_hostage_crisis',_,_,Start), end('moscow_theater_hostage_crisis',_,_,End), Start=<End.

san_remo_conference(Start,End) :- begin('san_remo_conference',_,_,Start), end('san_remo_conference',_,_,End), Start=<End.

generate_facts_moscow_theater_hostage_crisis_OR_san_remo_conference([]) :- assert(moscow_theater_hostage_crisis_OR_san_remo_conference(-1,-1)).

generate_facts_moscow_theater_hostage_crisis_OR_san_remo_conference([(Start,End) | Tail]) :- assert(moscow_theater_hostage_crisis_OR_san_remo_conference(Start,End)), generate_facts_moscow_theater_hostage_crisis_OR_san_remo_conference(Tail).

moscow_theater_hostage_crisis_OR_san_remo_conference_aux() :- findall((Start,End),moscow_theater_hostage_crisis(Start,End),Interval1), findall((Start,End),san_remo_conference(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_moscow_theater_hostage_crisis_OR_san_remo_conference(Interval).

moscow_theater_hostage_crisis_OR_san_remo_conference_at_1840(Res) :- setof((Start,End),moscow_theater_hostage_crisis_OR_san_remo_conference(Start,End),AllINtervals), checkvalidity(1840,AllINtervals,Res).

check_query() :- write('Query = moscow_theater_hostage_crisis_OR_san_remo_conference_at_1840'), (moscow_theater_hostage_crisis_OR_san_remo_conference_at_1840(true) -> write('\nRes   = true');write('\nRes   = false')).
?- moscow_theater_hostage_crisis_OR_san_remo_conference_aux().

