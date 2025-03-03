:- include('database.pl').
andromeda(Start,End) :- begin('andromeda',_,_,Start), end('andromeda',_,_,End), Start=<End.

globally_andromeda_during_2_5(Start,End) :- andromeda(Start1,End1), Start is (Start1-2), End is (End1-5), Start=<End.

next_globally_andromeda_during_2_5(Start,End) :- globally_andromeda_during_2_5(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_andromeda_during_2_5_at_1901(Res) :- setof((Start,End),next_globally_andromeda_during_2_5(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = next_globally_andromeda_during_2_5_at_1901'), (next_globally_andromeda_during_2_5_at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).

