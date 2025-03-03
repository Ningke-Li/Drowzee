:- include('database.pl').
nordisk_familjebok(Start,End) :- begin('nordisk_familjebok',_,_,Start), end('nordisk_familjebok',_,_,End), Start=<End.

globally_nordisk_familjebok_during_35_68(Start,End) :- nordisk_familjebok(Start1,End1), Start is (Start1-35), End is (End1-68), Start=<End.

globally_nordisk_familjebok_during_35_68_at_1865(Res) :- setof((Start,End),globally_nordisk_familjebok_during_35_68(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = globally_nordisk_familjebok_during_35_68_at_1865'), (globally_nordisk_familjebok_during_35_68_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).

