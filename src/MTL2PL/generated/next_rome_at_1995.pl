:- include('database.pl').
rome(Start,End) :- begin('rome',_,_,Start), end('rome',_,_,End), Start=<End.

next_rome(Start,End) :- rome(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_rome_at_1995(Res) :- setof((Start,End),next_rome(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = next_rome_at_1995'), (next_rome_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

