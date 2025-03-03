:- include('database.pl').
november_2016(Start,End) :- begin('november_2016',_,_,Start), end('november_2016',_,_,End), Start=<End.

game_of_thrones__season_1(Start,End) :- begin('game_of_thrones__season_1',_,_,Start), end('game_of_thrones__season_1',_,_,End), Start=<End.

generate_facts_november_2016_OR_game_of_thrones__season_1([]) :- assert(november_2016_OR_game_of_thrones__season_1(-1,-1)).

generate_facts_november_2016_OR_game_of_thrones__season_1([(Start,End) | Tail]) :- assert(november_2016_OR_game_of_thrones__season_1(Start,End)), generate_facts_november_2016_OR_game_of_thrones__season_1(Tail).

november_2016_OR_game_of_thrones__season_1_aux() :- findall((Start,End),november_2016(Start,End),Interval1), findall((Start,End),game_of_thrones__season_1(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_november_2016_OR_game_of_thrones__season_1(Interval).

november_2016_OR_game_of_thrones__season_1_at_1998(Res) :- setof((Start,End),november_2016_OR_game_of_thrones__season_1(Start,End),AllINtervals), checkvalidity(1998,AllINtervals,Res).

check_query() :- write('Query = november_2016_OR_game_of_thrones__season_1_at_1998'), (november_2016_OR_game_of_thrones__season_1_at_1998(true) -> write('\nRes   = true');write('\nRes   = false')).
?- november_2016_OR_game_of_thrones__season_1_aux().

