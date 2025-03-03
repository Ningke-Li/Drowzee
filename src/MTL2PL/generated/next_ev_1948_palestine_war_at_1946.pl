:- include('database.pl').
ev_1948_palestine_war(Start,End) :- begin('ev_1948_palestine_war',_,_,Start), end('ev_1948_palestine_war',_,_,End), Start=<End.

next_ev_1948_palestine_war(Start,End) :- ev_1948_palestine_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1948_palestine_war_at_1946(Res) :- setof((Start,End),next_ev_1948_palestine_war(Start,End),AllINtervals), checkvalidity(1946,AllINtervals,Res).

check_query() :- write('Query = next_ev_1948_palestine_war_at_1946'), (next_ev_1948_palestine_war_at_1946(true) -> write('\nRes   = true');write('\nRes   = false')).

