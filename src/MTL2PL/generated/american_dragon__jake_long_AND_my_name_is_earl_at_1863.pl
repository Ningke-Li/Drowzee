:- include('database.pl').
american_dragon__jake_long(Start,End) :- begin('american_dragon__jake_long',_,_,Start), end('american_dragon__jake_long',_,_,End), Start=<End.

my_name_is_earl(Start,End) :- begin('my_name_is_earl',_,_,Start), end('my_name_is_earl',_,_,End), Start=<End.

generate_facts_american_dragon__jake_long_AND_my_name_is_earl([]) :- assert(american_dragon__jake_long_AND_my_name_is_earl(-1,-1)).

generate_facts_american_dragon__jake_long_AND_my_name_is_earl([(Start,End) | Tail]) :- assert(american_dragon__jake_long_AND_my_name_is_earl(Start,End)), generate_facts_american_dragon__jake_long_AND_my_name_is_earl(Tail).

american_dragon__jake_long_AND_my_name_is_earl_aux() :- findall((Start,End),american_dragon__jake_long(Start,End),Interval1), findall((Start,End),my_name_is_earl(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_american_dragon__jake_long_AND_my_name_is_earl(Interval).

american_dragon__jake_long_AND_my_name_is_earl_at_1863(Res) :- setof((Start,End),american_dragon__jake_long_AND_my_name_is_earl(Start,End),AllINtervals), checkvalidity(1863,AllINtervals,Res).

check_query() :- write('Query = american_dragon__jake_long_AND_my_name_is_earl_at_1863'), (american_dragon__jake_long_AND_my_name_is_earl_at_1863(true) -> write('\nRes   = true');write('\nRes   = false')).
?- american_dragon__jake_long_AND_my_name_is_earl_aux().

