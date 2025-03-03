:- include('database.pl').
my_little_pony__friendship_is_magic(Start,End) :- begin('my_little_pony__friendship_is_magic',_,_,Start), end('my_little_pony__friendship_is_magic',_,_,End), Start=<End.

bojack_horseman(Start,End) :- begin('bojack_horseman',_,_,Start), end('bojack_horseman',_,_,End), Start=<End.

my_little_pony__friendship_is_magic_last_till_2_12(Start,End) :- my_little_pony__friendship_is_magic(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

my_little_pony__friendship_is_magic_until_bojack_horseman_during_2_12_overlap(Start,End) :- my_little_pony__friendship_is_magic_last_till_2_12(Start1,End1), bojack_horseman(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

my_little_pony__friendship_is_magic_until_bojack_horseman_during_2_12(Start,End) :- my_little_pony__friendship_is_magic(W1,_), my_little_pony__friendship_is_magic_until_bojack_horseman_during_2_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-2), Start=<End.

my_little_pony__friendship_is_magic_until_bojack_horseman_during_2_12_at_2014(Res) :- setof((Start,End),my_little_pony__friendship_is_magic_until_bojack_horseman_during_2_12(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = my_little_pony__friendship_is_magic_until_bojack_horseman_during_2_12_at_2014'), (my_little_pony__friendship_is_magic_until_bojack_horseman_during_2_12_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).

