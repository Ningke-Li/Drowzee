:- include('database.pl').
scrubs(Start,End) :- begin('scrubs',_,_,Start), end('scrubs',_,_,End), Start=<End.

next_scrubs(Start,End) :- scrubs(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_scrubs_at_1889(Res) :- setof((Start,End),next_scrubs(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = next_scrubs_at_1889'), (next_scrubs_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).

