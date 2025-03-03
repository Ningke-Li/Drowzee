:- include('database.pl').
first_anglo_dutch_war(Start,End) :- begin('first_anglo_dutch_war',_,_,Start), end('first_anglo_dutch_war',_,_,End), Start=<End.

next_first_anglo_dutch_war(Start,End) :- first_anglo_dutch_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_first_anglo_dutch_war_at_1674(Res) :- setof((Start,End),next_first_anglo_dutch_war(Start,End),AllINtervals), checkvalidity(1674,AllINtervals,Res).

check_query() :- write('Query = next_first_anglo_dutch_war_at_1674'), (next_first_anglo_dutch_war_at_1674(true) -> write('\nRes   = true');write('\nRes   = false')).

