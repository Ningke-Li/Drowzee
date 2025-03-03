:- include('database.pl').
my_name_is_earl(Start,End) :- begin('my_name_is_earl',_,_,Start), end('my_name_is_earl',_,_,End), Start=<End.

next_my_name_is_earl(Start,End) :- my_name_is_earl(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_my_name_is_earl_at_2053(Res) :- setof((Start,End),next_my_name_is_earl(Start,End),AllINtervals), checkvalidity(2053,AllINtervals,Res).

check_query() :- write('Query = next_my_name_is_earl_at_2053'), (next_my_name_is_earl_at_2053(true) -> write('\nRes   = true');write('\nRes   = false')).

