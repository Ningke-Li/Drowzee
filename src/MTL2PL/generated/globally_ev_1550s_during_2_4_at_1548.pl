:- include('database.pl').
ev_1550s(Start,End) :- begin('ev_1550s',_,_,Start), end('ev_1550s',_,_,End), Start=<End.

globally_ev_1550s_during_2_4(Start,End) :- ev_1550s(Start1,End1), Start is (Start1-2), End is (End1-4), Start=<End.

globally_ev_1550s_during_2_4_at_1548(Res) :- setof((Start,End),globally_ev_1550s_during_2_4(Start,End),AllINtervals), checkvalidity(1548,AllINtervals,Res).

check_query() :- write('Query = globally_ev_1550s_during_2_4_at_1548'), (globally_ev_1550s_during_2_4_at_1548(true) -> write('\nRes   = true');write('\nRes   = false')).

