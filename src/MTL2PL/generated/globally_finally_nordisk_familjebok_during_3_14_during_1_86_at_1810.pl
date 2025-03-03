:- include('database.pl').
nordisk_familjebok(Start,End) :- begin('nordisk_familjebok',_,_,Start), end('nordisk_familjebok',_,_,End), Start=<End.

finally_nordisk_familjebok_during_3_14(Start,End) :- nordisk_familjebok(Start1,End1), (Start1-14)=<(End1-3), Start is (Start1-14), End is (End1-3), Start=<End.

globally_finally_nordisk_familjebok_during_3_14_during_1_86(Start,End) :- finally_nordisk_familjebok_during_3_14(Start1,End1), Start is (Start1-1), End is (End1-86), Start=<End.

globally_finally_nordisk_familjebok_during_3_14_during_1_86_at_1810(Res) :- setof((Start,End),globally_finally_nordisk_familjebok_during_3_14_during_1_86(Start,End),AllINtervals), checkvalidity(1810,AllINtervals,Res).

check_query() :- write('Query = globally_finally_nordisk_familjebok_during_3_14_during_1_86_at_1810'), (globally_finally_nordisk_familjebok_during_3_14_during_1_86_at_1810(true) -> write('\nRes   = true');write('\nRes   = false')).

