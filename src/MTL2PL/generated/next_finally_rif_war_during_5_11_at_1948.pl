:- include('database.pl').
rif_war(Start,End) :- begin('rif_war',_,_,Start), end('rif_war',_,_,End), Start=<End.

finally_rif_war_during_5_11(Start,End) :- rif_war(Start1,End1), (Start1-11)=<(End1-5), Start is (Start1-11), End is (End1-5), Start=<End.

next_finally_rif_war_during_5_11(Start,End) :- finally_rif_war_during_5_11(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_rif_war_during_5_11_at_1948(Res) :- setof((Start,End),next_finally_rif_war_during_5_11(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = next_finally_rif_war_during_5_11_at_1948'), (next_finally_rif_war_during_5_11_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).

