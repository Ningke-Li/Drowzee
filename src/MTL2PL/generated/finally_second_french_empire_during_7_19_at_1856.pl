:- include('database.pl').
second_french_empire(Start,End) :- begin('second_french_empire',_,_,Start), end('second_french_empire',_,_,End), Start=<End.

finally_second_french_empire_during_7_19(Start,End) :- second_french_empire(Start1,End1), (Start1-19)=<(End1-7), Start is (Start1-19), End is (End1-7), Start=<End.

finally_second_french_empire_during_7_19_at_1856(Res) :- setof((Start,End),finally_second_french_empire_during_7_19(Start,End),AllINtervals), checkvalidity(1856,AllINtervals,Res).

check_query() :- write('Query = finally_second_french_empire_during_7_19_at_1856'), (finally_second_french_empire_during_7_19_at_1856(true) -> write('\nRes   = true');write('\nRes   = false')).

