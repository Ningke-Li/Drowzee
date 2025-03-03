:- include('database.pl').
better_call_saul(Start,End) :- begin('better_call_saul',_,_,Start), end('better_call_saul',_,_,End), Start=<End.

next_better_call_saul(Start,End) :- better_call_saul(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_better_call_saul_at_2015(Res) :- setof((Start,End),next_better_call_saul(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = next_better_call_saul_at_2015'), (next_better_call_saul_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

