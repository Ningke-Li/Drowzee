:- include('database.pl').
qing_dynasty(Start,End) :- begin('qing_dynasty',_,_,Start), end('qing_dynasty',_,_,End), Start=<End.

first_anglo_sikh_war(Start,End) :- begin('first_anglo_sikh_war',_,_,Start), end('first_anglo_sikh_war',_,_,End), Start=<End.

qing_dynasty_last_till_188_198(Start,End) :- qing_dynasty(Start1,End1), (End1-Start1)>=188, Start is (Start1+188), End is (End1+1).

qing_dynasty_until_first_anglo_sikh_war_during_188_198_overlap(Start,End) :- qing_dynasty_last_till_188_198(Start1,End1), first_anglo_sikh_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

qing_dynasty_until_first_anglo_sikh_war_during_188_198(Start,End) :- qing_dynasty(W1,_), qing_dynasty_until_first_anglo_sikh_war_during_188_198_overlap(Start1,End1), Start is max((Start1-198),W1), End is (End1-188), Start=<End.

qing_dynasty_until_first_anglo_sikh_war_during_188_198_at_1521(Res) :- setof((Start,End),qing_dynasty_until_first_anglo_sikh_war_during_188_198(Start,End),AllINtervals), checkvalidity(1521,AllINtervals,Res).

check_query() :- write('Query = qing_dynasty_until_first_anglo_sikh_war_during_188_198_at_1521'), (qing_dynasty_until_first_anglo_sikh_war_during_188_198_at_1521(true) -> write('\nRes   = true');write('\nRes   = false')).

