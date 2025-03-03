:- include('database.pl').
teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

twitter(Start,End) :- begin('twitter',_,_,Start), end('twitter',_,_,End), Start=<End.

generate_facts_teenage_mutant_ninja_turtles_AND_twitter([]) :- assert(teenage_mutant_ninja_turtles_AND_twitter(-1,-1)).

generate_facts_teenage_mutant_ninja_turtles_AND_twitter([(Start,End) | Tail]) :- assert(teenage_mutant_ninja_turtles_AND_twitter(Start,End)), generate_facts_teenage_mutant_ninja_turtles_AND_twitter(Tail).

teenage_mutant_ninja_turtles_AND_twitter_aux() :- findall((Start,End),teenage_mutant_ninja_turtles(Start,End),Interval1), findall((Start,End),twitter(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_teenage_mutant_ninja_turtles_AND_twitter(Interval).

teenage_mutant_ninja_turtles_AND_twitter_at_1977(Res) :- setof((Start,End),teenage_mutant_ninja_turtles_AND_twitter(Start,End),AllINtervals), checkvalidity(1977,AllINtervals,Res).

check_query() :- write('Query = teenage_mutant_ninja_turtles_AND_twitter_at_1977'), (teenage_mutant_ninja_turtles_AND_twitter_at_1977(true) -> write('\nRes   = true');write('\nRes   = false')).
?- teenage_mutant_ninja_turtles_AND_twitter_aux().

