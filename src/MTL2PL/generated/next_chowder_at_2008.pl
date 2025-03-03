:- include('database.pl').
chowder(Start,End) :- begin('chowder',_,_,Start), end('chowder',_,_,End), Start=<End.

next_chowder(Start,End) :- chowder(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_chowder_at_2008(Res) :- setof((Start,End),next_chowder(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = next_chowder_at_2008'), (next_chowder_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

