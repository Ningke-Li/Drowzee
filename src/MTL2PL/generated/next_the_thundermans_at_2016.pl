:- include('database.pl').
the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

next_the_thundermans(Start,End) :- the_thundermans(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_thundermans_at_2016(Res) :- setof((Start,End),next_the_thundermans(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = next_the_thundermans_at_2016'), (next_the_thundermans_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).

