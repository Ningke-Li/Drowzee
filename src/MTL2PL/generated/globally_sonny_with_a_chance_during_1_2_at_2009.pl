:- include('database.pl').
sonny_with_a_chance(Start,End) :- begin('sonny_with_a_chance',_,_,Start), end('sonny_with_a_chance',_,_,End), Start=<End.

globally_sonny_with_a_chance_during_1_2(Start,End) :- sonny_with_a_chance(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_sonny_with_a_chance_during_1_2_at_2009(Res) :- setof((Start,End),globally_sonny_with_a_chance_during_1_2(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = globally_sonny_with_a_chance_during_1_2_at_2009'), (globally_sonny_with_a_chance_during_1_2_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

