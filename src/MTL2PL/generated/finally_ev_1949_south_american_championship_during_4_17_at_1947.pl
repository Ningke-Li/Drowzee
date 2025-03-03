:- include('database.pl').
ev_1949_south_american_championship(Start,End) :- begin('ev_1949_south_american_championship',_,_,Start), end('ev_1949_south_american_championship',_,_,End), Start=<End.

finally_ev_1949_south_american_championship_during_4_17(Start,End) :- ev_1949_south_american_championship(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

finally_ev_1949_south_american_championship_during_4_17_at_1947(Res) :- setof((Start,End),finally_ev_1949_south_american_championship_during_4_17(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1949_south_american_championship_during_4_17_at_1947'), (finally_ev_1949_south_american_championship_during_4_17_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).

