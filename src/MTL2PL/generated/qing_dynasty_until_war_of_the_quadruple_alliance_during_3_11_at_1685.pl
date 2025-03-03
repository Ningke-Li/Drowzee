:- include('database.pl').
qing_dynasty(Start,End) :- begin('qing_dynasty',_,_,Start), end('qing_dynasty',_,_,End), Start=<End.

war_of_the_quadruple_alliance(Start,End) :- begin('war_of_the_quadruple_alliance',_,_,Start), end('war_of_the_quadruple_alliance',_,_,End), Start=<End.

qing_dynasty_last_till_3_11(Start,End) :- qing_dynasty(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

qing_dynasty_until_war_of_the_quadruple_alliance_during_3_11_overlap(Start,End) :- qing_dynasty_last_till_3_11(Start1,End1), war_of_the_quadruple_alliance(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

qing_dynasty_until_war_of_the_quadruple_alliance_during_3_11(Start,End) :- qing_dynasty(W1,_), qing_dynasty_until_war_of_the_quadruple_alliance_during_3_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-3), Start=<End.

qing_dynasty_until_war_of_the_quadruple_alliance_during_3_11_at_1685(Res) :- setof((Start,End),qing_dynasty_until_war_of_the_quadruple_alliance_during_3_11(Start,End),AllINtervals), checkvalidity(1685,AllINtervals,Res).

check_query() :- write('Query = qing_dynasty_until_war_of_the_quadruple_alliance_during_3_11_at_1685'), (qing_dynasty_until_war_of_the_quadruple_alliance_during_3_11_at_1685(true) -> write('\nRes   = true');write('\nRes   = false')).

