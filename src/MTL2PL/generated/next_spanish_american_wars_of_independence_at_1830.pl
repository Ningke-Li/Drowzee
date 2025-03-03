:- include('database.pl').
spanish_american_wars_of_independence(Start,End) :- begin('spanish_american_wars_of_independence',_,_,Start), end('spanish_american_wars_of_independence',_,_,End), Start=<End.

next_spanish_american_wars_of_independence(Start,End) :- spanish_american_wars_of_independence(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_spanish_american_wars_of_independence_at_1830(Res) :- setof((Start,End),next_spanish_american_wars_of_independence(Start,End),AllINtervals), checkvalidity(1830,AllINtervals,Res).

check_query() :- write('Query = next_spanish_american_wars_of_independence_at_1830'), (next_spanish_american_wars_of_independence_at_1830(true) -> write('\nRes   = true');write('\nRes   = false')).

