:- include('database.pl').
ev_1924_summer_olympics(Start,End) :- begin('ev_1924_summer_olympics',_,_,Start), end('ev_1924_summer_olympics',_,_,End), Start=<End.

finally_ev_1924_summer_olympics_during_5_18(Start,End) :- ev_1924_summer_olympics(Start1,End1), (Start1-18)=<(End1-5), Start is (Start1-18), End is (End1-5), Start=<End.

finally_ev_1924_summer_olympics_during_5_18_at_1820(Res) :- setof((Start,End),finally_ev_1924_summer_olympics_during_5_18(Start,End),AllINtervals), checkvalidity(1820,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1924_summer_olympics_during_5_18_at_1820'), (finally_ev_1924_summer_olympics_during_5_18_at_1820(true) -> write('\nRes   = true');write('\nRes   = false')).

