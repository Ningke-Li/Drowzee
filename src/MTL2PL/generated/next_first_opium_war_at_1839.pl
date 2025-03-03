:- include('database.pl').
first_opium_war(Start,End) :- begin('first_opium_war',_,_,Start), end('first_opium_war',_,_,End), Start=<End.

next_first_opium_war(Start,End) :- first_opium_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_first_opium_war_at_1839(Res) :- setof((Start,End),next_first_opium_war(Start,End),AllINtervals), checkvalidity(1839,AllINtervals,Res).

check_query() :- write('Query = next_first_opium_war_at_1839'), (next_first_opium_war_at_1839(true) -> write('\nRes   = true');write('\nRes   = false')).

