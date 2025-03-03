:- include('database.pl').
indo_pakistani_war_of_1947_1948(Start,End) :- begin('indo_pakistani_war_of_1947_1948',_,_,Start), end('indo_pakistani_war_of_1947_1948',_,_,End), Start=<End.

next_indo_pakistani_war_of_1947_1948(Start,End) :- indo_pakistani_war_of_1947_1948(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_indo_pakistani_war_of_1947_1948_at_1854(Res) :- setof((Start,End),next_indo_pakistani_war_of_1947_1948(Start,End),AllINtervals), checkvalidity(1854,AllINtervals,Res).

check_query() :- write('Query = next_indo_pakistani_war_of_1947_1948_at_1854'), (next_indo_pakistani_war_of_1947_1948_at_1854(true) -> write('\nRes   = true');write('\nRes   = false')).

