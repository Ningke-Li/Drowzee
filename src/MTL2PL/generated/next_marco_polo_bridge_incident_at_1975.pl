:- include('database.pl').
marco_polo_bridge_incident(Start,End) :- begin('marco_polo_bridge_incident',_,_,Start), end('marco_polo_bridge_incident',_,_,End), Start=<End.

next_marco_polo_bridge_incident(Start,End) :- marco_polo_bridge_incident(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_marco_polo_bridge_incident_at_1975(Res) :- setof((Start,End),next_marco_polo_bridge_incident(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = next_marco_polo_bridge_incident_at_1975'), (next_marco_polo_bridge_incident_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).

