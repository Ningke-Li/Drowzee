:- include('database.pl').
crimean_war(Start,End) :- begin('crimean_war',_,_,Start), end('crimean_war',_,_,End), Start=<End.

next_crimean_war(Start,End) :- crimean_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_crimean_war_at_1847(Res) :- setof((Start,End),next_crimean_war(Start,End),AllINtervals), checkvalidity(1847,AllINtervals,Res).

check_query() :- write('Query = next_crimean_war_at_1847'), (next_crimean_war_at_1847(true) -> write('\nRes   = true');write('\nRes   = false')).

