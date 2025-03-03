:- include('database.pl').
star_wars__the_clone_wars(Start,End) :- begin('star_wars__the_clone_wars',_,_,Start), end('star_wars__the_clone_wars',_,_,End), Start=<End.

the_flash(Start,End) :- begin('the_flash',_,_,Start), end('the_flash',_,_,End), Start=<End.

star_wars__the_clone_wars_last_till_4_8(Start,End) :- star_wars__the_clone_wars(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

star_wars__the_clone_wars_until_the_flash_during_4_8_overlap(Start,End) :- star_wars__the_clone_wars_last_till_4_8(Start1,End1), the_flash(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

star_wars__the_clone_wars_until_the_flash_during_4_8(Start,End) :- star_wars__the_clone_wars(W1,_), star_wars__the_clone_wars_until_the_flash_during_4_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-4), Start=<End.

star_wars__the_clone_wars_until_the_flash_during_4_8_at_1903(Res) :- setof((Start,End),star_wars__the_clone_wars_until_the_flash_during_4_8(Start,End),AllINtervals), checkvalidity(1903,AllINtervals,Res).

check_query() :- write('Query = star_wars__the_clone_wars_until_the_flash_during_4_8_at_1903'), (star_wars__the_clone_wars_until_the_flash_during_4_8_at_1903(true) -> write('\nRes   = true');write('\nRes   = false')).

