:- include('database.pl').
sons_of_anarchy(Start,End) :- begin('sons_of_anarchy',_,_,Start), end('sons_of_anarchy',_,_,End), Start=<End.

globally_sons_of_anarchy_during_2_3(Start,End) :- sons_of_anarchy(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

globally_sons_of_anarchy_during_2_3_at_1989(Res) :- setof((Start,End),globally_sons_of_anarchy_during_2_3(Start,End),AllINtervals), checkvalidity(1989,AllINtervals,Res).

check_query() :- write('Query = globally_sons_of_anarchy_during_2_3_at_1989'), (globally_sons_of_anarchy_during_2_3_at_1989(true) -> write('\nRes   = true');write('\nRes   = false')).

