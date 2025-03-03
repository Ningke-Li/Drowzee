:- include('database.pl').
bombing_of_dresden(Start,End) :- begin('bombing_of_dresden',_,_,Start), end('bombing_of_dresden',_,_,End), Start=<End.

next_bombing_of_dresden(Start,End) :- bombing_of_dresden(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_bombing_of_dresden_at_1944(Res) :- setof((Start,End),next_bombing_of_dresden(Start,End),AllINtervals), checkvalidity(1944,AllINtervals,Res).

check_query() :- write('Query = next_bombing_of_dresden_at_1944'), (next_bombing_of_dresden_at_1944(true) -> write('\nRes   = true');write('\nRes   = false')).

