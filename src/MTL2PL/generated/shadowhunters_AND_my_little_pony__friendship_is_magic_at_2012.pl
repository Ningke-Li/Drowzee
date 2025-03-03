:- include('database.pl').
shadowhunters(Start,End) :- begin('shadowhunters',_,_,Start), end('shadowhunters',_,_,End), Start=<End.

my_little_pony__friendship_is_magic(Start,End) :- begin('my_little_pony__friendship_is_magic',_,_,Start), end('my_little_pony__friendship_is_magic',_,_,End), Start=<End.

generate_facts_shadowhunters_AND_my_little_pony__friendship_is_magic([]) :- assert(shadowhunters_AND_my_little_pony__friendship_is_magic(-1,-1)).

generate_facts_shadowhunters_AND_my_little_pony__friendship_is_magic([(Start,End) | Tail]) :- assert(shadowhunters_AND_my_little_pony__friendship_is_magic(Start,End)), generate_facts_shadowhunters_AND_my_little_pony__friendship_is_magic(Tail).

shadowhunters_AND_my_little_pony__friendship_is_magic_aux() :- findall((Start,End),shadowhunters(Start,End),Interval1), findall((Start,End),my_little_pony__friendship_is_magic(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_shadowhunters_AND_my_little_pony__friendship_is_magic(Interval).

shadowhunters_AND_my_little_pony__friendship_is_magic_at_2012(Res) :- setof((Start,End),shadowhunters_AND_my_little_pony__friendship_is_magic(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = shadowhunters_AND_my_little_pony__friendship_is_magic_at_2012'), (shadowhunters_AND_my_little_pony__friendship_is_magic_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- shadowhunters_AND_my_little_pony__friendship_is_magic_aux().

