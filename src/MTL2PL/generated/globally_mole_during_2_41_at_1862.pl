:- include('database.pl').
mole(Start,End) :- begin('mole',_,_,Start), end('mole',_,_,End), Start=<End.

globally_mole_during_2_41(Start,End) :- mole(Start1,End1), Start is (Start1-2), End is (End1-41), Start=<End.

globally_mole_during_2_41_at_1862(Res) :- setof((Start,End),globally_mole_during_2_41(Start,End),AllINtervals), checkvalidity(1862,AllINtervals,Res).

check_query() :- write('Query = globally_mole_during_2_41_at_1862'), (globally_mole_during_2_41_at_1862(true) -> write('\nRes   = true');write('\nRes   = false')).

