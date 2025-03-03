:- include('database.pl').
skins(Start,End) :- begin('skins',_,_,Start), end('skins',_,_,End), Start=<End.

sofia_the_first(Start,End) :- begin('sofia_the_first',_,_,Start), end('sofia_the_first',_,_,End), Start=<End.

generate_facts_skins_OR_sofia_the_first([]) :- assert(skins_OR_sofia_the_first(-1,-1)).

generate_facts_skins_OR_sofia_the_first([(Start,End) | Tail]) :- assert(skins_OR_sofia_the_first(Start,End)), generate_facts_skins_OR_sofia_the_first(Tail).

skins_OR_sofia_the_first_aux() :- findall((Start,End),skins(Start,End),Interval1), findall((Start,End),sofia_the_first(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_skins_OR_sofia_the_first(Interval).

skins_OR_sofia_the_first_at_1932(Res) :- setof((Start,End),skins_OR_sofia_the_first(Start,End),AllINtervals), checkvalidity(1932,AllINtervals,Res).

check_query() :- write('Query = skins_OR_sofia_the_first_at_1932'), (skins_OR_sofia_the_first_at_1932(true) -> write('\nRes   = true');write('\nRes   = false')).
?- skins_OR_sofia_the_first_aux().

