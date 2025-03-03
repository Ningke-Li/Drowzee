:- include('database.pl').
ev_1910s(Start,End) :- begin('ev_1910s',_,_,Start), end('ev_1910s',_,_,End), Start=<End.

globally_ev_1910s_during_2_6(Start,End) :- ev_1910s(Start1,End1), Start is (Start1-2), End is (End1-6), Start=<End.

globally_ev_1910s_during_2_6_at_1913(Res) :- setof((Start,End),globally_ev_1910s_during_2_6(Start,End),AllINtervals), checkvalidity(1913,AllINtervals,Res).

check_query() :- write('Query = globally_ev_1910s_during_2_6_at_1913'), (globally_ev_1910s_during_2_6_at_1913(true) -> write('\nRes   = true');write('\nRes   = false')).

