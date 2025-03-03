:- include('database.pl').
code_lyoko(Start,End) :- begin('code_lyoko',_,_,Start), end('code_lyoko',_,_,End), Start=<End.

globally_code_lyoko_during_1_3(Start,End) :- code_lyoko(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_code_lyoko_during_1_3(Start,End) :- globally_code_lyoko_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_code_lyoko_during_1_3_at_2001(Res) :- setof((Start,End),next_globally_code_lyoko_during_1_3(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = next_globally_code_lyoko_during_1_3_at_2001'), (next_globally_code_lyoko_during_1_3_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

