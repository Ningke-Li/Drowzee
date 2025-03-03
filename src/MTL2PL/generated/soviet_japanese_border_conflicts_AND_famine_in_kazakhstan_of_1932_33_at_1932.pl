:- include('database.pl').
soviet_japanese_border_conflicts(Start,End) :- begin('soviet_japanese_border_conflicts',_,_,Start), end('soviet_japanese_border_conflicts',_,_,End), Start=<End.

famine_in_kazakhstan_of_1932_33(Start,End) :- begin('famine_in_kazakhstan_of_1932_33',_,_,Start), end('famine_in_kazakhstan_of_1932_33',_,_,End), Start=<End.

generate_facts_soviet_japanese_border_conflicts_AND_famine_in_kazakhstan_of_1932_33([]) :- assert(soviet_japanese_border_conflicts_AND_famine_in_kazakhstan_of_1932_33(-1,-1)).

generate_facts_soviet_japanese_border_conflicts_AND_famine_in_kazakhstan_of_1932_33([(Start,End) | Tail]) :- assert(soviet_japanese_border_conflicts_AND_famine_in_kazakhstan_of_1932_33(Start,End)), generate_facts_soviet_japanese_border_conflicts_AND_famine_in_kazakhstan_of_1932_33(Tail).

soviet_japanese_border_conflicts_AND_famine_in_kazakhstan_of_1932_33_aux() :- findall((Start,End),soviet_japanese_border_conflicts(Start,End),Interval1), findall((Start,End),famine_in_kazakhstan_of_1932_33(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_soviet_japanese_border_conflicts_AND_famine_in_kazakhstan_of_1932_33(Interval).

soviet_japanese_border_conflicts_AND_famine_in_kazakhstan_of_1932_33_at_1932(Res) :- setof((Start,End),soviet_japanese_border_conflicts_AND_famine_in_kazakhstan_of_1932_33(Start,End),AllINtervals), checkvalidity(1932,AllINtervals,Res).

check_query() :- write('Query = soviet_japanese_border_conflicts_AND_famine_in_kazakhstan_of_1932_33_at_1932'), (soviet_japanese_border_conflicts_AND_famine_in_kazakhstan_of_1932_33_at_1932(true) -> write('\nRes   = true');write('\nRes   = false')).
?- soviet_japanese_border_conflicts_AND_famine_in_kazakhstan_of_1932_33_aux().

