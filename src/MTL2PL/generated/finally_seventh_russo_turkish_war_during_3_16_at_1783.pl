:- include('database.pl').
seventh_russo_turkish_war(Start,End) :- begin('seventh_russo_turkish_war',_,_,Start), end('seventh_russo_turkish_war',_,_,End), Start=<End.

finally_seventh_russo_turkish_war_during_3_16(Start,End) :- seventh_russo_turkish_war(Start1,End1), (Start1-16)=<(End1-3), Start is (Start1-16), End is (End1-3), Start=<End.

finally_seventh_russo_turkish_war_during_3_16_at_1783(Res) :- setof((Start,End),finally_seventh_russo_turkish_war_during_3_16(Start,End),AllINtervals), checkvalidity(1783,AllINtervals,Res).

check_query() :- write('Query = finally_seventh_russo_turkish_war_during_3_16_at_1783'), (finally_seventh_russo_turkish_war_during_3_16_at_1783(true) -> write('\nRes   = true');write('\nRes   = false')).

