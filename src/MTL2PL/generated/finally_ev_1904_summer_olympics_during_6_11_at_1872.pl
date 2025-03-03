:- include('database.pl').
ev_1904_summer_olympics(Start,End) :- begin('ev_1904_summer_olympics',_,_,Start), end('ev_1904_summer_olympics',_,_,End), Start=<End.

finally_ev_1904_summer_olympics_during_6_11(Start,End) :- ev_1904_summer_olympics(Start1,End1), (Start1-11)=<(End1-6), Start is (Start1-11), End is (End1-6), Start=<End.

finally_ev_1904_summer_olympics_during_6_11_at_1872(Res) :- setof((Start,End),finally_ev_1904_summer_olympics_during_6_11(Start,End),AllINtervals), checkvalidity(1872,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1904_summer_olympics_during_6_11_at_1872'), (finally_ev_1904_summer_olympics_during_6_11_at_1872(true) -> write('\nRes   = true');write('\nRes   = false')).

