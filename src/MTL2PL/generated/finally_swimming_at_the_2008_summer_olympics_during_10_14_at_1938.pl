:- include('database.pl').
swimming_at_the_2008_summer_olympics(Start,End) :- begin('swimming_at_the_2008_summer_olympics',_,_,Start), end('swimming_at_the_2008_summer_olympics',_,_,End), Start=<End.

finally_swimming_at_the_2008_summer_olympics_during_10_14(Start,End) :- swimming_at_the_2008_summer_olympics(Start1,End1), (Start1-14)=<(End1-10), Start is (Start1-14), End is (End1-10), Start=<End.

finally_swimming_at_the_2008_summer_olympics_during_10_14_at_1938(Res) :- setof((Start,End),finally_swimming_at_the_2008_summer_olympics_during_10_14(Start,End),AllINtervals), checkvalidity(1938,AllINtervals,Res).

check_query() :- write('Query = finally_swimming_at_the_2008_summer_olympics_during_10_14_at_1938'), (finally_swimming_at_the_2008_summer_olympics_during_10_14_at_1938(true) -> write('\nRes   = true');write('\nRes   = false')).

