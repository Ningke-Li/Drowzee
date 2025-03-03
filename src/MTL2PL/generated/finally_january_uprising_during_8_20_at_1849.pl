:- include('database.pl').
january_uprising(Start,End) :- begin('january_uprising',_,_,Start), end('january_uprising',_,_,End), Start=<End.

finally_january_uprising_during_8_20(Start,End) :- january_uprising(Start1,End1), (Start1-20)=<(End1-8), Start is (Start1-20), End is (End1-8), Start=<End.

finally_january_uprising_during_8_20_at_1849(Res) :- setof((Start,End),finally_january_uprising_during_8_20(Start,End),AllINtervals), checkvalidity(1849,AllINtervals,Res).

check_query() :- write('Query = finally_january_uprising_during_8_20_at_1849'), (finally_january_uprising_during_8_20_at_1849(true) -> write('\nRes   = true');write('\nRes   = false')).

