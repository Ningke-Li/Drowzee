:- include('database.pl').
schmalkaldic_war(Start,End) :- begin('schmalkaldic_war',_,_,Start), end('schmalkaldic_war',_,_,End), Start=<End.

finally_schmalkaldic_war_during_4_14(Start,End) :- schmalkaldic_war(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

finally_schmalkaldic_war_during_4_14_at_1517(Res) :- setof((Start,End),finally_schmalkaldic_war_during_4_14(Start,End),AllINtervals), checkvalidity(1517,AllINtervals,Res).

check_query() :- write('Query = finally_schmalkaldic_war_during_4_14_at_1517'), (finally_schmalkaldic_war_during_4_14_at_1517(true) -> write('\nRes   = true');write('\nRes   = false')).

