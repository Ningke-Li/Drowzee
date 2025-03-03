:- include('database.pl').
ev_2003_invasion_of_iraq(Start,End) :- begin('ev_2003_invasion_of_iraq',_,_,Start), end('ev_2003_invasion_of_iraq',_,_,End), Start=<End.

next_ev_2003_invasion_of_iraq(Start,End) :- ev_2003_invasion_of_iraq(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2003_invasion_of_iraq_at_2035(Res) :- setof((Start,End),next_ev_2003_invasion_of_iraq(Start,End),AllINtervals), checkvalidity(2035,AllINtervals,Res).

check_query() :- write('Query = next_ev_2003_invasion_of_iraq_at_2035'), (next_ev_2003_invasion_of_iraq_at_2035(true) -> write('\nRes   = true');write('\nRes   = false')).

