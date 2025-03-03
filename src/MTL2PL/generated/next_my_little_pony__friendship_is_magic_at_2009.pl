:- include('database.pl').
my_little_pony__friendship_is_magic(Start,End) :- begin('my_little_pony__friendship_is_magic',_,_,Start), end('my_little_pony__friendship_is_magic',_,_,End), Start=<End.

next_my_little_pony__friendship_is_magic(Start,End) :- my_little_pony__friendship_is_magic(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_my_little_pony__friendship_is_magic_at_2009(Res) :- setof((Start,End),next_my_little_pony__friendship_is_magic(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = next_my_little_pony__friendship_is_magic_at_2009'), (next_my_little_pony__friendship_is_magic_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

