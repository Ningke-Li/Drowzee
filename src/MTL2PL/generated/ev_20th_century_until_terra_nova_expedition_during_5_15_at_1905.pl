:- include('database.pl').
ev_20th_century(Start,End) :- begin('ev_20th_century',_,_,Start), end('ev_20th_century',_,_,End), Start=<End.

terra_nova_expedition(Start,End) :- begin('terra_nova_expedition',_,_,Start), end('terra_nova_expedition',_,_,End), Start=<End.

ev_20th_century_last_till_5_15(Start,End) :- ev_20th_century(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

ev_20th_century_until_terra_nova_expedition_during_5_15_overlap(Start,End) :- ev_20th_century_last_till_5_15(Start1,End1), terra_nova_expedition(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_20th_century_until_terra_nova_expedition_during_5_15(Start,End) :- ev_20th_century(W1,_), ev_20th_century_until_terra_nova_expedition_during_5_15_overlap(Start1,End1), Start is max((Start1-15),W1), End is (End1-5), Start=<End.

ev_20th_century_until_terra_nova_expedition_during_5_15_at_1905(Res) :- setof((Start,End),ev_20th_century_until_terra_nova_expedition_during_5_15(Start,End),AllINtervals), checkvalidity(1905,AllINtervals,Res).

check_query() :- write('Query = ev_20th_century_until_terra_nova_expedition_during_5_15_at_1905'), (ev_20th_century_until_terra_nova_expedition_during_5_15_at_1905(true) -> write('\nRes   = true');write('\nRes   = false')).

