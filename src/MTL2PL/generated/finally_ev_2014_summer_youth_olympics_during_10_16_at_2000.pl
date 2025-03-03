:- include('database.pl').
ev_2014_summer_youth_olympics(Start,End) :- begin('ev_2014_summer_youth_olympics',_,_,Start), end('ev_2014_summer_youth_olympics',_,_,End), Start=<End.

finally_ev_2014_summer_youth_olympics_during_10_16(Start,End) :- ev_2014_summer_youth_olympics(Start1,End1), (Start1-16)=<(End1-10), Start is (Start1-16), End is (End1-10), Start=<End.

finally_ev_2014_summer_youth_olympics_during_10_16_at_2000(Res) :- setof((Start,End),finally_ev_2014_summer_youth_olympics_during_10_16(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2014_summer_youth_olympics_during_10_16_at_2000'), (finally_ev_2014_summer_youth_olympics_during_10_16_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

