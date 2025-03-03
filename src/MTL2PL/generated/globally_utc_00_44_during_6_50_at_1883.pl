:- include('database.pl').
utc_00_44(Start,End) :- begin('utc_00_44',_,_,Start), end('utc_00_44',_,_,End), Start=<End.

globally_utc_00_44_during_6_50(Start,End) :- utc_00_44(Start1,End1), Start is (Start1-6), End is (End1-50), Start=<End.

globally_utc_00_44_during_6_50_at_1883(Res) :- setof((Start,End),globally_utc_00_44_during_6_50(Start,End),AllINtervals), checkvalidity(1883,AllINtervals,Res).

check_query() :- write('Query = globally_utc_00_44_during_6_50_at_1883'), (globally_utc_00_44_during_6_50_at_1883(true) -> write('\nRes   = true');write('\nRes   = false')).

