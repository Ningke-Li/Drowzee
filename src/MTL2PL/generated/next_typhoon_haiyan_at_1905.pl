:- include('database.pl').
typhoon_haiyan(Start,End) :- begin('typhoon_haiyan',_,_,Start), end('typhoon_haiyan',_,_,End), Start=<End.

next_typhoon_haiyan(Start,End) :- typhoon_haiyan(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_typhoon_haiyan_at_1905(Res) :- setof((Start,End),next_typhoon_haiyan(Start,End),AllINtervals), checkvalidity(1905,AllINtervals,Res).

check_query() :- write('Query = next_typhoon_haiyan_at_1905'), (next_typhoon_haiyan_at_1905(true) -> write('\nRes   = true');write('\nRes   = false')).

