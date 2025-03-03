:- include('database.pl').
rome(Start,End) :- begin('rome',_,_,Start), end('rome',_,_,End), Start=<End.

globally_rome_during_1_2(Start,End) :- rome(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_rome_during_1_2_at_1976(Res) :- setof((Start,End),globally_rome_during_1_2(Start,End),AllINtervals), checkvalidity(1976,AllINtervals,Res).

check_query() :- write('Query = globally_rome_during_1_2_at_1976'), (globally_rome_during_1_2_at_1976(true) -> write('\nRes   = true');write('\nRes   = false')).

