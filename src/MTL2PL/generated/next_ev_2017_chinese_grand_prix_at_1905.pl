:- include('database.pl').
ev_2017_chinese_grand_prix(Start,End) :- begin('ev_2017_chinese_grand_prix',_,_,Start), end('ev_2017_chinese_grand_prix',_,_,End), Start=<End.

next_ev_2017_chinese_grand_prix(Start,End) :- ev_2017_chinese_grand_prix(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2017_chinese_grand_prix_at_1905(Res) :- setof((Start,End),next_ev_2017_chinese_grand_prix(Start,End),AllINtervals), checkvalidity(1905,AllINtervals,Res).

check_query() :- write('Query = next_ev_2017_chinese_grand_prix_at_1905'), (next_ev_2017_chinese_grand_prix_at_1905(true) -> write('\nRes   = true');write('\nRes   = false')).

