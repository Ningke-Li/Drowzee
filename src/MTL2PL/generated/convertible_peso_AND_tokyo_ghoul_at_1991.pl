:- include('database.pl').
convertible_peso(Start,End) :- begin('convertible_peso',_,_,Start), end('convertible_peso',_,_,End), Start=<End.

tokyo_ghoul(Start,End) :- begin('tokyo_ghoul',_,_,Start), end('tokyo_ghoul',_,_,End), Start=<End.

generate_facts_convertible_peso_AND_tokyo_ghoul([]) :- assert(convertible_peso_AND_tokyo_ghoul(-1,-1)).

generate_facts_convertible_peso_AND_tokyo_ghoul([(Start,End) | Tail]) :- assert(convertible_peso_AND_tokyo_ghoul(Start,End)), generate_facts_convertible_peso_AND_tokyo_ghoul(Tail).

convertible_peso_AND_tokyo_ghoul_aux() :- findall((Start,End),convertible_peso(Start,End),Interval1), findall((Start,End),tokyo_ghoul(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_convertible_peso_AND_tokyo_ghoul(Interval).

convertible_peso_AND_tokyo_ghoul_at_1991(Res) :- setof((Start,End),convertible_peso_AND_tokyo_ghoul(Start,End),AllINtervals), checkvalidity(1991,AllINtervals,Res).

check_query() :- write('Query = convertible_peso_AND_tokyo_ghoul_at_1991'), (convertible_peso_AND_tokyo_ghoul_at_1991(true) -> write('\nRes   = true');write('\nRes   = false')).
?- convertible_peso_AND_tokyo_ghoul_aux().

