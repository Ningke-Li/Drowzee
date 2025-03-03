:- include('database.pl').
scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

next_scooby_doo__mystery_incorporated(Start,End) :- scooby_doo__mystery_incorporated(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_scooby_doo__mystery_incorporated_at_2049(Res) :- setof((Start,End),next_scooby_doo__mystery_incorporated(Start,End),AllINtervals), checkvalidity(2049,AllINtervals,Res).

check_query() :- write('Query = next_scooby_doo__mystery_incorporated_at_2049'), (next_scooby_doo__mystery_incorporated_at_2049(true) -> write('\nRes   = true');write('\nRes   = false')).

