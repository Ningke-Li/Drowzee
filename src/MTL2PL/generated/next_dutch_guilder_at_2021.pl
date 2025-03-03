:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

next_dutch_guilder(Start,End) :- dutch_guilder(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_dutch_guilder_at_2021(Res) :- setof((Start,End),next_dutch_guilder(Start,End),AllINtervals), checkvalidity(2021,AllINtervals,Res).

check_query() :- write('Query = next_dutch_guilder_at_2021'), (next_dutch_guilder_at_2021(true) -> write('\nRes   = true');write('\nRes   = false')).

