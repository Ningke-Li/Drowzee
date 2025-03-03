:- include('database.pl').
quasi_war(Start,End) :- begin('quasi_war',_,_,Start), end('quasi_war',_,_,End), Start=<End.

next_quasi_war(Start,End) :- quasi_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_quasi_war_at_1656(Res) :- setof((Start,End),next_quasi_war(Start,End),AllINtervals), checkvalidity(1656,AllINtervals,Res).

check_query() :- write('Query = next_quasi_war_at_1656'), (next_quasi_war_at_1656(true) -> write('\nRes   = true');write('\nRes   = false')).

