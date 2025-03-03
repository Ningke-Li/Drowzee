:- include('database.pl').
orient_express(Start,End) :- begin('orient_express',_,_,Start), end('orient_express',_,_,End), Start=<End.

rif_war(Start,End) :- begin('rif_war',_,_,Start), end('rif_war',_,_,End), Start=<End.

orient_express_last_till_21_23(Start,End) :- orient_express(Start1,End1), (End1-Start1)>=21, Start is (Start1+21), End is (End1+1).

orient_express_until_rif_war_during_21_23_overlap(Start,End) :- orient_express_last_till_21_23(Start1,End1), rif_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

orient_express_until_rif_war_during_21_23(Start,End) :- orient_express(W1,_), orient_express_until_rif_war_during_21_23_overlap(Start1,End1), Start is max((Start1-23),W1), End is (End1-21), Start=<End.

orient_express_until_rif_war_during_21_23_at_1892(Res) :- setof((Start,End),orient_express_until_rif_war_during_21_23(Start,End),AllINtervals), checkvalidity(1892,AllINtervals,Res).

check_query() :- write('Query = orient_express_until_rif_war_during_21_23_at_1892'), (orient_express_until_rif_war_during_21_23_at_1892(true) -> write('\nRes   = true');write('\nRes   = false')).

