:- include('database.pl').
italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

great_depression(Start,End) :- begin('great_depression',_,_,Start), end('great_depression',_,_,End), Start=<End.

generate_facts_italian_lira_AND_great_depression([]) :- assert(italian_lira_AND_great_depression(-1,-1)).

generate_facts_italian_lira_AND_great_depression([(Start,End) | Tail]) :- assert(italian_lira_AND_great_depression(Start,End)), generate_facts_italian_lira_AND_great_depression(Tail).

italian_lira_AND_great_depression_aux() :- findall((Start,End),italian_lira(Start,End),Interval1), findall((Start,End),great_depression(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_italian_lira_AND_great_depression(Interval).

italian_lira_AND_great_depression_at_1801(Res) :- setof((Start,End),italian_lira_AND_great_depression(Start,End),AllINtervals), checkvalidity(1801,AllINtervals,Res).

check_query() :- write('Query = italian_lira_AND_great_depression_at_1801'), (italian_lira_AND_great_depression_at_1801(true) -> write('\nRes   = true');write('\nRes   = false')).
?- italian_lira_AND_great_depression_aux().

