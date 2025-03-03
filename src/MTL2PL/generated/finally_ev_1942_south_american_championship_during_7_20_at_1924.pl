:- include('database.pl').
ev_1942_south_american_championship(Start,End) :- begin('ev_1942_south_american_championship',_,_,Start), end('ev_1942_south_american_championship',_,_,End), Start=<End.

finally_ev_1942_south_american_championship_during_7_20(Start,End) :- ev_1942_south_american_championship(Start1,End1), (Start1-20)=<(End1-7), Start is (Start1-20), End is (End1-7), Start=<End.

finally_ev_1942_south_american_championship_during_7_20_at_1924(Res) :- setof((Start,End),finally_ev_1942_south_american_championship_during_7_20(Start,End),AllINtervals), checkvalidity(1924,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1942_south_american_championship_during_7_20_at_1924'), (finally_ev_1942_south_american_championship_during_7_20_at_1924(true) -> write('\nRes   = true');write('\nRes   = false')).

