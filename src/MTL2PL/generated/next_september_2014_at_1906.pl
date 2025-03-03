:- include('database.pl').
september_2014(Start,End) :- begin('september_2014',_,_,Start), end('september_2014',_,_,End), Start=<End.

next_september_2014(Start,End) :- september_2014(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_september_2014_at_1906(Res) :- setof((Start,End),next_september_2014(Start,End),AllINtervals), checkvalidity(1906,AllINtervals,Res).

check_query() :- write('Query = next_september_2014_at_1906'), (next_september_2014_at_1906(true) -> write('\nRes   = true');write('\nRes   = false')).

