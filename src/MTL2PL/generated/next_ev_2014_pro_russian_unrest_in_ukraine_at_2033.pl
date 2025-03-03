:- include('database.pl').
ev_2014_pro_russian_unrest_in_ukraine(Start,End) :- begin('ev_2014_pro_russian_unrest_in_ukraine',_,_,Start), end('ev_2014_pro_russian_unrest_in_ukraine',_,_,End), Start=<End.

next_ev_2014_pro_russian_unrest_in_ukraine(Start,End) :- ev_2014_pro_russian_unrest_in_ukraine(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2014_pro_russian_unrest_in_ukraine_at_2033(Res) :- setof((Start,End),next_ev_2014_pro_russian_unrest_in_ukraine(Start,End),AllINtervals), checkvalidity(2033,AllINtervals,Res).

check_query() :- write('Query = next_ev_2014_pro_russian_unrest_in_ukraine_at_2033'), (next_ev_2014_pro_russian_unrest_in_ukraine_at_2033(true) -> write('\nRes   = true');write('\nRes   = false')).

