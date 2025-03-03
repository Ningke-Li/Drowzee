:- include('database.pl').
first_anglo_afghan_war(Start,End) :- begin('first_anglo_afghan_war',_,_,Start), end('first_anglo_afghan_war',_,_,End), Start=<End.

next_first_anglo_afghan_war(Start,End) :- first_anglo_afghan_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_first_anglo_afghan_war_at_1754(Res) :- setof((Start,End),next_first_anglo_afghan_war(Start,End),AllINtervals), checkvalidity(1754,AllINtervals,Res).

check_query() :- write('Query = next_first_anglo_afghan_war_at_1754'), (next_first_anglo_afghan_war_at_1754(true) -> write('\nRes   = true');write('\nRes   = false')).

