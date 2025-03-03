:- include('database.pl').
magnificent_century(Start,End) :- begin('magnificent_century',_,_,Start), end('magnificent_century',_,_,End), Start=<End.

game_of_thrones(Start,End) :- begin('game_of_thrones',_,_,Start), end('game_of_thrones',_,_,End), Start=<End.

generate_facts_magnificent_century_AND_game_of_thrones([]) :- assert(magnificent_century_AND_game_of_thrones(-1,-1)).

generate_facts_magnificent_century_AND_game_of_thrones([(Start,End) | Tail]) :- assert(magnificent_century_AND_game_of_thrones(Start,End)), generate_facts_magnificent_century_AND_game_of_thrones(Tail).

magnificent_century_AND_game_of_thrones_aux() :- findall((Start,End),magnificent_century(Start,End),Interval1), findall((Start,End),game_of_thrones(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_magnificent_century_AND_game_of_thrones(Interval).

magnificent_century_AND_game_of_thrones_at_2011(Res) :- setof((Start,End),magnificent_century_AND_game_of_thrones(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = magnificent_century_AND_game_of_thrones_at_2011'), (magnificent_century_AND_game_of_thrones_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- magnificent_century_AND_game_of_thrones_aux().

