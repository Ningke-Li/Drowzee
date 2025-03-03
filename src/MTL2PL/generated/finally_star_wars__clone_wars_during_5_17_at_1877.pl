:- include('database.pl').
star_wars__clone_wars(Start,End) :- begin('star_wars__clone_wars',_,_,Start), end('star_wars__clone_wars',_,_,End), Start=<End.

finally_star_wars__clone_wars_during_5_17(Start,End) :- star_wars__clone_wars(Start1,End1), (Start1-17)=<(End1-5), Start is (Start1-17), End is (End1-5), Start=<End.

finally_star_wars__clone_wars_during_5_17_at_1877(Res) :- setof((Start,End),finally_star_wars__clone_wars_during_5_17(Start,End),AllINtervals), checkvalidity(1877,AllINtervals,Res).

check_query() :- write('Query = finally_star_wars__clone_wars_during_5_17_at_1877'), (finally_star_wars__clone_wars_during_5_17_at_1877(true) -> write('\nRes   = true');write('\nRes   = false')).

