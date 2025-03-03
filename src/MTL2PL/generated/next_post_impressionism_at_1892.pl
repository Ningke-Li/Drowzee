:- include('database.pl').
post_impressionism(Start,End) :- begin('post_impressionism',_,_,Start), end('post_impressionism',_,_,End), Start=<End.

next_post_impressionism(Start,End) :- post_impressionism(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_post_impressionism_at_1892(Res) :- setof((Start,End),next_post_impressionism(Start,End),AllINtervals), checkvalidity(1892,AllINtervals,Res).

check_query() :- write('Query = next_post_impressionism_at_1892'), (next_post_impressionism_at_1892(true) -> write('\nRes   = true');write('\nRes   = false')).

