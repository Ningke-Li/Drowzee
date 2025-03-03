:- include('database.pl').
handball_at_the_2000_summer_olympics(Start,End) :- begin('handball_at_the_2000_summer_olympics',_,_,Start), end('handball_at_the_2000_summer_olympics',_,_,End), Start=<End.

finally_handball_at_the_2000_summer_olympics_during_3_18(Start,End) :- handball_at_the_2000_summer_olympics(Start1,End1), (Start1-18)=<(End1-3), Start is (Start1-18), End is (End1-3), Start=<End.

finally_handball_at_the_2000_summer_olympics_during_3_18_at_1881(Res) :- setof((Start,End),finally_handball_at_the_2000_summer_olympics_during_3_18(Start,End),AllINtervals), checkvalidity(1881,AllINtervals,Res).

check_query() :- write('Query = finally_handball_at_the_2000_summer_olympics_during_3_18_at_1881'), (finally_handball_at_the_2000_summer_olympics_during_3_18_at_1881(true) -> write('\nRes   = true');write('\nRes   = false')).

