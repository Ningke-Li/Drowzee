:- include('database.pl').
first_indochina_war(Start,End) :- begin('first_indochina_war',_,_,Start), end('first_indochina_war',_,_,End), Start=<End.

next_first_indochina_war(Start,End) :- first_indochina_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_first_indochina_war_at_1955(Res) :- setof((Start,End),next_first_indochina_war(Start,End),AllINtervals), checkvalidity(1955,AllINtervals,Res).

check_query() :- write('Query = next_first_indochina_war_at_1955'), (next_first_indochina_war_at_1955(true) -> write('\nRes   = true');write('\nRes   = false')).

