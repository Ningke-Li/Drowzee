:- include('database.pl').
great_plague_of_london(Start,End) :- begin('great_plague_of_london',_,_,Start), end('great_plague_of_london',_,_,End), Start=<End.

next_great_plague_of_london(Start,End) :- great_plague_of_london(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_great_plague_of_london_at_1647(Res) :- setof((Start,End),next_great_plague_of_london(Start,End),AllINtervals), checkvalidity(1647,AllINtervals,Res).

check_query() :- write('Query = next_great_plague_of_london_at_1647'), (next_great_plague_of_london_at_1647(true) -> write('\nRes   = true');write('\nRes   = false')).

