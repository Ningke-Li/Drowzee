:- include('database.pl').
badminton_at_the_2016_summer_olympics(Start,End) :- begin('badminton_at_the_2016_summer_olympics',_,_,Start), end('badminton_at_the_2016_summer_olympics',_,_,End), Start=<End.

finally_badminton_at_the_2016_summer_olympics_during_8_18(Start,End) :- badminton_at_the_2016_summer_olympics(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_badminton_at_the_2016_summer_olympics_during_8_18_at_1888(Res) :- setof((Start,End),finally_badminton_at_the_2016_summer_olympics_during_8_18(Start,End),AllINtervals), checkvalidity(1888,AllINtervals,Res).

check_query() :- write('Query = finally_badminton_at_the_2016_summer_olympics_during_8_18_at_1888'), (finally_badminton_at_the_2016_summer_olympics_during_8_18_at_1888(true) -> write('\nRes   = true');write('\nRes   = false')).

