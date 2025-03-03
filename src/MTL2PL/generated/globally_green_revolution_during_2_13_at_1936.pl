:- include('database.pl').
green_revolution(Start,End) :- begin('green_revolution',_,_,Start), end('green_revolution',_,_,End), Start=<End.

globally_green_revolution_during_2_13(Start,End) :- green_revolution(Start1,End1), Start is (Start1-2), End is (End1-13), Start=<End.

globally_green_revolution_during_2_13_at_1936(Res) :- setof((Start,End),globally_green_revolution_during_2_13(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = globally_green_revolution_during_2_13_at_1936'), (globally_green_revolution_during_2_13_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).

