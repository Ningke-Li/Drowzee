:- include('database.pl').
ev_2016_17_bundesliga(Start,End) :- begin('ev_2016_17_bundesliga',_,_,Start), end('ev_2016_17_bundesliga',_,_,End), Start=<End.

next_ev_2016_17_bundesliga(Start,End) :- ev_2016_17_bundesliga(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2016_17_bundesliga_at_2059(Res) :- setof((Start,End),next_ev_2016_17_bundesliga(Start,End),AllINtervals), checkvalidity(2059,AllINtervals,Res).

check_query() :- write('Query = next_ev_2016_17_bundesliga_at_2059'), (next_ev_2016_17_bundesliga_at_2059(true) -> write('\nRes   = true');write('\nRes   = false')).

