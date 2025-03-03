:- include('database.pl').
ev_1921_south_american_championship(Start,End) :- begin('ev_1921_south_american_championship',_,_,Start), end('ev_1921_south_american_championship',_,_,End), Start=<End.

finally_ev_1921_south_american_championship_during_10_13(Start,End) :- ev_1921_south_american_championship(Start1,End1), (Start1-13)=<(End1-10), Start is (Start1-13), End is (End1-10), Start=<End.

finally_ev_1921_south_american_championship_during_10_13_at_1908(Res) :- setof((Start,End),finally_ev_1921_south_american_championship_during_10_13(Start,End),AllINtervals), checkvalidity(1908,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1921_south_american_championship_during_10_13_at_1908'), (finally_ev_1921_south_american_championship_during_10_13_at_1908(true) -> write('\nRes   = true');write('\nRes   = false')).

