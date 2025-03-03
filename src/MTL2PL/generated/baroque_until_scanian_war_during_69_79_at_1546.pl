:- include('database.pl').
baroque(Start,End) :- begin('baroque',_,_,Start), end('baroque',_,_,End), Start=<End.

scanian_war(Start,End) :- begin('scanian_war',_,_,Start), end('scanian_war',_,_,End), Start=<End.

baroque_last_till_69_79(Start,End) :- baroque(Start1,End1), (End1-Start1)>=69, Start is (Start1+69), End is (End1+1).

baroque_until_scanian_war_during_69_79_overlap(Start,End) :- baroque_last_till_69_79(Start1,End1), scanian_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

baroque_until_scanian_war_during_69_79(Start,End) :- baroque(W1,_), baroque_until_scanian_war_during_69_79_overlap(Start1,End1), Start is max((Start1-79),W1), End is (End1-69), Start=<End.

baroque_until_scanian_war_during_69_79_at_1546(Res) :- setof((Start,End),baroque_until_scanian_war_during_69_79(Start,End),AllINtervals), checkvalidity(1546,AllINtervals,Res).

check_query() :- write('Query = baroque_until_scanian_war_during_69_79_at_1546'), (baroque_until_scanian_war_during_69_79_at_1546(true) -> write('\nRes   = true');write('\nRes   = false')).

