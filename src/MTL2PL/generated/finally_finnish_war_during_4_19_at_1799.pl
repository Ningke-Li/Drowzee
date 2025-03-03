:- include('database.pl').
finnish_war(Start,End) :- begin('finnish_war',_,_,Start), end('finnish_war',_,_,End), Start=<End.

finally_finnish_war_during_4_19(Start,End) :- finnish_war(Start1,End1), (Start1-19)=<(End1-4), Start is (Start1-19), End is (End1-4), Start=<End.

finally_finnish_war_during_4_19_at_1799(Res) :- setof((Start,End),finally_finnish_war_during_4_19(Start,End),AllINtervals), checkvalidity(1799,AllINtervals,Res).

check_query() :- write('Query = finally_finnish_war_during_4_19_at_1799'), (finally_finnish_war_during_4_19_at_1799(true) -> write('\nRes   = true');write('\nRes   = false')).

