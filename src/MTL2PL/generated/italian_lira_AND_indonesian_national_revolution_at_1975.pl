:- include('database.pl').
italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

indonesian_national_revolution(Start,End) :- begin('indonesian_national_revolution',_,_,Start), end('indonesian_national_revolution',_,_,End), Start=<End.

generate_facts_italian_lira_AND_indonesian_national_revolution([]) :- assert(italian_lira_AND_indonesian_national_revolution(-1,-1)).

generate_facts_italian_lira_AND_indonesian_national_revolution([(Start,End) | Tail]) :- assert(italian_lira_AND_indonesian_national_revolution(Start,End)), generate_facts_italian_lira_AND_indonesian_national_revolution(Tail).

italian_lira_AND_indonesian_national_revolution_aux() :- findall((Start,End),italian_lira(Start,End),Interval1), findall((Start,End),indonesian_national_revolution(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_italian_lira_AND_indonesian_national_revolution(Interval).

italian_lira_AND_indonesian_national_revolution_at_1975(Res) :- setof((Start,End),italian_lira_AND_indonesian_national_revolution(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = italian_lira_AND_indonesian_national_revolution_at_1975'), (italian_lira_AND_indonesian_national_revolution_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).
?- italian_lira_AND_indonesian_national_revolution_aux().

