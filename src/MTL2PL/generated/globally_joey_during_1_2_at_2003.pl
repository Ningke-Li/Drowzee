:- include('database.pl').
joey(Start,End) :- begin('joey',_,_,Start), end('joey',_,_,End), Start=<End.

globally_joey_during_1_2(Start,End) :- joey(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_joey_during_1_2_at_2003(Res) :- setof((Start,End),globally_joey_during_1_2(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = globally_joey_during_1_2_at_2003'), (globally_joey_during_1_2_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

