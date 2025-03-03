:- include('database.pl').
quantico(Start,End) :- begin('quantico',_,_,Start), end('quantico',_,_,End), Start=<End.

globally_quantico_during_1_3(Start,End) :- quantico(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_quantico_during_1_3_at_2000(Res) :- setof((Start,End),globally_quantico_during_1_3(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = globally_quantico_during_1_3_at_2000'), (globally_quantico_during_1_3_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

