:- include('database.pl').
rowing_at_the_1900_summer_olympics(Start,End) :- begin('rowing_at_the_1900_summer_olympics',_,_,Start), end('rowing_at_the_1900_summer_olympics',_,_,End), Start=<End.

finally_rowing_at_the_1900_summer_olympics_during_8_18(Start,End) :- rowing_at_the_1900_summer_olympics(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_rowing_at_the_1900_summer_olympics_during_8_18_at_1886(Res) :- setof((Start,End),finally_rowing_at_the_1900_summer_olympics_during_8_18(Start,End),AllINtervals), checkvalidity(1886,AllINtervals,Res).

check_query() :- write('Query = finally_rowing_at_the_1900_summer_olympics_during_8_18_at_1886'), (finally_rowing_at_the_1900_summer_olympics_during_8_18_at_1886(true) -> write('\nRes   = true');write('\nRes   = false')).

