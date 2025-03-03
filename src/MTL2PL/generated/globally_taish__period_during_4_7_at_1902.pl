:- include('database.pl').
taish__period(Start,End) :- begin('taish__period',_,_,Start), end('taish__period',_,_,End), Start=<End.

globally_taish__period_during_4_7(Start,End) :- taish__period(Start1,End1), Start is (Start1-4), End is (End1-7), Start=<End.

globally_taish__period_during_4_7_at_1902(Res) :- setof((Start,End),globally_taish__period_during_4_7(Start,End),AllINtervals), checkvalidity(1902,AllINtervals,Res).

check_query() :- write('Query = globally_taish__period_during_4_7_at_1902'), (globally_taish__period_during_4_7_at_1902(true) -> write('\nRes   = true');write('\nRes   = false')).

