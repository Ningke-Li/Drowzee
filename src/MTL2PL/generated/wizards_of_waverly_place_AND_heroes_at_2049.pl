:- include('database.pl').
wizards_of_waverly_place(Start,End) :- begin('wizards_of_waverly_place',_,_,Start), end('wizards_of_waverly_place',_,_,End), Start=<End.

heroes(Start,End) :- begin('heroes',_,_,Start), end('heroes',_,_,End), Start=<End.

generate_facts_wizards_of_waverly_place_AND_heroes([]) :- assert(wizards_of_waverly_place_AND_heroes(-1,-1)).

generate_facts_wizards_of_waverly_place_AND_heroes([(Start,End) | Tail]) :- assert(wizards_of_waverly_place_AND_heroes(Start,End)), generate_facts_wizards_of_waverly_place_AND_heroes(Tail).

wizards_of_waverly_place_AND_heroes_aux() :- findall((Start,End),wizards_of_waverly_place(Start,End),Interval1), findall((Start,End),heroes(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_wizards_of_waverly_place_AND_heroes(Interval).

wizards_of_waverly_place_AND_heroes_at_2049(Res) :- setof((Start,End),wizards_of_waverly_place_AND_heroes(Start,End),AllINtervals), checkvalidity(2049,AllINtervals,Res).

check_query() :- write('Query = wizards_of_waverly_place_AND_heroes_at_2049'), (wizards_of_waverly_place_AND_heroes_at_2049(true) -> write('\nRes   = true');write('\nRes   = false')).
?- wizards_of_waverly_place_AND_heroes_aux().

