:- include('database.pl').
ev_2010_eruptions_of_eyjafjallaj_kull(Start,End) :- begin('ev_2010_eruptions_of_eyjafjallaj_kull',_,_,Start), end('ev_2010_eruptions_of_eyjafjallaj_kull',_,_,End), Start=<End.

annexation_of_crimea_by_the_russian_federation(Start,End) :- begin('annexation_of_crimea_by_the_russian_federation',_,_,Start), end('annexation_of_crimea_by_the_russian_federation',_,_,End), Start=<End.

generate_facts_ev_2010_eruptions_of_eyjafjallaj_kull_OR_annexation_of_crimea_by_the_russian_federation([]) :- assert(ev_2010_eruptions_of_eyjafjallaj_kull_OR_annexation_of_crimea_by_the_russian_federation(-1,-1)).

generate_facts_ev_2010_eruptions_of_eyjafjallaj_kull_OR_annexation_of_crimea_by_the_russian_federation([(Start,End) | Tail]) :- assert(ev_2010_eruptions_of_eyjafjallaj_kull_OR_annexation_of_crimea_by_the_russian_federation(Start,End)), generate_facts_ev_2010_eruptions_of_eyjafjallaj_kull_OR_annexation_of_crimea_by_the_russian_federation(Tail).

ev_2010_eruptions_of_eyjafjallaj_kull_OR_annexation_of_crimea_by_the_russian_federation_aux() :- findall((Start,End),ev_2010_eruptions_of_eyjafjallaj_kull(Start,End),Interval1), findall((Start,End),annexation_of_crimea_by_the_russian_federation(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_eruptions_of_eyjafjallaj_kull_OR_annexation_of_crimea_by_the_russian_federation(Interval).

ev_2010_eruptions_of_eyjafjallaj_kull_OR_annexation_of_crimea_by_the_russian_federation_at_2051(Res) :- setof((Start,End),ev_2010_eruptions_of_eyjafjallaj_kull_OR_annexation_of_crimea_by_the_russian_federation(Start,End),AllINtervals), checkvalidity(2051,AllINtervals,Res).

check_query() :- write('Query = ev_2010_eruptions_of_eyjafjallaj_kull_OR_annexation_of_crimea_by_the_russian_federation_at_2051'), (ev_2010_eruptions_of_eyjafjallaj_kull_OR_annexation_of_crimea_by_the_russian_federation_at_2051(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_eruptions_of_eyjafjallaj_kull_OR_annexation_of_crimea_by_the_russian_federation_aux().

