:- include('database.pl').
fairy_tail(Start,End) :- begin('fairy_tail',_,_,Start), end('fairy_tail',_,_,End), Start=<End.

globally_fairy_tail_during_1_11(Start,End) :- fairy_tail(Start1,End1), Start is (Start1-1), End is (End1-11), Start=<End.

globally_fairy_tail_during_1_11_at_1959(Res) :- setof((Start,End),globally_fairy_tail_during_1_11(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = globally_fairy_tail_during_1_11_at_1959'), (globally_fairy_tail_during_1_11_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).

