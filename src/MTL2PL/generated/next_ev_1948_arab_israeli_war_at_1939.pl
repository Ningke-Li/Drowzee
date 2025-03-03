:- include('database.pl').
ev_1948_arab_israeli_war(Start,End) :- begin('ev_1948_arab_israeli_war',_,_,Start), end('ev_1948_arab_israeli_war',_,_,End), Start=<End.

next_ev_1948_arab_israeli_war(Start,End) :- ev_1948_arab_israeli_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1948_arab_israeli_war_at_1939(Res) :- setof((Start,End),next_ev_1948_arab_israeli_war(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = next_ev_1948_arab_israeli_war_at_1939'), (next_ev_1948_arab_israeli_war_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).

