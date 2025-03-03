:- include('database.pl').
underground_railroad(Start,End) :- begin('underground_railroad',_,_,Start), end('underground_railroad',_,_,End), Start=<End.

italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

generate_facts_underground_railroad_AND_italian_lira([]) :- assert(underground_railroad_AND_italian_lira(-1,-1)).

generate_facts_underground_railroad_AND_italian_lira([(Start,End) | Tail]) :- assert(underground_railroad_AND_italian_lira(Start,End)), generate_facts_underground_railroad_AND_italian_lira(Tail).

underground_railroad_AND_italian_lira_aux() :- findall((Start,End),underground_railroad(Start,End),Interval1), findall((Start,End),italian_lira(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_underground_railroad_AND_italian_lira(Interval).

underground_railroad_AND_italian_lira_at_1873(Res) :- setof((Start,End),underground_railroad_AND_italian_lira(Start,End),AllINtervals), checkvalidity(1873,AllINtervals,Res).

check_query() :- write('Query = underground_railroad_AND_italian_lira_at_1873'), (underground_railroad_AND_italian_lira_at_1873(true) -> write('\nRes   = true');write('\nRes   = false')).
?- underground_railroad_AND_italian_lira_aux().

