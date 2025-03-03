:- include('database.pl').
taiping_rebellion(Start,End) :- begin('taiping_rebellion',_,_,Start), end('taiping_rebellion',_,_,End), Start=<End.

globally_taiping_rebellion_during_1_11(Start,End) :- taiping_rebellion(Start1,End1), Start is (Start1-1), End is (End1-11), Start=<End.

globally_taiping_rebellion_during_1_11_at_1851(Res) :- setof((Start,End),globally_taiping_rebellion_during_1_11(Start,End),AllINtervals), checkvalidity(1851,AllINtervals,Res).

check_query() :- write('Query = globally_taiping_rebellion_during_1_11_at_1851'), (globally_taiping_rebellion_during_1_11_at_1851(true) -> write('\nRes   = true');write('\nRes   = false')).

