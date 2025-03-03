:- include('database.pl').
siege_of_warsaw(Start,End) :- begin('siege_of_warsaw',_,_,Start), end('siege_of_warsaw',_,_,End), Start=<End.

next_siege_of_warsaw(Start,End) :- siege_of_warsaw(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_siege_of_warsaw_at_1968(Res) :- setof((Start,End),next_siege_of_warsaw(Start,End),AllINtervals), checkvalidity(1968,AllINtervals,Res).

check_query() :- write('Query = next_siege_of_warsaw_at_1968'), (next_siege_of_warsaw_at_1968(true) -> write('\nRes   = true');write('\nRes   = false')).

