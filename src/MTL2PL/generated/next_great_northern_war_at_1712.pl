:- include('database.pl').
great_northern_war(Start,End) :- begin('great_northern_war',_,_,Start), end('great_northern_war',_,_,End), Start=<End.

next_great_northern_war(Start,End) :- great_northern_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_great_northern_war_at_1712(Res) :- setof((Start,End),next_great_northern_war(Start,End),AllINtervals), checkvalidity(1712,AllINtervals,Res).

check_query() :- write('Query = next_great_northern_war_at_1712'), (next_great_northern_war_at_1712(true) -> write('\nRes   = true');write('\nRes   = false')).

