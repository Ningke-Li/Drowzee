:- include('database.pl').
rif_war(Start,End) :- begin('rif_war',_,_,Start), end('rif_war',_,_,End), Start=<End.

finally_rif_war_during_4_17(Start,End) :- rif_war(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

finally_rif_war_during_4_17_at_1900(Res) :- setof((Start,End),finally_rif_war_during_4_17(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = finally_rif_war_during_4_17_at_1900'), (finally_rif_war_during_4_17_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).

