:- include('database.pl').
over_the_garden_wall(Start,End) :- begin('over_the_garden_wall',_,_,Start), end('over_the_garden_wall',_,_,End), Start=<End.

globally_over_the_garden_wall_during_3_4(Start,End) :- over_the_garden_wall(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

globally_over_the_garden_wall_during_3_4_at_2035(Res) :- setof((Start,End),globally_over_the_garden_wall_during_3_4(Start,End),AllINtervals), checkvalidity(2035,AllINtervals,Res).

check_query() :- write('Query = globally_over_the_garden_wall_during_3_4_at_2035'), (globally_over_the_garden_wall_during_3_4_at_2035(true) -> write('\nRes   = true');write('\nRes   = false')).

