:- include('database.pl').
handball_at_the_2008_summer_olympics(Start,End) :- begin('handball_at_the_2008_summer_olympics',_,_,Start), end('handball_at_the_2008_summer_olympics',_,_,End), Start=<End.

finally_handball_at_the_2008_summer_olympics_during_5_18(Start,End) :- handball_at_the_2008_summer_olympics(Start1,End1), (Start1-18)=<(End1-5), Start is (Start1-18), End is (End1-5), Start=<End.

finally_handball_at_the_2008_summer_olympics_during_5_18_at_2039(Res) :- setof((Start,End),finally_handball_at_the_2008_summer_olympics_during_5_18(Start,End),AllINtervals), checkvalidity(2039,AllINtervals,Res).

check_query() :- write('Query = finally_handball_at_the_2008_summer_olympics_during_5_18_at_2039'), (finally_handball_at_the_2008_summer_olympics_during_5_18_at_2039(true) -> write('\nRes   = true');write('\nRes   = false')).

