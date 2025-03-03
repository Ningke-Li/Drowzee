:- include('database.pl').
my_little_pony__friendship_is_magic(Start,End) :- begin('my_little_pony__friendship_is_magic',_,_,Start), end('my_little_pony__friendship_is_magic',_,_,End), Start=<End.

gotham(Start,End) :- begin('gotham',_,_,Start), end('gotham',_,_,End), Start=<End.

generate_facts_my_little_pony__friendship_is_magic_AND_gotham([]) :- assert(my_little_pony__friendship_is_magic_AND_gotham(-1,-1)).

generate_facts_my_little_pony__friendship_is_magic_AND_gotham([(Start,End) | Tail]) :- assert(my_little_pony__friendship_is_magic_AND_gotham(Start,End)), generate_facts_my_little_pony__friendship_is_magic_AND_gotham(Tail).

my_little_pony__friendship_is_magic_AND_gotham_aux() :- findall((Start,End),my_little_pony__friendship_is_magic(Start,End),Interval1), findall((Start,End),gotham(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_my_little_pony__friendship_is_magic_AND_gotham(Interval).

my_little_pony__friendship_is_magic_AND_gotham_at_2017(Res) :- setof((Start,End),my_little_pony__friendship_is_magic_AND_gotham(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = my_little_pony__friendship_is_magic_AND_gotham_at_2017'), (my_little_pony__friendship_is_magic_AND_gotham_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- my_little_pony__friendship_is_magic_AND_gotham_aux().

