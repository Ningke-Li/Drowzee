:- include('database.pl').
ncis__los_angeles(Start,End) :- begin('ncis__los_angeles',_,_,Start), end('ncis__los_angeles',_,_,End), Start=<End.

globally_ncis__los_angeles_during_3_13(Start,End) :- ncis__los_angeles(Start1,End1), Start is (Start1-3), End is (End1-13), Start=<End.

globally_ncis__los_angeles_during_3_13_at_1962(Res) :- setof((Start,End),globally_ncis__los_angeles_during_3_13(Start,End),AllINtervals), checkvalidity(1962,AllINtervals,Res).

check_query() :- write('Query = globally_ncis__los_angeles_during_3_13_at_1962'), (globally_ncis__los_angeles_during_3_13_at_1962(true) -> write('\nRes   = true');write('\nRes   = false')).

