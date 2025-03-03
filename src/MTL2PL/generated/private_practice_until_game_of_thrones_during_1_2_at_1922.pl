:- include('database.pl').
private_practice(Start,End) :- begin('private_practice',_,_,Start), end('private_practice',_,_,End), Start=<End.

game_of_thrones(Start,End) :- begin('game_of_thrones',_,_,Start), end('game_of_thrones',_,_,End), Start=<End.

private_practice_last_till_1_2(Start,End) :- private_practice(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

private_practice_until_game_of_thrones_during_1_2_overlap(Start,End) :- private_practice_last_till_1_2(Start1,End1), game_of_thrones(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

private_practice_until_game_of_thrones_during_1_2(Start,End) :- private_practice(W1,_), private_practice_until_game_of_thrones_during_1_2_overlap(Start1,End1), Start is max((Start1-2),W1), End is (End1-1), Start=<End.

private_practice_until_game_of_thrones_during_1_2_at_1922(Res) :- setof((Start,End),private_practice_until_game_of_thrones_during_1_2(Start,End),AllINtervals), checkvalidity(1922,AllINtervals,Res).

check_query() :- write('Query = private_practice_until_game_of_thrones_during_1_2_at_1922'), (private_practice_until_game_of_thrones_during_1_2_at_1922(true) -> write('\nRes   = true');write('\nRes   = false')).

