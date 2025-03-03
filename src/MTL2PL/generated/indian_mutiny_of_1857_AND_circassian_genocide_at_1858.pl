:- include('database.pl').
indian_mutiny_of_1857(Start,End) :- begin('indian_mutiny_of_1857',_,_,Start), end('indian_mutiny_of_1857',_,_,End), Start=<End.

circassian_genocide(Start,End) :- begin('circassian_genocide',_,_,Start), end('circassian_genocide',_,_,End), Start=<End.

generate_facts_indian_mutiny_of_1857_AND_circassian_genocide([]) :- assert(indian_mutiny_of_1857_AND_circassian_genocide(-1,-1)).

generate_facts_indian_mutiny_of_1857_AND_circassian_genocide([(Start,End) | Tail]) :- assert(indian_mutiny_of_1857_AND_circassian_genocide(Start,End)), generate_facts_indian_mutiny_of_1857_AND_circassian_genocide(Tail).

indian_mutiny_of_1857_AND_circassian_genocide_aux() :- findall((Start,End),indian_mutiny_of_1857(Start,End),Interval1), findall((Start,End),circassian_genocide(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_indian_mutiny_of_1857_AND_circassian_genocide(Interval).

indian_mutiny_of_1857_AND_circassian_genocide_at_1858(Res) :- setof((Start,End),indian_mutiny_of_1857_AND_circassian_genocide(Start,End),AllINtervals), checkvalidity(1858,AllINtervals,Res).

check_query() :- write('Query = indian_mutiny_of_1857_AND_circassian_genocide_at_1858'), (indian_mutiny_of_1857_AND_circassian_genocide_at_1858(true) -> write('\nRes   = true');write('\nRes   = false')).
?- indian_mutiny_of_1857_AND_circassian_genocide_aux().

