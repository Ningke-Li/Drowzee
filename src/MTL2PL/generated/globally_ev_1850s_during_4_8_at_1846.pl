:- include('database.pl').
ev_1850s(Start,End) :- begin('ev_1850s',_,_,Start), end('ev_1850s',_,_,End), Start=<End.

globally_ev_1850s_during_4_8(Start,End) :- ev_1850s(Start1,End1), Start is (Start1-4), End is (End1-8), Start=<End.

globally_ev_1850s_during_4_8_at_1846(Res) :- setof((Start,End),globally_ev_1850s_during_4_8(Start,End),AllINtervals), checkvalidity(1846,AllINtervals,Res).

check_query() :- write('Query = globally_ev_1850s_during_4_8_at_1846'), (globally_ev_1850s_during_4_8_at_1846(true) -> write('\nRes   = true');write('\nRes   = false')).

