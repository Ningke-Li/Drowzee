:- include('database.pl').
finnish_war(Start,End) :- begin('finnish_war',_,_,Start), end('finnish_war',_,_,End), Start=<End.

finally_finnish_war_during_6_15(Start,End) :- finnish_war(Start1,End1), (Start1-15)=<(End1-6), Start is (Start1-15), End is (End1-6), Start=<End.

finally_finnish_war_during_6_15_at_1744(Res) :- setof((Start,End),finally_finnish_war_during_6_15(Start,End),AllINtervals), checkvalidity(1744,AllINtervals,Res).

check_query() :- write('Query = finally_finnish_war_during_6_15_at_1744'), (finally_finnish_war_during_6_15_at_1744(true) -> write('\nRes   = true');write('\nRes   = false')).

