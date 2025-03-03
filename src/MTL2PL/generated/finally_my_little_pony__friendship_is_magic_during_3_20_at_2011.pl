:- include('database.pl').
my_little_pony__friendship_is_magic(Start,End) :- begin('my_little_pony__friendship_is_magic',_,_,Start), end('my_little_pony__friendship_is_magic',_,_,End), Start=<End.

finally_my_little_pony__friendship_is_magic_during_3_20(Start,End) :- my_little_pony__friendship_is_magic(Start1,End1), (Start1-20)=<(End1-3), Start is (Start1-20), End is (End1-3), Start=<End.

finally_my_little_pony__friendship_is_magic_during_3_20_at_2011(Res) :- setof((Start,End),finally_my_little_pony__friendship_is_magic_during_3_20(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = finally_my_little_pony__friendship_is_magic_during_3_20_at_2011'), (finally_my_little_pony__friendship_is_magic_during_3_20_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

