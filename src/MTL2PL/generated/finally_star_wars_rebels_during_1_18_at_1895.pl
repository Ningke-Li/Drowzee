:- include('database.pl').
star_wars_rebels(Start,End) :- begin('star_wars_rebels',_,_,Start), end('star_wars_rebels',_,_,End), Start=<End.

finally_star_wars_rebels_during_1_18(Start,End) :- star_wars_rebels(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

finally_star_wars_rebels_during_1_18_at_1895(Res) :- setof((Start,End),finally_star_wars_rebels_during_1_18(Start,End),AllINtervals), checkvalidity(1895,AllINtervals,Res).

check_query() :- write('Query = finally_star_wars_rebels_during_1_18_at_1895'), (finally_star_wars_rebels_during_1_18_at_1895(true) -> write('\nRes   = true');write('\nRes   = false')).

