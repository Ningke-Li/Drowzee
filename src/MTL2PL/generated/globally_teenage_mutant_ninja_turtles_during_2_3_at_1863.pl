:- include('database.pl').
teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

globally_teenage_mutant_ninja_turtles_during_2_3(Start,End) :- teenage_mutant_ninja_turtles(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

globally_teenage_mutant_ninja_turtles_during_2_3_at_1863(Res) :- setof((Start,End),globally_teenage_mutant_ninja_turtles_during_2_3(Start,End),AllINtervals), checkvalidity(1863,AllINtervals,Res).

check_query() :- write('Query = globally_teenage_mutant_ninja_turtles_during_2_3_at_1863'), (globally_teenage_mutant_ninja_turtles_during_2_3_at_1863(true) -> write('\nRes   = true');write('\nRes   = false')).

