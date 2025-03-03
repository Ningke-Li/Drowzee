:- include('database.pl').
ev_2006_european_athletics_championships(Start,End) :- begin('ev_2006_european_athletics_championships',_,_,Start), end('ev_2006_european_athletics_championships',_,_,End), Start=<End.

finally_ev_2006_european_athletics_championships_during_10_15(Start,End) :- ev_2006_european_athletics_championships(Start1,End1), (Start1-15)=<(End1-10), Start is (Start1-15), End is (End1-10), Start=<End.

finally_ev_2006_european_athletics_championships_during_10_15_at_1996(Res) :- setof((Start,End),finally_ev_2006_european_athletics_championships_during_10_15(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2006_european_athletics_championships_during_10_15_at_1996'), (finally_ev_2006_european_athletics_championships_during_10_15_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

