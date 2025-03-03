:- include('database.pl').
ev_2017_18_bundesliga(Start,End) :- begin('ev_2017_18_bundesliga',_,_,Start), end('ev_2017_18_bundesliga',_,_,End), Start=<End.

next_ev_2017_18_bundesliga(Start,End) :- ev_2017_18_bundesliga(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2017_18_bundesliga_at_2017(Res) :- setof((Start,End),next_ev_2017_18_bundesliga(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = next_ev_2017_18_bundesliga_at_2017'), (next_ev_2017_18_bundesliga_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).

