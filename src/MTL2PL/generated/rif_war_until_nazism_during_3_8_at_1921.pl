:- include('database.pl').
rif_war(Start,End) :- begin('rif_war',_,_,Start), end('rif_war',_,_,End), Start=<End.

nazism(Start,End) :- begin('nazism',_,_,Start), end('nazism',_,_,End), Start=<End.

rif_war_last_till_3_8(Start,End) :- rif_war(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

rif_war_until_nazism_during_3_8_overlap(Start,End) :- rif_war_last_till_3_8(Start1,End1), nazism(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

rif_war_until_nazism_during_3_8(Start,End) :- rif_war(W1,_), rif_war_until_nazism_during_3_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-3), Start=<End.

rif_war_until_nazism_during_3_8_at_1921(Res) :- setof((Start,End),rif_war_until_nazism_during_3_8(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = rif_war_until_nazism_during_3_8_at_1921'), (rif_war_until_nazism_during_3_8_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).

