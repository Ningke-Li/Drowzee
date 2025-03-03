:- include('database.pl').
harry_potter(Start,End) :- begin('harry_potter',_,_,Start), end('harry_potter',_,_,End), Start=<End.

finally_harry_potter_during_7_20(Start,End) :- harry_potter(Start1,End1), (Start1-20)=<(End1-7), Start is (Start1-20), End is (End1-7), Start=<End.

finally_harry_potter_during_7_20_at_2018(Res) :- setof((Start,End),finally_harry_potter_during_7_20(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = finally_harry_potter_during_7_20_at_2018'), (finally_harry_potter_during_7_20_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).

