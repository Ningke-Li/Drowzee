:- include('database.pl').
scrubs(Start,End) :- begin('scrubs',_,_,Start), end('scrubs',_,_,End), Start=<End.

august_2016(Start,End) :- begin('august_2016',_,_,Start), end('august_2016',_,_,End), Start=<End.

generate_facts_scrubs_OR_august_2016([]) :- assert(scrubs_OR_august_2016(-1,-1)).

generate_facts_scrubs_OR_august_2016([(Start,End) | Tail]) :- assert(scrubs_OR_august_2016(Start,End)), generate_facts_scrubs_OR_august_2016(Tail).

scrubs_OR_august_2016_aux() :- findall((Start,End),scrubs(Start,End),Interval1), findall((Start,End),august_2016(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_scrubs_OR_august_2016(Interval).

scrubs_OR_august_2016_at_2030(Res) :- setof((Start,End),scrubs_OR_august_2016(Start,End),AllINtervals), checkvalidity(2030,AllINtervals,Res).

check_query() :- write('Query = scrubs_OR_august_2016_at_2030'), (scrubs_OR_august_2016_at_2030(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scrubs_OR_august_2016_aux().

