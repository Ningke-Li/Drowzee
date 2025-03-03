:- include('database.pl').
schmalkaldic_war(Start,End) :- begin('schmalkaldic_war',_,_,Start), end('schmalkaldic_war',_,_,End), Start=<End.

next_schmalkaldic_war(Start,End) :- schmalkaldic_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_schmalkaldic_war_at_1546(Res) :- setof((Start,End),next_schmalkaldic_war(Start,End),AllINtervals), checkvalidity(1546,AllINtervals,Res).

check_query() :- write('Query = next_schmalkaldic_war_at_1546'), (next_schmalkaldic_war_at_1546(true) -> write('\nRes   = true');write('\nRes   = false')).

