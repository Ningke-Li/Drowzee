:- include('database.pl').
game_of_thrones(Start,End) :- begin('game_of_thrones',_,_,Start), end('game_of_thrones',_,_,End), Start=<End.

csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

generate_facts_game_of_thrones_OR_csi__miami([]) :- assert(game_of_thrones_OR_csi__miami(-1,-1)).

generate_facts_game_of_thrones_OR_csi__miami([(Start,End) | Tail]) :- assert(game_of_thrones_OR_csi__miami(Start,End)), generate_facts_game_of_thrones_OR_csi__miami(Tail).

game_of_thrones_OR_csi__miami_aux() :- findall((Start,End),game_of_thrones(Start,End),Interval1), findall((Start,End),csi__miami(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_game_of_thrones_OR_csi__miami(Interval).

game_of_thrones_OR_csi__miami_at_2013(Res) :- setof((Start,End),game_of_thrones_OR_csi__miami(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = game_of_thrones_OR_csi__miami_at_2013'), (game_of_thrones_OR_csi__miami_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- game_of_thrones_OR_csi__miami_aux().

