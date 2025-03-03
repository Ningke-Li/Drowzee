:- include('database.pl').
star_wars__the_clone_wars(Start,End) :- begin('star_wars__the_clone_wars',_,_,Start), end('star_wars__the_clone_wars',_,_,End), Start=<End.

under_the_dome(Start,End) :- begin('under_the_dome',_,_,Start), end('under_the_dome',_,_,End), Start=<End.

star_wars__the_clone_wars_last_till_2_11(Start,End) :- star_wars__the_clone_wars(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

star_wars__the_clone_wars_until_under_the_dome_during_2_11_overlap(Start,End) :- star_wars__the_clone_wars_last_till_2_11(Start1,End1), under_the_dome(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

star_wars__the_clone_wars_until_under_the_dome_during_2_11(Start,End) :- star_wars__the_clone_wars(W1,_), star_wars__the_clone_wars_until_under_the_dome_during_2_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-2), Start=<End.

star_wars__the_clone_wars_until_under_the_dome_during_2_11_at_2034(Res) :- setof((Start,End),star_wars__the_clone_wars_until_under_the_dome_during_2_11(Start,End),AllINtervals), checkvalidity(2034,AllINtervals,Res).

check_query() :- write('Query = star_wars__the_clone_wars_until_under_the_dome_during_2_11_at_2034'), (star_wars__the_clone_wars_until_under_the_dome_during_2_11_at_2034(true) -> write('\nRes   = true');write('\nRes   = false')).

