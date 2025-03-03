:- include('database.pl').
world_chess_championship_2014(Start,End) :- begin('world_chess_championship_2014',_,_,Start), end('world_chess_championship_2014',_,_,End), Start=<End.

may_2015(Start,End) :- begin('may_2015',_,_,Start), end('may_2015',_,_,End), Start=<End.

generate_facts_world_chess_championship_2014_OR_may_2015([]) :- assert(world_chess_championship_2014_OR_may_2015(-1,-1)).

generate_facts_world_chess_championship_2014_OR_may_2015([(Start,End) | Tail]) :- assert(world_chess_championship_2014_OR_may_2015(Start,End)), generate_facts_world_chess_championship_2014_OR_may_2015(Tail).

world_chess_championship_2014_OR_may_2015_aux() :- findall((Start,End),world_chess_championship_2014(Start,End),Interval1), findall((Start,End),may_2015(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_world_chess_championship_2014_OR_may_2015(Interval).

world_chess_championship_2014_OR_may_2015_at_2008(Res) :- setof((Start,End),world_chess_championship_2014_OR_may_2015(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = world_chess_championship_2014_OR_may_2015_at_2008'), (world_chess_championship_2014_OR_may_2015_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- world_chess_championship_2014_OR_may_2015_aux().

