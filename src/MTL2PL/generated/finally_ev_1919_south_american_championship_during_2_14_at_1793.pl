:- include('database.pl').
ev_1919_south_american_championship(Start,End) :- begin('ev_1919_south_american_championship',_,_,Start), end('ev_1919_south_american_championship',_,_,End), Start=<End.

finally_ev_1919_south_american_championship_during_2_14(Start,End) :- ev_1919_south_american_championship(Start1,End1), (Start1-14)=<(End1-2), Start is (Start1-14), End is (End1-2), Start=<End.

finally_ev_1919_south_american_championship_during_2_14_at_1793(Res) :- setof((Start,End),finally_ev_1919_south_american_championship_during_2_14(Start,End),AllINtervals), checkvalidity(1793,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1919_south_american_championship_during_2_14_at_1793'), (finally_ev_1919_south_american_championship_during_2_14_at_1793(true) -> write('\nRes   = true');write('\nRes   = false')).

