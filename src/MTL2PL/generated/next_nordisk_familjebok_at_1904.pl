:- include('database.pl').
nordisk_familjebok(Start,End) :- begin('nordisk_familjebok',_,_,Start), end('nordisk_familjebok',_,_,End), Start=<End.

next_nordisk_familjebok(Start,End) :- nordisk_familjebok(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_nordisk_familjebok_at_1904(Res) :- setof((Start,End),next_nordisk_familjebok(Start,End),AllINtervals), checkvalidity(1904,AllINtervals,Res).

check_query() :- write('Query = next_nordisk_familjebok_at_1904'), (next_nordisk_familjebok_at_1904(true) -> write('\nRes   = true');write('\nRes   = false')).

