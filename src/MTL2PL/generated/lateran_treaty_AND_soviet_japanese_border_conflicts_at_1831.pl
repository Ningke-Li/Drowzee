:- include('database.pl').
lateran_treaty(Start,End) :- begin('lateran_treaty',_,_,Start), end('lateran_treaty',_,_,End), Start=<End.

soviet_japanese_border_conflicts(Start,End) :- begin('soviet_japanese_border_conflicts',_,_,Start), end('soviet_japanese_border_conflicts',_,_,End), Start=<End.

generate_facts_lateran_treaty_AND_soviet_japanese_border_conflicts([]) :- assert(lateran_treaty_AND_soviet_japanese_border_conflicts(-1,-1)).

generate_facts_lateran_treaty_AND_soviet_japanese_border_conflicts([(Start,End) | Tail]) :- assert(lateran_treaty_AND_soviet_japanese_border_conflicts(Start,End)), generate_facts_lateran_treaty_AND_soviet_japanese_border_conflicts(Tail).

lateran_treaty_AND_soviet_japanese_border_conflicts_aux() :- findall((Start,End),lateran_treaty(Start,End),Interval1), findall((Start,End),soviet_japanese_border_conflicts(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_lateran_treaty_AND_soviet_japanese_border_conflicts(Interval).

lateran_treaty_AND_soviet_japanese_border_conflicts_at_1831(Res) :- setof((Start,End),lateran_treaty_AND_soviet_japanese_border_conflicts(Start,End),AllINtervals), checkvalidity(1831,AllINtervals,Res).

check_query() :- write('Query = lateran_treaty_AND_soviet_japanese_border_conflicts_at_1831'), (lateran_treaty_AND_soviet_japanese_border_conflicts_at_1831(true) -> write('\nRes   = true');write('\nRes   = false')).
?- lateran_treaty_AND_soviet_japanese_border_conflicts_aux().

