:- include('database.pl').
schitt_s_creek(Start,End) :- begin('schitt_s_creek',_,_,Start), end('schitt_s_creek',_,_,End), Start=<End.

globally_schitt_s_creek_during_2_4(Start,End) :- schitt_s_creek(Start1,End1), Start is (Start1-2), End is (End1-4), Start=<End.

next_globally_schitt_s_creek_during_2_4(Start,End) :- globally_schitt_s_creek_during_2_4(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_schitt_s_creek_during_2_4_at_1963(Res) :- setof((Start,End),next_globally_schitt_s_creek_during_2_4(Start,End),AllINtervals), checkvalidity(1963,AllINtervals,Res).

check_query() :- write('Query = next_globally_schitt_s_creek_during_2_4_at_1963'), (next_globally_schitt_s_creek_during_2_4_at_1963(true) -> write('\nRes   = true');write('\nRes   = false')).

