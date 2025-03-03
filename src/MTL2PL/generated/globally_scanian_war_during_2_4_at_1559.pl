:- include('database.pl').
scanian_war(Start,End) :- begin('scanian_war',_,_,Start), end('scanian_war',_,_,End), Start=<End.

globally_scanian_war_during_2_4(Start,End) :- scanian_war(Start1,End1), Start is (Start1-2), End is (End1-4), Start=<End.

globally_scanian_war_during_2_4_at_1559(Res) :- setof((Start,End),globally_scanian_war_during_2_4(Start,End),AllINtervals), checkvalidity(1559,AllINtervals,Res).

check_query() :- write('Query = globally_scanian_war_during_2_4_at_1559'), (globally_scanian_war_during_2_4_at_1559(true) -> write('\nRes   = true');write('\nRes   = false')).

