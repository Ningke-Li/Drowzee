:- include('database.pl').
ev_2015_united_nations_climate_change_conference(Start,End) :- begin('ev_2015_united_nations_climate_change_conference',_,_,Start), end('ev_2015_united_nations_climate_change_conference',_,_,End), Start=<End.

lewis_and_clark_expedition(Start,End) :- begin('lewis_and_clark_expedition',_,_,Start), end('lewis_and_clark_expedition',_,_,End), Start=<End.

generate_facts_ev_2015_united_nations_climate_change_conference_OR_lewis_and_clark_expedition([]) :- assert(ev_2015_united_nations_climate_change_conference_OR_lewis_and_clark_expedition(-1,-1)).

generate_facts_ev_2015_united_nations_climate_change_conference_OR_lewis_and_clark_expedition([(Start,End) | Tail]) :- assert(ev_2015_united_nations_climate_change_conference_OR_lewis_and_clark_expedition(Start,End)), generate_facts_ev_2015_united_nations_climate_change_conference_OR_lewis_and_clark_expedition(Tail).

ev_2015_united_nations_climate_change_conference_OR_lewis_and_clark_expedition_aux() :- findall((Start,End),ev_2015_united_nations_climate_change_conference(Start,End),Interval1), findall((Start,End),lewis_and_clark_expedition(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2015_united_nations_climate_change_conference_OR_lewis_and_clark_expedition(Interval).

ev_2015_united_nations_climate_change_conference_OR_lewis_and_clark_expedition_at_1716(Res) :- setof((Start,End),ev_2015_united_nations_climate_change_conference_OR_lewis_and_clark_expedition(Start,End),AllINtervals), checkvalidity(1716,AllINtervals,Res).

check_query() :- write('Query = ev_2015_united_nations_climate_change_conference_OR_lewis_and_clark_expedition_at_1716'), (ev_2015_united_nations_climate_change_conference_OR_lewis_and_clark_expedition_at_1716(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2015_united_nations_climate_change_conference_OR_lewis_and_clark_expedition_aux().

