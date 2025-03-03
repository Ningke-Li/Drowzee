:- include('database.pl').
boardwalk_empire(Start,End) :- begin('boardwalk_empire',_,_,Start), end('boardwalk_empire',_,_,End), Start=<End.

ev_1952_summer_olympics(Start,End) :- begin('ev_1952_summer_olympics',_,_,Start), end('ev_1952_summer_olympics',_,_,End), Start=<End.

generate_facts_boardwalk_empire_OR_ev_1952_summer_olympics([]) :- assert(boardwalk_empire_OR_ev_1952_summer_olympics(-1,-1)).

generate_facts_boardwalk_empire_OR_ev_1952_summer_olympics([(Start,End) | Tail]) :- assert(boardwalk_empire_OR_ev_1952_summer_olympics(Start,End)), generate_facts_boardwalk_empire_OR_ev_1952_summer_olympics(Tail).

boardwalk_empire_OR_ev_1952_summer_olympics_aux() :- findall((Start,End),boardwalk_empire(Start,End),Interval1), findall((Start,End),ev_1952_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_boardwalk_empire_OR_ev_1952_summer_olympics(Interval).

boardwalk_empire_OR_ev_1952_summer_olympics_at_1891(Res) :- setof((Start,End),boardwalk_empire_OR_ev_1952_summer_olympics(Start,End),AllINtervals), checkvalidity(1891,AllINtervals,Res).

check_query() :- write('Query = boardwalk_empire_OR_ev_1952_summer_olympics_at_1891'), (boardwalk_empire_OR_ev_1952_summer_olympics_at_1891(true) -> write('\nRes   = true');write('\nRes   = false')).
?- boardwalk_empire_OR_ev_1952_summer_olympics_aux().

