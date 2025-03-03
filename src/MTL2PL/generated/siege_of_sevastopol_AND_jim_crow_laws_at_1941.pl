:- include('database.pl').
siege_of_sevastopol(Start,End) :- begin('siege_of_sevastopol',_,_,Start), end('siege_of_sevastopol',_,_,End), Start=<End.

jim_crow_laws(Start,End) :- begin('jim_crow_laws',_,_,Start), end('jim_crow_laws',_,_,End), Start=<End.

generate_facts_siege_of_sevastopol_AND_jim_crow_laws([]) :- assert(siege_of_sevastopol_AND_jim_crow_laws(-1,-1)).

generate_facts_siege_of_sevastopol_AND_jim_crow_laws([(Start,End) | Tail]) :- assert(siege_of_sevastopol_AND_jim_crow_laws(Start,End)), generate_facts_siege_of_sevastopol_AND_jim_crow_laws(Tail).

siege_of_sevastopol_AND_jim_crow_laws_aux() :- findall((Start,End),siege_of_sevastopol(Start,End),Interval1), findall((Start,End),jim_crow_laws(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_siege_of_sevastopol_AND_jim_crow_laws(Interval).

siege_of_sevastopol_AND_jim_crow_laws_at_1941(Res) :- setof((Start,End),siege_of_sevastopol_AND_jim_crow_laws(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = siege_of_sevastopol_AND_jim_crow_laws_at_1941'), (siege_of_sevastopol_AND_jim_crow_laws_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- siege_of_sevastopol_AND_jim_crow_laws_aux().

