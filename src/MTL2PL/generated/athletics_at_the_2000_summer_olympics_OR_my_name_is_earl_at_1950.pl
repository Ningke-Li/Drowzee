:- include('database.pl').
athletics_at_the_2000_summer_olympics(Start,End) :- begin('athletics_at_the_2000_summer_olympics',_,_,Start), end('athletics_at_the_2000_summer_olympics',_,_,End), Start=<End.

my_name_is_earl(Start,End) :- begin('my_name_is_earl',_,_,Start), end('my_name_is_earl',_,_,End), Start=<End.

generate_facts_athletics_at_the_2000_summer_olympics_OR_my_name_is_earl([]) :- assert(athletics_at_the_2000_summer_olympics_OR_my_name_is_earl(-1,-1)).

generate_facts_athletics_at_the_2000_summer_olympics_OR_my_name_is_earl([(Start,End) | Tail]) :- assert(athletics_at_the_2000_summer_olympics_OR_my_name_is_earl(Start,End)), generate_facts_athletics_at_the_2000_summer_olympics_OR_my_name_is_earl(Tail).

athletics_at_the_2000_summer_olympics_OR_my_name_is_earl_aux() :- findall((Start,End),athletics_at_the_2000_summer_olympics(Start,End),Interval1), findall((Start,End),my_name_is_earl(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_athletics_at_the_2000_summer_olympics_OR_my_name_is_earl(Interval).

athletics_at_the_2000_summer_olympics_OR_my_name_is_earl_at_1950(Res) :- setof((Start,End),athletics_at_the_2000_summer_olympics_OR_my_name_is_earl(Start,End),AllINtervals), checkvalidity(1950,AllINtervals,Res).

check_query() :- write('Query = athletics_at_the_2000_summer_olympics_OR_my_name_is_earl_at_1950'), (athletics_at_the_2000_summer_olympics_OR_my_name_is_earl_at_1950(true) -> write('\nRes   = true');write('\nRes   = false')).
?- athletics_at_the_2000_summer_olympics_OR_my_name_is_earl_aux().

