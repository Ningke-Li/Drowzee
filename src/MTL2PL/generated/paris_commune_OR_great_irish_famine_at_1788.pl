:- include('database.pl').
paris_commune(Start,End) :- begin('paris_commune',_,_,Start), end('paris_commune',_,_,End), Start=<End.

great_irish_famine(Start,End) :- begin('great_irish_famine',_,_,Start), end('great_irish_famine',_,_,End), Start=<End.

generate_facts_paris_commune_OR_great_irish_famine([]) :- assert(paris_commune_OR_great_irish_famine(-1,-1)).

generate_facts_paris_commune_OR_great_irish_famine([(Start,End) | Tail]) :- assert(paris_commune_OR_great_irish_famine(Start,End)), generate_facts_paris_commune_OR_great_irish_famine(Tail).

paris_commune_OR_great_irish_famine_aux() :- findall((Start,End),paris_commune(Start,End),Interval1), findall((Start,End),great_irish_famine(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_paris_commune_OR_great_irish_famine(Interval).

paris_commune_OR_great_irish_famine_at_1788(Res) :- setof((Start,End),paris_commune_OR_great_irish_famine(Start,End),AllINtervals), checkvalidity(1788,AllINtervals,Res).

check_query() :- write('Query = paris_commune_OR_great_irish_famine_at_1788'), (paris_commune_OR_great_irish_famine_at_1788(true) -> write('\nRes   = true');write('\nRes   = false')).
?- paris_commune_OR_great_irish_famine_aux().

