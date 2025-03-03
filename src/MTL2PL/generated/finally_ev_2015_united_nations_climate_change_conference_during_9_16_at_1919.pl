:- include('database.pl').
ev_2015_united_nations_climate_change_conference(Start,End) :- begin('ev_2015_united_nations_climate_change_conference',_,_,Start), end('ev_2015_united_nations_climate_change_conference',_,_,End), Start=<End.

finally_ev_2015_united_nations_climate_change_conference_during_9_16(Start,End) :- ev_2015_united_nations_climate_change_conference(Start1,End1), (Start1-16)=<(End1-9), Start is (Start1-16), End is (End1-9), Start=<End.

finally_ev_2015_united_nations_climate_change_conference_during_9_16_at_1919(Res) :- setof((Start,End),finally_ev_2015_united_nations_climate_change_conference_during_9_16(Start,End),AllINtervals), checkvalidity(1919,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2015_united_nations_climate_change_conference_during_9_16_at_1919'), (finally_ev_2015_united_nations_climate_change_conference_during_9_16_at_1919(true) -> write('\nRes   = true');write('\nRes   = false')).

