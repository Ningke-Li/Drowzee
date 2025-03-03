:- include('database.pl').
star_wars_rebels(Start,End) :- begin('star_wars_rebels',_,_,Start), end('star_wars_rebels',_,_,End), Start=<End.

finally_star_wars_rebels_during_6_17(Start,End) :- star_wars_rebels(Start1,End1), (Start1-17)=<(End1-6), Start is (Start1-17), End is (End1-6), Start=<End.

finally_star_wars_rebels_during_6_17_at_1987(Res) :- setof((Start,End),finally_star_wars_rebels_during_6_17(Start,End),AllINtervals), checkvalidity(1987,AllINtervals,Res).

check_query() :- write('Query = finally_star_wars_rebels_during_6_17_at_1987'), (finally_star_wars_rebels_during_6_17_at_1987(true) -> write('\nRes   = true');write('\nRes   = false')).

