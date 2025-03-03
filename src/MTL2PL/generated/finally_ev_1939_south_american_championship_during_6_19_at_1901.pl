:- include('database.pl').
ev_1939_south_american_championship(Start,End) :- begin('ev_1939_south_american_championship',_,_,Start), end('ev_1939_south_american_championship',_,_,End), Start=<End.

finally_ev_1939_south_american_championship_during_6_19(Start,End) :- ev_1939_south_american_championship(Start1,End1), (Start1-19)=<(End1-6), Start is (Start1-19), End is (End1-6), Start=<End.

finally_ev_1939_south_american_championship_during_6_19_at_1901(Res) :- setof((Start,End),finally_ev_1939_south_american_championship_during_6_19(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1939_south_american_championship_during_6_19_at_1901'), (finally_ev_1939_south_american_championship_during_6_19_at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).

