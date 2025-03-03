:- include('database.pl').
mole(Start,End) :- begin('mole',_,_,Start), end('mole',_,_,End), Start=<End.

finally_mole_during_2_18(Start,End) :- mole(Start1,End1), (Start1-18)=<(End1-2), Start is (Start1-18), End is (End1-2), Start=<End.

globally_finally_mole_during_2_18_during_45_56(Start,End) :- finally_mole_during_2_18(Start1,End1), Start is (Start1-45), End is (End1-56), Start=<End.

globally_finally_mole_during_2_18_during_45_56_at_1936(Res) :- setof((Start,End),globally_finally_mole_during_2_18_during_45_56(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = globally_finally_mole_during_2_18_during_45_56_at_1936'), (globally_finally_mole_during_2_18_during_45_56_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).

