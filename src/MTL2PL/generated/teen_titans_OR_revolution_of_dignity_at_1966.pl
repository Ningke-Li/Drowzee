:- include('database.pl').
teen_titans(Start,End) :- begin('teen_titans',_,_,Start), end('teen_titans',_,_,End), Start=<End.

revolution_of_dignity(Start,End) :- begin('revolution_of_dignity',_,_,Start), end('revolution_of_dignity',_,_,End), Start=<End.

generate_facts_teen_titans_OR_revolution_of_dignity([]) :- assert(teen_titans_OR_revolution_of_dignity(-1,-1)).

generate_facts_teen_titans_OR_revolution_of_dignity([(Start,End) | Tail]) :- assert(teen_titans_OR_revolution_of_dignity(Start,End)), generate_facts_teen_titans_OR_revolution_of_dignity(Tail).

teen_titans_OR_revolution_of_dignity_aux() :- findall((Start,End),teen_titans(Start,End),Interval1), findall((Start,End),revolution_of_dignity(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_teen_titans_OR_revolution_of_dignity(Interval).

teen_titans_OR_revolution_of_dignity_at_1966(Res) :- setof((Start,End),teen_titans_OR_revolution_of_dignity(Start,End),AllINtervals), checkvalidity(1966,AllINtervals,Res).

check_query() :- write('Query = teen_titans_OR_revolution_of_dignity_at_1966'), (teen_titans_OR_revolution_of_dignity_at_1966(true) -> write('\nRes   = true');write('\nRes   = false')).
?- teen_titans_OR_revolution_of_dignity_aux().

