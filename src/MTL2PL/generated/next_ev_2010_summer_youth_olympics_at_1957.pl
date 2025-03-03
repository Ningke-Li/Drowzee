:- include('database.pl').
ev_2010_summer_youth_olympics(Start,End) :- begin('ev_2010_summer_youth_olympics',_,_,Start), end('ev_2010_summer_youth_olympics',_,_,End), Start=<End.

next_ev_2010_summer_youth_olympics(Start,End) :- ev_2010_summer_youth_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2010_summer_youth_olympics_at_1957(Res) :- setof((Start,End),next_ev_2010_summer_youth_olympics(Start,End),AllINtervals), checkvalidity(1957,AllINtervals,Res).

check_query() :- write('Query = next_ev_2010_summer_youth_olympics_at_1957'), (next_ev_2010_summer_youth_olympics_at_1957(true) -> write('\nRes   = true');write('\nRes   = false')).

