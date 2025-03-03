:- include('database.pl').
anglo_zanzibar_war(Start,End) :- begin('anglo_zanzibar_war',_,_,Start), end('anglo_zanzibar_war',_,_,End), Start=<End.

finally_anglo_zanzibar_war_during_1_13(Start,End) :- anglo_zanzibar_war(Start1,End1), (Start1-13)=<(End1-1), Start is (Start1-13), End is (End1-1), Start=<End.

finally_anglo_zanzibar_war_during_1_13_at_1885(Res) :- setof((Start,End),finally_anglo_zanzibar_war_during_1_13(Start,End),AllINtervals), checkvalidity(1885,AllINtervals,Res).

check_query() :- write('Query = finally_anglo_zanzibar_war_during_1_13_at_1885'), (finally_anglo_zanzibar_war_during_1_13_at_1885(true) -> write('\nRes   = true');write('\nRes   = false')).

