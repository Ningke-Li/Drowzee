:- include('database.pl').
chowder(Start,End) :- begin('chowder',_,_,Start), end('chowder',_,_,End), Start=<End.

wizards_of_waverly_place(Start,End) :- begin('wizards_of_waverly_place',_,_,Start), end('wizards_of_waverly_place',_,_,End), Start=<End.

generate_facts_chowder_AND_wizards_of_waverly_place([]) :- assert(chowder_AND_wizards_of_waverly_place(-1,-1)).

generate_facts_chowder_AND_wizards_of_waverly_place([(Start,End) | Tail]) :- assert(chowder_AND_wizards_of_waverly_place(Start,End)), generate_facts_chowder_AND_wizards_of_waverly_place(Tail).

chowder_AND_wizards_of_waverly_place_aux() :- findall((Start,End),chowder(Start,End),Interval1), findall((Start,End),wizards_of_waverly_place(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_chowder_AND_wizards_of_waverly_place(Interval).

chowder_AND_wizards_of_waverly_place_at_2010(Res) :- setof((Start,End),chowder_AND_wizards_of_waverly_place(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = chowder_AND_wizards_of_waverly_place_at_2010'), (chowder_AND_wizards_of_waverly_place_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- chowder_AND_wizards_of_waverly_place_aux().

