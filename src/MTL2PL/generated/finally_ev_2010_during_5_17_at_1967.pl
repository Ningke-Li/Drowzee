:- include('database.pl').
ev_2010(Start,End) :- begin('ev_2010',_,_,Start), end('ev_2010',_,_,End), Start=<End.

finally_ev_2010_during_5_17(Start,End) :- ev_2010(Start1,End1), (Start1-17)=<(End1-5), Start is (Start1-17), End is (End1-5), Start=<End.

finally_ev_2010_during_5_17_at_1967(Res) :- setof((Start,End),finally_ev_2010_during_5_17(Start,End),AllINtervals), checkvalidity(1967,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_during_5_17_at_1967'), (finally_ev_2010_during_5_17_at_1967(true) -> write('\nRes   = true');write('\nRes   = false')).

