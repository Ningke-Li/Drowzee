:- include('database.pl').
siege_of_sevastopol(Start,End) :- begin('siege_of_sevastopol',_,_,Start), end('siege_of_sevastopol',_,_,End), Start=<End.

rococo(Start,End) :- begin('rococo',_,_,Start), end('rococo',_,_,End), Start=<End.

generate_facts_siege_of_sevastopol_OR_rococo([]) :- assert(siege_of_sevastopol_OR_rococo(-1,-1)).

generate_facts_siege_of_sevastopol_OR_rococo([(Start,End) | Tail]) :- assert(siege_of_sevastopol_OR_rococo(Start,End)), generate_facts_siege_of_sevastopol_OR_rococo(Tail).

siege_of_sevastopol_OR_rococo_aux() :- findall((Start,End),siege_of_sevastopol(Start,End),Interval1), findall((Start,End),rococo(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_siege_of_sevastopol_OR_rococo(Interval).

siege_of_sevastopol_OR_rococo_at_1619(Res) :- setof((Start,End),siege_of_sevastopol_OR_rococo(Start,End),AllINtervals), checkvalidity(1619,AllINtervals,Res).

check_query() :- write('Query = siege_of_sevastopol_OR_rococo_at_1619'), (siege_of_sevastopol_OR_rococo_at_1619(true) -> write('\nRes   = true');write('\nRes   = false')).
?- siege_of_sevastopol_OR_rococo_aux().

