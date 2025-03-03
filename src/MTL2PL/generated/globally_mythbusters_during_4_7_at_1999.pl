:- include('database.pl').
mythbusters(Start,End) :- begin('mythbusters',_,_,Start), end('mythbusters',_,_,End), Start=<End.

globally_mythbusters_during_4_7(Start,End) :- mythbusters(Start1,End1), Start is (Start1-4), End is (End1-7), Start=<End.

globally_mythbusters_during_4_7_at_1999(Res) :- setof((Start,End),globally_mythbusters_during_4_7(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = globally_mythbusters_during_4_7_at_1999'), (globally_mythbusters_during_4_7_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

