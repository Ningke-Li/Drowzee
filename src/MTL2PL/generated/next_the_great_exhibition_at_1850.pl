:- include('database.pl').
the_great_exhibition(Start,End) :- begin('the_great_exhibition',_,_,Start), end('the_great_exhibition',_,_,End), Start=<End.

next_the_great_exhibition(Start,End) :- the_great_exhibition(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_great_exhibition_at_1850(Res) :- setof((Start,End),next_the_great_exhibition(Start,End),AllINtervals), checkvalidity(1850,AllINtervals,Res).

check_query() :- write('Query = next_the_great_exhibition_at_1850'), (next_the_great_exhibition_at_1850(true) -> write('\nRes   = true');write('\nRes   = false')).

