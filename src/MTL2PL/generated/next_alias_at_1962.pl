:- include('database.pl').
alias(Start,End) :- begin('alias',_,_,Start), end('alias',_,_,End), Start=<End.

next_alias(Start,End) :- alias(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_alias_at_1962(Res) :- setof((Start,End),next_alias(Start,End),AllINtervals), checkvalidity(1962,AllINtervals,Res).

check_query() :- write('Query = next_alias_at_1962'), (next_alias_at_1962(true) -> write('\nRes   = true');write('\nRes   = false')).

