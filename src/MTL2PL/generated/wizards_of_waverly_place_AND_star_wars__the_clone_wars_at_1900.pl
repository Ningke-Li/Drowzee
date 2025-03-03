:- include('database.pl').
wizards_of_waverly_place(Start,End) :- begin('wizards_of_waverly_place',_,_,Start), end('wizards_of_waverly_place',_,_,End), Start=<End.

star_wars__the_clone_wars(Start,End) :- begin('star_wars__the_clone_wars',_,_,Start), end('star_wars__the_clone_wars',_,_,End), Start=<End.

generate_facts_wizards_of_waverly_place_AND_star_wars__the_clone_wars([]) :- assert(wizards_of_waverly_place_AND_star_wars__the_clone_wars(-1,-1)).

generate_facts_wizards_of_waverly_place_AND_star_wars__the_clone_wars([(Start,End) | Tail]) :- assert(wizards_of_waverly_place_AND_star_wars__the_clone_wars(Start,End)), generate_facts_wizards_of_waverly_place_AND_star_wars__the_clone_wars(Tail).

wizards_of_waverly_place_AND_star_wars__the_clone_wars_aux() :- findall((Start,End),wizards_of_waverly_place(Start,End),Interval1), findall((Start,End),star_wars__the_clone_wars(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_wizards_of_waverly_place_AND_star_wars__the_clone_wars(Interval).

wizards_of_waverly_place_AND_star_wars__the_clone_wars_at_1900(Res) :- setof((Start,End),wizards_of_waverly_place_AND_star_wars__the_clone_wars(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = wizards_of_waverly_place_AND_star_wars__the_clone_wars_at_1900'), (wizards_of_waverly_place_AND_star_wars__the_clone_wars_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).
?- wizards_of_waverly_place_AND_star_wars__the_clone_wars_aux().

