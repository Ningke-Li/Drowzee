:- include('database.pl').
ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

heroes(Start,End) :- begin('heroes',_,_,Start), end('heroes',_,_,End), Start=<End.

ev_3rd_millennium_last_till_3_5(Start,End) :- ev_3rd_millennium(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

ev_3rd_millennium_until_heroes_during_3_5_overlap(Start,End) :- ev_3rd_millennium_last_till_3_5(Start1,End1), heroes(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_3rd_millennium_until_heroes_during_3_5(Start,End) :- ev_3rd_millennium(W1,_), ev_3rd_millennium_until_heroes_during_3_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-3), Start=<End.

ev_3rd_millennium_until_heroes_during_3_5_at_1947(Res) :- setof((Start,End),ev_3rd_millennium_until_heroes_during_3_5(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = ev_3rd_millennium_until_heroes_during_3_5_at_1947'), (ev_3rd_millennium_until_heroes_during_3_5_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).

