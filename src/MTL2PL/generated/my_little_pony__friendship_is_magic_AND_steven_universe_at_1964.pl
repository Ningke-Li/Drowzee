:- include('database.pl').
my_little_pony__friendship_is_magic(Start,End) :- begin('my_little_pony__friendship_is_magic',_,_,Start), end('my_little_pony__friendship_is_magic',_,_,End), Start=<End.

steven_universe(Start,End) :- begin('steven_universe',_,_,Start), end('steven_universe',_,_,End), Start=<End.

generate_facts_my_little_pony__friendship_is_magic_AND_steven_universe([]) :- assert(my_little_pony__friendship_is_magic_AND_steven_universe(-1,-1)).

generate_facts_my_little_pony__friendship_is_magic_AND_steven_universe([(Start,End) | Tail]) :- assert(my_little_pony__friendship_is_magic_AND_steven_universe(Start,End)), generate_facts_my_little_pony__friendship_is_magic_AND_steven_universe(Tail).

my_little_pony__friendship_is_magic_AND_steven_universe_aux() :- findall((Start,End),my_little_pony__friendship_is_magic(Start,End),Interval1), findall((Start,End),steven_universe(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_my_little_pony__friendship_is_magic_AND_steven_universe(Interval).

my_little_pony__friendship_is_magic_AND_steven_universe_at_1964(Res) :- setof((Start,End),my_little_pony__friendship_is_magic_AND_steven_universe(Start,End),AllINtervals), checkvalidity(1964,AllINtervals,Res).

check_query() :- write('Query = my_little_pony__friendship_is_magic_AND_steven_universe_at_1964'), (my_little_pony__friendship_is_magic_AND_steven_universe_at_1964(true) -> write('\nRes   = true');write('\nRes   = false')).
?- my_little_pony__friendship_is_magic_AND_steven_universe_aux().

