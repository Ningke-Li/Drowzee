:- include('database.pl').
phoney_war(Start,End) :- begin('phoney_war',_,_,Start), end('phoney_war',_,_,End), Start=<End.

finally_phoney_war_during_1_13(Start,End) :- phoney_war(Start1,End1), (Start1-13)=<(End1-1), Start is (Start1-13), End is (End1-1), Start=<End.

finally_phoney_war_during_1_13_at_1957(Res) :- setof((Start,End),finally_phoney_war_during_1_13(Start,End),AllINtervals), checkvalidity(1957,AllINtervals,Res).

check_query() :- write('Query = finally_phoney_war_during_1_13_at_1957'), (finally_phoney_war_during_1_13_at_1957(true) -> write('\nRes   = true');write('\nRes   = false')).

