:- include('database.pl').
new_economic_policy(Start,End) :- begin('new_economic_policy',_,_,Start), end('new_economic_policy',_,_,End), Start=<End.

next_new_economic_policy(Start,End) :- new_economic_policy(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_new_economic_policy_at_1879(Res) :- setof((Start,End),next_new_economic_policy(Start,End),AllINtervals), checkvalidity(1879,AllINtervals,Res).

check_query() :- write('Query = next_new_economic_policy_at_1879'), (next_new_economic_policy_at_1879(true) -> write('\nRes   = true');write('\nRes   = false')).

