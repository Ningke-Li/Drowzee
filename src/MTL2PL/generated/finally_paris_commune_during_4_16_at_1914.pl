:- include('database.pl').
paris_commune(Start,End) :- begin('paris_commune',_,_,Start), end('paris_commune',_,_,End), Start=<End.

finally_paris_commune_during_4_16(Start,End) :- paris_commune(Start1,End1), (Start1-16)=<(End1-4), Start is (Start1-16), End is (End1-4), Start=<End.

finally_paris_commune_during_4_16_at_1914(Res) :- setof((Start,End),finally_paris_commune_during_4_16(Start,End),AllINtervals), checkvalidity(1914,AllINtervals,Res).

check_query() :- write('Query = finally_paris_commune_during_4_16_at_1914'), (finally_paris_commune_during_4_16_at_1914(true) -> write('\nRes   = true');write('\nRes   = false')).

