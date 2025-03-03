:- include('database.pl').
rif_war(Start,End) :- begin('rif_war',_,_,Start), end('rif_war',_,_,End), Start=<End.

utc_00_44(Start,End) :- begin('utc_00_44',_,_,Start), end('utc_00_44',_,_,End), Start=<End.

rif_war_last_till_5_13(Start,End) :- rif_war(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

rif_war_until_utc_00_44_during_5_13_overlap(Start,End) :- rif_war_last_till_5_13(Start1,End1), utc_00_44(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

rif_war_until_utc_00_44_during_5_13(Start,End) :- rif_war(W1,_), rif_war_until_utc_00_44_during_5_13_overlap(Start1,End1), Start is max((Start1-13),W1), End is (End1-5), Start=<End.

rif_war_until_utc_00_44_during_5_13_at_1774(Res) :- setof((Start,End),rif_war_until_utc_00_44_during_5_13(Start,End),AllINtervals), checkvalidity(1774,AllINtervals,Res).

check_query() :- write('Query = rif_war_until_utc_00_44_during_5_13_at_1774'), (rif_war_until_utc_00_44_during_5_13_at_1774(true) -> write('\nRes   = true');write('\nRes   = false')).

