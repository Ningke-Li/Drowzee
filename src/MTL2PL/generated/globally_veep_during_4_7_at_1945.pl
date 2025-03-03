:- include('database.pl').
veep(Start,End) :- begin('veep',_,_,Start), end('veep',_,_,End), Start=<End.

globally_veep_during_4_7(Start,End) :- veep(Start1,End1), Start is (Start1-4), End is (End1-7), Start=<End.

globally_veep_during_4_7_at_1945(Res) :- setof((Start,End),globally_veep_during_4_7(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = globally_veep_during_4_7_at_1945'), (globally_veep_during_4_7_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).

