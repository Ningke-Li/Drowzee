:- include('database.pl').
ev_1924_summer_olympics(Start,End) :- begin('ev_1924_summer_olympics',_,_,Start), end('ev_1924_summer_olympics',_,_,End), Start=<End.

next_ev_1924_summer_olympics(Start,End) :- ev_1924_summer_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1924_summer_olympics_at_1814(Res) :- setof((Start,End),next_ev_1924_summer_olympics(Start,End),AllINtervals), checkvalidity(1814,AllINtervals,Res).

check_query() :- write('Query = next_ev_1924_summer_olympics_at_1814'), (next_ev_1924_summer_olympics_at_1814(true) -> write('\nRes   = true');write('\nRes   = false')).

