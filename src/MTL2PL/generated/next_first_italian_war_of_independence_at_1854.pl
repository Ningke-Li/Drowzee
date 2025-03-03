:- include('database.pl').
first_italian_war_of_independence(Start,End) :- begin('first_italian_war_of_independence',_,_,Start), end('first_italian_war_of_independence',_,_,End), Start=<End.

next_first_italian_war_of_independence(Start,End) :- first_italian_war_of_independence(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_first_italian_war_of_independence_at_1854(Res) :- setof((Start,End),next_first_italian_war_of_independence(Start,End),AllINtervals), checkvalidity(1854,AllINtervals,Res).

check_query() :- write('Query = next_first_italian_war_of_independence_at_1854'), (next_first_italian_war_of_independence_at_1854(true) -> write('\nRes   = true');write('\nRes   = false')).

