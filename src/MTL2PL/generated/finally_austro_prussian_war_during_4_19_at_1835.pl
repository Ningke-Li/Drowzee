:- include('database.pl').
austro_prussian_war(Start,End) :- begin('austro_prussian_war',_,_,Start), end('austro_prussian_war',_,_,End), Start=<End.

finally_austro_prussian_war_during_4_19(Start,End) :- austro_prussian_war(Start1,End1), (Start1-19)=<(End1-4), Start is (Start1-19), End is (End1-4), Start=<End.

finally_austro_prussian_war_during_4_19_at_1835(Res) :- setof((Start,End),finally_austro_prussian_war_during_4_19(Start,End),AllINtervals), checkvalidity(1835,AllINtervals,Res).

check_query() :- write('Query = finally_austro_prussian_war_during_4_19_at_1835'), (finally_austro_prussian_war_during_4_19_at_1835(true) -> write('\nRes   = true');write('\nRes   = false')).

