:- include('database.pl').
russo_persian_war(Start,End) :- begin('russo_persian_war',_,_,Start), end('russo_persian_war',_,_,End), Start=<End.

finally_russo_persian_war_during_4_15(Start,End) :- russo_persian_war(Start1,End1), (Start1-15)=<(End1-4), Start is (Start1-15), End is (End1-4), Start=<End.

finally_russo_persian_war_during_4_15_at_1806(Res) :- setof((Start,End),finally_russo_persian_war_during_4_15(Start,End),AllINtervals), checkvalidity(1806,AllINtervals,Res).

check_query() :- write('Query = finally_russo_persian_war_during_4_15_at_1806'), (finally_russo_persian_war_during_4_15_at_1806(true) -> write('\nRes   = true');write('\nRes   = false')).

