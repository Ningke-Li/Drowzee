:- include('database.pl').
my_little_pony__friendship_is_magic(Start,End) :- begin('my_little_pony__friendship_is_magic',_,_,Start), end('my_little_pony__friendship_is_magic',_,_,End), Start=<End.

finally_my_little_pony__friendship_is_magic_during_7_19(Start,End) :- my_little_pony__friendship_is_magic(Start1,End1), (Start1-19)=<(End1-7), Start is (Start1-19), End is (End1-7), Start=<End.

globally_finally_my_little_pony__friendship_is_magic_during_7_19_during_11_17(Start,End) :- finally_my_little_pony__friendship_is_magic_during_7_19(Start1,End1), Start is (Start1-11), End is (End1-17), Start=<End.

globally_finally_my_little_pony__friendship_is_magic_during_7_19_during_11_17_at_1931(Res) :- setof((Start,End),globally_finally_my_little_pony__friendship_is_magic_during_7_19_during_11_17(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = globally_finally_my_little_pony__friendship_is_magic_during_7_19_during_11_17_at_1931'), (globally_finally_my_little_pony__friendship_is_magic_during_7_19_during_11_17_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).

