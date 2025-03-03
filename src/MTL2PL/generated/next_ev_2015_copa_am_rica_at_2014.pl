:- include('database.pl').
ev_2015_copa_am_rica(Start,End) :- begin('ev_2015_copa_am_rica',_,_,Start), end('ev_2015_copa_am_rica',_,_,End), Start=<End.

next_ev_2015_copa_am_rica(Start,End) :- ev_2015_copa_am_rica(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2015_copa_am_rica_at_2014(Res) :- setof((Start,End),next_ev_2015_copa_am_rica(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = next_ev_2015_copa_am_rica_at_2014'), (next_ev_2015_copa_am_rica_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).

