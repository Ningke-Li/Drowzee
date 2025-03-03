:- include('database.pl').
ev_1850s(Start,End) :- begin('ev_1850s',_,_,Start), end('ev_1850s',_,_,End), Start=<End.

globally_ev_1850s_during_1_2(Start,End) :- ev_1850s(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_ev_1850s_during_1_2_at_1807(Res) :- setof((Start,End),globally_ev_1850s_during_1_2(Start,End),AllINtervals), checkvalidity(1807,AllINtervals,Res).

check_query() :- write('Query = globally_ev_1850s_during_1_2_at_1807'), (globally_ev_1850s_during_1_2_at_1807(true) -> write('\nRes   = true');write('\nRes   = false')).

