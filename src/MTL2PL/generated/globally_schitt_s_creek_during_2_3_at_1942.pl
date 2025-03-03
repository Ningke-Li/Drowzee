:- include('database.pl').
schitt_s_creek(Start,End) :- begin('schitt_s_creek',_,_,Start), end('schitt_s_creek',_,_,End), Start=<End.

globally_schitt_s_creek_during_2_3(Start,End) :- schitt_s_creek(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

globally_schitt_s_creek_during_2_3_at_1942(Res) :- setof((Start,End),globally_schitt_s_creek_during_2_3(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = globally_schitt_s_creek_during_2_3_at_1942'), (globally_schitt_s_creek_during_2_3_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).

