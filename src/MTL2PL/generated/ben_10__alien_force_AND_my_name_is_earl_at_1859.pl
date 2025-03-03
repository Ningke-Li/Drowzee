:- include('database.pl').
ben_10__alien_force(Start,End) :- begin('ben_10__alien_force',_,_,Start), end('ben_10__alien_force',_,_,End), Start=<End.

my_name_is_earl(Start,End) :- begin('my_name_is_earl',_,_,Start), end('my_name_is_earl',_,_,End), Start=<End.

generate_facts_ben_10__alien_force_AND_my_name_is_earl([]) :- assert(ben_10__alien_force_AND_my_name_is_earl(-1,-1)).

generate_facts_ben_10__alien_force_AND_my_name_is_earl([(Start,End) | Tail]) :- assert(ben_10__alien_force_AND_my_name_is_earl(Start,End)), generate_facts_ben_10__alien_force_AND_my_name_is_earl(Tail).

ben_10__alien_force_AND_my_name_is_earl_aux() :- findall((Start,End),ben_10__alien_force(Start,End),Interval1), findall((Start,End),my_name_is_earl(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ben_10__alien_force_AND_my_name_is_earl(Interval).

ben_10__alien_force_AND_my_name_is_earl_at_1859(Res) :- setof((Start,End),ben_10__alien_force_AND_my_name_is_earl(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = ben_10__alien_force_AND_my_name_is_earl_at_1859'), (ben_10__alien_force_AND_my_name_is_earl_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ben_10__alien_force_AND_my_name_is_earl_aux().

