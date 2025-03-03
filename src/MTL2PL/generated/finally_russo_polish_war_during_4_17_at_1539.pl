:- include('database.pl').
russo_polish_war(Start,End) :- begin('russo_polish_war',_,_,Start), end('russo_polish_war',_,_,End), Start=<End.

finally_russo_polish_war_during_4_17(Start,End) :- russo_polish_war(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

finally_russo_polish_war_during_4_17_at_1539(Res) :- setof((Start,End),finally_russo_polish_war_during_4_17(Start,End),AllINtervals), checkvalidity(1539,AllINtervals,Res).

check_query() :- write('Query = finally_russo_polish_war_during_4_17_at_1539'), (finally_russo_polish_war_during_4_17_at_1539(true) -> write('\nRes   = true');write('\nRes   = false')).

