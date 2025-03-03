:- include('database.pl').
eastern_front(Start,End) :- begin('eastern_front',_,_,Start), end('eastern_front',_,_,End), Start=<End.

azuchi_momoyama_period(Start,End) :- begin('azuchi_momoyama_period',_,_,Start), end('azuchi_momoyama_period',_,_,End), Start=<End.

generate_facts_eastern_front_OR_azuchi_momoyama_period([]) :- assert(eastern_front_OR_azuchi_momoyama_period(-1,-1)).

generate_facts_eastern_front_OR_azuchi_momoyama_period([(Start,End) | Tail]) :- assert(eastern_front_OR_azuchi_momoyama_period(Start,End)), generate_facts_eastern_front_OR_azuchi_momoyama_period(Tail).

eastern_front_OR_azuchi_momoyama_period_aux() :- findall((Start,End),eastern_front(Start,End),Interval1), findall((Start,End),azuchi_momoyama_period(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_eastern_front_OR_azuchi_momoyama_period(Interval).

eastern_front_OR_azuchi_momoyama_period_at_1570(Res) :- setof((Start,End),eastern_front_OR_azuchi_momoyama_period(Start,End),AllINtervals), checkvalidity(1570,AllINtervals,Res).

check_query() :- write('Query = eastern_front_OR_azuchi_momoyama_period_at_1570'), (eastern_front_OR_azuchi_momoyama_period_at_1570(true) -> write('\nRes   = true');write('\nRes   = false')).
?- eastern_front_OR_azuchi_momoyama_period_aux().

