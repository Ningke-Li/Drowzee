:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

vostok_programme_last_till_34_39(Start,End) :- vostok_programme(Start1,End1), (End1-Start1)>=34, Start is (Start1+34), End is (End1+1).

vostok_programme_until_teenage_mutant_ninja_turtles_during_34_39_overlap(Start,End) :- vostok_programme_last_till_34_39(Start1,End1), teenage_mutant_ninja_turtles(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

vostok_programme_until_teenage_mutant_ninja_turtles_during_34_39(Start,End) :- vostok_programme(W1,_), vostok_programme_until_teenage_mutant_ninja_turtles_during_34_39_overlap(Start1,End1), Start is max((Start1-39),W1), End is (End1-34), Start=<End.

vostok_programme_until_teenage_mutant_ninja_turtles_during_34_39_at_1847(Res) :- setof((Start,End),vostok_programme_until_teenage_mutant_ninja_turtles_during_34_39(Start,End),AllINtervals), checkvalidity(1847,AllINtervals,Res).

check_query() :- write('Query = vostok_programme_until_teenage_mutant_ninja_turtles_during_34_39_at_1847'), (vostok_programme_until_teenage_mutant_ninja_turtles_during_34_39_at_1847(true) -> write('\nRes   = true');write('\nRes   = false')).

