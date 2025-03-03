:- include('database.pl').
speed_skating_at_the_2014_winter_olympics(Start,End) :- begin('speed_skating_at_the_2014_winter_olympics',_,_,Start), end('speed_skating_at_the_2014_winter_olympics',_,_,End), Start=<End.

finally_speed_skating_at_the_2014_winter_olympics_during_6_15(Start,End) :- speed_skating_at_the_2014_winter_olympics(Start1,End1), (Start1-15)=<(End1-6), Start is (Start1-15), End is (End1-6), Start=<End.

finally_speed_skating_at_the_2014_winter_olympics_during_6_15_at_2040(Res) :- setof((Start,End),finally_speed_skating_at_the_2014_winter_olympics_during_6_15(Start,End),AllINtervals), checkvalidity(2040,AllINtervals,Res).

check_query() :- write('Query = finally_speed_skating_at_the_2014_winter_olympics_during_6_15_at_2040'), (finally_speed_skating_at_the_2014_winter_olympics_during_6_15_at_2040(true) -> write('\nRes   = true');write('\nRes   = false')).

