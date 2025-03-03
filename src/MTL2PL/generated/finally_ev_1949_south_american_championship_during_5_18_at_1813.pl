:- include('database.pl').
ev_1949_south_american_championship(Start,End) :- begin('ev_1949_south_american_championship',_,_,Start), end('ev_1949_south_american_championship',_,_,End), Start=<End.

finally_ev_1949_south_american_championship_during_5_18(Start,End) :- ev_1949_south_american_championship(Start1,End1), (Start1-18)=<(End1-5), Start is (Start1-18), End is (End1-5), Start=<End.

finally_ev_1949_south_american_championship_during_5_18_at_1813(Res) :- setof((Start,End),finally_ev_1949_south_american_championship_during_5_18(Start,End),AllINtervals), checkvalidity(1813,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1949_south_american_championship_during_5_18_at_1813'), (finally_ev_1949_south_american_championship_during_5_18_at_1813(true) -> write('\nRes   = true');write('\nRes   = false')).

