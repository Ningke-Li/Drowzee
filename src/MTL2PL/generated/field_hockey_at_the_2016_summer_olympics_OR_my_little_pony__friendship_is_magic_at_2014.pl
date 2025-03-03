:- include('database.pl').
field_hockey_at_the_2016_summer_olympics(Start,End) :- begin('field_hockey_at_the_2016_summer_olympics',_,_,Start), end('field_hockey_at_the_2016_summer_olympics',_,_,End), Start=<End.

my_little_pony__friendship_is_magic(Start,End) :- begin('my_little_pony__friendship_is_magic',_,_,Start), end('my_little_pony__friendship_is_magic',_,_,End), Start=<End.

generate_facts_field_hockey_at_the_2016_summer_olympics_OR_my_little_pony__friendship_is_magic([]) :- assert(field_hockey_at_the_2016_summer_olympics_OR_my_little_pony__friendship_is_magic(-1,-1)).

generate_facts_field_hockey_at_the_2016_summer_olympics_OR_my_little_pony__friendship_is_magic([(Start,End) | Tail]) :- assert(field_hockey_at_the_2016_summer_olympics_OR_my_little_pony__friendship_is_magic(Start,End)), generate_facts_field_hockey_at_the_2016_summer_olympics_OR_my_little_pony__friendship_is_magic(Tail).

field_hockey_at_the_2016_summer_olympics_OR_my_little_pony__friendship_is_magic_aux() :- findall((Start,End),field_hockey_at_the_2016_summer_olympics(Start,End),Interval1), findall((Start,End),my_little_pony__friendship_is_magic(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_field_hockey_at_the_2016_summer_olympics_OR_my_little_pony__friendship_is_magic(Interval).

field_hockey_at_the_2016_summer_olympics_OR_my_little_pony__friendship_is_magic_at_2014(Res) :- setof((Start,End),field_hockey_at_the_2016_summer_olympics_OR_my_little_pony__friendship_is_magic(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = field_hockey_at_the_2016_summer_olympics_OR_my_little_pony__friendship_is_magic_at_2014'), (field_hockey_at_the_2016_summer_olympics_OR_my_little_pony__friendship_is_magic_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- field_hockey_at_the_2016_summer_olympics_OR_my_little_pony__friendship_is_magic_aux().

