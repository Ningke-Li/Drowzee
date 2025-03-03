:- include('database.pl').
nazism(Start,End) :- begin('nazism',_,_,Start), end('nazism',_,_,End), Start=<End.

italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

generate_facts_nazism_AND_italian_lira([]) :- assert(nazism_AND_italian_lira(-1,-1)).

generate_facts_nazism_AND_italian_lira([(Start,End) | Tail]) :- assert(nazism_AND_italian_lira(Start,End)), generate_facts_nazism_AND_italian_lira(Tail).

nazism_AND_italian_lira_aux() :- findall((Start,End),nazism(Start,End),Interval1), findall((Start,End),italian_lira(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_nazism_AND_italian_lira(Interval).

nazism_AND_italian_lira_at_1980(Res) :- setof((Start,End),nazism_AND_italian_lira(Start,End),AllINtervals), checkvalidity(1980,AllINtervals,Res).

check_query() :- write('Query = nazism_AND_italian_lira_at_1980'), (nazism_AND_italian_lira_at_1980(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nazism_AND_italian_lira_aux().

