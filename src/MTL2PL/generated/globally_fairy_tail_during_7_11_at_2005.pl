:- include('database.pl').
fairy_tail(Start,End) :- begin('fairy_tail',_,_,Start), end('fairy_tail',_,_,End), Start=<End.

globally_fairy_tail_during_7_11(Start,End) :- fairy_tail(Start1,End1), Start is (Start1-7), End is (End1-11), Start=<End.

globally_fairy_tail_during_7_11_at_2005(Res) :- setof((Start,End),globally_fairy_tail_during_7_11(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = globally_fairy_tail_during_7_11_at_2005'), (globally_fairy_tail_during_7_11_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

