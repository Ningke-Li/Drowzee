:- include('database.pl').
italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

berlin_conference(Start,End) :- begin('berlin_conference',_,_,Start), end('berlin_conference',_,_,End), Start=<End.

generate_facts_italian_lira_AND_berlin_conference([]) :- assert(italian_lira_AND_berlin_conference(-1,-1)).

generate_facts_italian_lira_AND_berlin_conference([(Start,End) | Tail]) :- assert(italian_lira_AND_berlin_conference(Start,End)), generate_facts_italian_lira_AND_berlin_conference(Tail).

italian_lira_AND_berlin_conference_aux() :- findall((Start,End),italian_lira(Start,End),Interval1), findall((Start,End),berlin_conference(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_italian_lira_AND_berlin_conference(Interval).

italian_lira_AND_berlin_conference_at_1885(Res) :- setof((Start,End),italian_lira_AND_berlin_conference(Start,End),AllINtervals), checkvalidity(1885,AllINtervals,Res).

check_query() :- write('Query = italian_lira_AND_berlin_conference_at_1885'), (italian_lira_AND_berlin_conference_at_1885(true) -> write('\nRes   = true');write('\nRes   = false')).
?- italian_lira_AND_berlin_conference_aux().

