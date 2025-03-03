:- include('database.pl').
first_anglo_dutch_war(Start,End) :- begin('first_anglo_dutch_war',_,_,Start), end('first_anglo_dutch_war',_,_,End), Start=<End.

globally_first_anglo_dutch_war_during_1_2(Start,End) :- first_anglo_dutch_war(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_first_anglo_dutch_war_during_1_2_at_1642(Res) :- setof((Start,End),globally_first_anglo_dutch_war_during_1_2(Start,End),AllINtervals), checkvalidity(1642,AllINtervals,Res).

check_query() :- write('Query = globally_first_anglo_dutch_war_during_1_2_at_1642'), (globally_first_anglo_dutch_war_during_1_2_at_1642(true) -> write('\nRes   = true');write('\nRes   = false')).

