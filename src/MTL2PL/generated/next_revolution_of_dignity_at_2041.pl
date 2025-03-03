:- include('database.pl').
revolution_of_dignity(Start,End) :- begin('revolution_of_dignity',_,_,Start), end('revolution_of_dignity',_,_,End), Start=<End.

next_revolution_of_dignity(Start,End) :- revolution_of_dignity(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_revolution_of_dignity_at_2041(Res) :- setof((Start,End),next_revolution_of_dignity(Start,End),AllINtervals), checkvalidity(2041,AllINtervals,Res).

check_query() :- write('Query = next_revolution_of_dignity_at_2041'), (next_revolution_of_dignity_at_2041(true) -> write('\nRes   = true');write('\nRes   = false')).

