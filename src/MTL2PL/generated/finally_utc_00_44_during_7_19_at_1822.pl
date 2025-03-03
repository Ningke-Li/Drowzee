:- include('database.pl').
utc_00_44(Start,End) :- begin('utc_00_44',_,_,Start), end('utc_00_44',_,_,End), Start=<End.

finally_utc_00_44_during_7_19(Start,End) :- utc_00_44(Start1,End1), (Start1-19)=<(End1-7), Start is (Start1-19), End is (End1-7), Start=<End.

finally_utc_00_44_during_7_19_at_1822(Res) :- setof((Start,End),finally_utc_00_44_during_7_19(Start,End),AllINtervals), checkvalidity(1822,AllINtervals,Res).

check_query() :- write('Query = finally_utc_00_44_during_7_19_at_1822'), (finally_utc_00_44_during_7_19_at_1822(true) -> write('\nRes   = true');write('\nRes   = false')).

