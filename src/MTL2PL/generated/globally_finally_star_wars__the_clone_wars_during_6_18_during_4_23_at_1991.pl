:- include('database.pl').
star_wars__the_clone_wars(Start,End) :- begin('star_wars__the_clone_wars',_,_,Start), end('star_wars__the_clone_wars',_,_,End), Start=<End.

finally_star_wars__the_clone_wars_during_6_18(Start,End) :- star_wars__the_clone_wars(Start1,End1), (Start1-18)=<(End1-6), Start is (Start1-18), End is (End1-6), Start=<End.

globally_finally_star_wars__the_clone_wars_during_6_18_during_4_23(Start,End) :- finally_star_wars__the_clone_wars_during_6_18(Start1,End1), Start is (Start1-4), End is (End1-23), Start=<End.

globally_finally_star_wars__the_clone_wars_during_6_18_during_4_23_at_1991(Res) :- setof((Start,End),globally_finally_star_wars__the_clone_wars_during_6_18_during_4_23(Start,End),AllINtervals), checkvalidity(1991,AllINtervals,Res).

check_query() :- write('Query = globally_finally_star_wars__the_clone_wars_during_6_18_during_4_23_at_1991'), (globally_finally_star_wars__the_clone_wars_during_6_18_during_4_23_at_1991(true) -> write('\nRes   = true');write('\nRes   = false')).

