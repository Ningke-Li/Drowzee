:- include('database.pl').
nordic_combined_at_the_2014_winter_olympics(Start,End) :- begin('nordic_combined_at_the_2014_winter_olympics',_,_,Start), end('nordic_combined_at_the_2014_winter_olympics',_,_,End), Start=<End.

finally_nordic_combined_at_the_2014_winter_olympics_during_4_11(Start,End) :- nordic_combined_at_the_2014_winter_olympics(Start1,End1), (Start1-11)=<(End1-4), Start is (Start1-11), End is (End1-4), Start=<End.

finally_nordic_combined_at_the_2014_winter_olympics_during_4_11_at_2035(Res) :- setof((Start,End),finally_nordic_combined_at_the_2014_winter_olympics_during_4_11(Start,End),AllINtervals), checkvalidity(2035,AllINtervals,Res).

check_query() :- write('Query = finally_nordic_combined_at_the_2014_winter_olympics_during_4_11_at_2035'), (finally_nordic_combined_at_the_2014_winter_olympics_during_4_11_at_2035(true) -> write('\nRes   = true');write('\nRes   = false')).

