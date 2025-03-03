:- include('database.pl').
qing_dynasty(Start,End) :- begin('qing_dynasty',_,_,Start), end('qing_dynasty',_,_,End), Start=<End.

war_of_the_quadruple_alliance(Start,End) :- begin('war_of_the_quadruple_alliance',_,_,Start), end('war_of_the_quadruple_alliance',_,_,End), Start=<End.

qing_dynasty_last_till_79_80(Start,End) :- qing_dynasty(Start1,End1), (End1-Start1)>=79, Start is (Start1+79), End is (End1+1).

qing_dynasty_until_war_of_the_quadruple_alliance_during_79_80_overlap(Start,End) :- qing_dynasty_last_till_79_80(Start1,End1), war_of_the_quadruple_alliance(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

qing_dynasty_until_war_of_the_quadruple_alliance_during_79_80(Start,End) :- qing_dynasty(W1,_), qing_dynasty_until_war_of_the_quadruple_alliance_during_79_80_overlap(Start1,End1), Start is max((Start1-80),W1), End is (End1-79), Start=<End.

qing_dynasty_until_war_of_the_quadruple_alliance_during_79_80_at_1639(Res) :- setof((Start,End),qing_dynasty_until_war_of_the_quadruple_alliance_during_79_80(Start,End),AllINtervals), checkvalidity(1639,AllINtervals,Res).

check_query() :- write('Query = qing_dynasty_until_war_of_the_quadruple_alliance_during_79_80_at_1639'), (qing_dynasty_until_war_of_the_quadruple_alliance_during_79_80_at_1639(true) -> write('\nRes   = true');write('\nRes   = false')).

