:- include('database.pl').
nordisk_familjebok(Start,End) :- begin('nordisk_familjebok',_,_,Start), end('nordisk_familjebok',_,_,End), Start=<End.

finally_nordisk_familjebok_during_6_16(Start,End) :- nordisk_familjebok(Start1,End1), (Start1-16)=<(End1-6), Start is (Start1-16), End is (End1-6), Start=<End.

globally_finally_nordisk_familjebok_during_6_16_during_44_54(Start,End) :- finally_nordisk_familjebok_during_6_16(Start1,End1), Start is (Start1-44), End is (End1-54), Start=<End.

globally_finally_nordisk_familjebok_during_6_16_during_44_54_at_1889(Res) :- setof((Start,End),globally_finally_nordisk_familjebok_during_6_16_during_44_54(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = globally_finally_nordisk_familjebok_during_6_16_during_44_54_at_1889'), (globally_finally_nordisk_familjebok_during_6_16_during_44_54_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).

