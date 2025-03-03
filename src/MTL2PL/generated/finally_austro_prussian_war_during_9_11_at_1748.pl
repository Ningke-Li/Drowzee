:- include('database.pl').
austro_prussian_war(Start,End) :- begin('austro_prussian_war',_,_,Start), end('austro_prussian_war',_,_,End), Start=<End.

finally_austro_prussian_war_during_9_11(Start,End) :- austro_prussian_war(Start1,End1), (Start1-11)=<(End1-9), Start is (Start1-11), End is (End1-9), Start=<End.

finally_austro_prussian_war_during_9_11_at_1748(Res) :- setof((Start,End),finally_austro_prussian_war_during_9_11(Start,End),AllINtervals), checkvalidity(1748,AllINtervals,Res).

check_query() :- write('Query = finally_austro_prussian_war_during_9_11_at_1748'), (finally_austro_prussian_war_during_9_11_at_1748(true) -> write('\nRes   = true');write('\nRes   = false')).

