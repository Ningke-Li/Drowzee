:- include('database.pl').
great_depression(Start,End) :- begin('great_depression',_,_,Start), end('great_depression',_,_,End), Start=<End.

tibet(Start,End) :- begin('tibet',_,_,Start), end('tibet',_,_,End), Start=<End.

generate_facts_great_depression_AND_tibet([]) :- assert(great_depression_AND_tibet(-1,-1)).

generate_facts_great_depression_AND_tibet([(Start,End) | Tail]) :- assert(great_depression_AND_tibet(Start,End)), generate_facts_great_depression_AND_tibet(Tail).

great_depression_AND_tibet_aux() :- findall((Start,End),great_depression(Start,End),Interval1), findall((Start,End),tibet(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_great_depression_AND_tibet(Interval).

great_depression_AND_tibet_at_1855(Res) :- setof((Start,End),great_depression_AND_tibet(Start,End),AllINtervals), checkvalidity(1855,AllINtervals,Res).

check_query() :- write('Query = great_depression_AND_tibet_at_1855'), (great_depression_AND_tibet_at_1855(true) -> write('\nRes   = true');write('\nRes   = false')).
?- great_depression_AND_tibet_aux().

