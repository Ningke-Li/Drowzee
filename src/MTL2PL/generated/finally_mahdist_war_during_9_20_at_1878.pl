:- include('database.pl').
mahdist_war(Start,End) :- begin('mahdist_war',_,_,Start), end('mahdist_war',_,_,End), Start=<End.

finally_mahdist_war_during_9_20(Start,End) :- mahdist_war(Start1,End1), (Start1-20)=<(End1-9), Start is (Start1-20), End is (End1-9), Start=<End.

finally_mahdist_war_during_9_20_at_1878(Res) :- setof((Start,End),finally_mahdist_war_during_9_20(Start,End),AllINtervals), checkvalidity(1878,AllINtervals,Res).

check_query() :- write('Query = finally_mahdist_war_during_9_20_at_1878'), (finally_mahdist_war_during_9_20_at_1878(true) -> write('\nRes   = true');write('\nRes   = false')).

