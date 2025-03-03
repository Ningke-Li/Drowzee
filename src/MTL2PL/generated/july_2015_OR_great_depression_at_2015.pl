:- include('database.pl').
july_2015(Start,End) :- begin('july_2015',_,_,Start), end('july_2015',_,_,End), Start=<End.

great_depression(Start,End) :- begin('great_depression',_,_,Start), end('great_depression',_,_,End), Start=<End.

generate_facts_july_2015_OR_great_depression([]) :- assert(july_2015_OR_great_depression(-1,-1)).

generate_facts_july_2015_OR_great_depression([(Start,End) | Tail]) :- assert(july_2015_OR_great_depression(Start,End)), generate_facts_july_2015_OR_great_depression(Tail).

july_2015_OR_great_depression_aux() :- findall((Start,End),july_2015(Start,End),Interval1), findall((Start,End),great_depression(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_july_2015_OR_great_depression(Interval).

july_2015_OR_great_depression_at_2015(Res) :- setof((Start,End),july_2015_OR_great_depression(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = july_2015_OR_great_depression_at_2015'), (july_2015_OR_great_depression_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- july_2015_OR_great_depression_aux().

