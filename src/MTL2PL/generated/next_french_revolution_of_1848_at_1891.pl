:- include('database.pl').
french_revolution_of_1848(Start,End) :- begin('french_revolution_of_1848',_,_,Start), end('french_revolution_of_1848',_,_,End), Start=<End.

next_french_revolution_of_1848(Start,End) :- french_revolution_of_1848(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_french_revolution_of_1848_at_1891(Res) :- setof((Start,End),next_french_revolution_of_1848(Start,End),AllINtervals), checkvalidity(1891,AllINtervals,Res).

check_query() :- write('Query = next_french_revolution_of_1848_at_1891'), (next_french_revolution_of_1848_at_1891(true) -> write('\nRes   = true');write('\nRes   = false')).

