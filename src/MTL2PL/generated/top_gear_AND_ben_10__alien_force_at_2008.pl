:- include('database.pl').
top_gear(Start,End) :- begin('top_gear',_,_,Start), end('top_gear',_,_,End), Start=<End.

ben_10__alien_force(Start,End) :- begin('ben_10__alien_force',_,_,Start), end('ben_10__alien_force',_,_,End), Start=<End.

generate_facts_top_gear_AND_ben_10__alien_force([]) :- assert(top_gear_AND_ben_10__alien_force(-1,-1)).

generate_facts_top_gear_AND_ben_10__alien_force([(Start,End) | Tail]) :- assert(top_gear_AND_ben_10__alien_force(Start,End)), generate_facts_top_gear_AND_ben_10__alien_force(Tail).

top_gear_AND_ben_10__alien_force_aux() :- findall((Start,End),top_gear(Start,End),Interval1), findall((Start,End),ben_10__alien_force(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_top_gear_AND_ben_10__alien_force(Interval).

top_gear_AND_ben_10__alien_force_at_2008(Res) :- setof((Start,End),top_gear_AND_ben_10__alien_force(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = top_gear_AND_ben_10__alien_force_at_2008'), (top_gear_AND_ben_10__alien_force_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- top_gear_AND_ben_10__alien_force_aux().

