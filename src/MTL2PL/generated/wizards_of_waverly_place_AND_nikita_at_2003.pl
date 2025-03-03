:- include('database.pl').
wizards_of_waverly_place(Start,End) :- begin('wizards_of_waverly_place',_,_,Start), end('wizards_of_waverly_place',_,_,End), Start=<End.

nikita(Start,End) :- begin('nikita',_,_,Start), end('nikita',_,_,End), Start=<End.

generate_facts_wizards_of_waverly_place_AND_nikita([]) :- assert(wizards_of_waverly_place_AND_nikita(-1,-1)).

generate_facts_wizards_of_waverly_place_AND_nikita([(Start,End) | Tail]) :- assert(wizards_of_waverly_place_AND_nikita(Start,End)), generate_facts_wizards_of_waverly_place_AND_nikita(Tail).

wizards_of_waverly_place_AND_nikita_aux() :- findall((Start,End),wizards_of_waverly_place(Start,End),Interval1), findall((Start,End),nikita(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_wizards_of_waverly_place_AND_nikita(Interval).

wizards_of_waverly_place_AND_nikita_at_2003(Res) :- setof((Start,End),wizards_of_waverly_place_AND_nikita(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = wizards_of_waverly_place_AND_nikita_at_2003'), (wizards_of_waverly_place_AND_nikita_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).
?- wizards_of_waverly_place_AND_nikita_aux().

