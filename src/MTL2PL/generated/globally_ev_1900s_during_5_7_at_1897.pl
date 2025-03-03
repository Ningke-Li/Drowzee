:- include('database.pl').
ev_1900s(Start,End) :- begin('ev_1900s',_,_,Start), end('ev_1900s',_,_,End), Start=<End.

globally_ev_1900s_during_5_7(Start,End) :- ev_1900s(Start1,End1), Start is (Start1-5), End is (End1-7), Start=<End.

globally_ev_1900s_during_5_7_at_1897(Res) :- setof((Start,End),globally_ev_1900s_during_5_7(Start,End),AllINtervals), checkvalidity(1897,AllINtervals,Res).

check_query() :- write('Query = globally_ev_1900s_during_5_7_at_1897'), (globally_ev_1900s_during_5_7_at_1897(true) -> write('\nRes   = true');write('\nRes   = false')).

