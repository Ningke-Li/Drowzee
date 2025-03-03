:- include('database.pl').
ev_24(Start,End) :- begin('ev_24',_,_,Start), end('ev_24',_,_,End), Start=<End.

globally_ev_24_during_1_8(Start,End) :- ev_24(Start1,End1), Start is (Start1-1), End is (End1-8), Start=<End.

globally_ev_24_during_1_8_at_1981(Res) :- setof((Start,End),globally_ev_24_during_1_8(Start,End),AllINtervals), checkvalidity(1981,AllINtervals,Res).

check_query() :- write('Query = globally_ev_24_during_1_8_at_1981'), (globally_ev_24_during_1_8_at_1981(true) -> write('\nRes   = true');write('\nRes   = false')).

