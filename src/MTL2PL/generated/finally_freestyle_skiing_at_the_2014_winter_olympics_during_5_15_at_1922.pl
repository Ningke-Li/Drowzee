:- include('database.pl').
freestyle_skiing_at_the_2014_winter_olympics(Start,End) :- begin('freestyle_skiing_at_the_2014_winter_olympics',_,_,Start), end('freestyle_skiing_at_the_2014_winter_olympics',_,_,End), Start=<End.

finally_freestyle_skiing_at_the_2014_winter_olympics_during_5_15(Start,End) :- freestyle_skiing_at_the_2014_winter_olympics(Start1,End1), (Start1-15)=<(End1-5), Start is (Start1-15), End is (End1-5), Start=<End.

finally_freestyle_skiing_at_the_2014_winter_olympics_during_5_15_at_1922(Res) :- setof((Start,End),finally_freestyle_skiing_at_the_2014_winter_olympics_during_5_15(Start,End),AllINtervals), checkvalidity(1922,AllINtervals,Res).

check_query() :- write('Query = finally_freestyle_skiing_at_the_2014_winter_olympics_during_5_15_at_1922'), (finally_freestyle_skiing_at_the_2014_winter_olympics_during_5_15_at_1922(true) -> write('\nRes   = true');write('\nRes   = false')).

