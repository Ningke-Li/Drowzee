:- include('database.pl').
the_blacklist(Start,End) :- begin('the_blacklist',_,_,Start), end('the_blacklist',_,_,End), Start=<End.

next_the_blacklist(Start,End) :- the_blacklist(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_blacklist_at_2065(Res) :- setof((Start,End),next_the_blacklist(Start,End),AllINtervals), checkvalidity(2065,AllINtervals,Res).

check_query() :- write('Query = next_the_blacklist_at_2065'), (next_the_blacklist_at_2065(true) -> write('\nRes   = true');write('\nRes   = false')).

