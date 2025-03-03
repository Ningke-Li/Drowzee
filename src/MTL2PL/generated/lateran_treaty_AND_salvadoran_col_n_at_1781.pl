:- include('database.pl').
lateran_treaty(Start,End) :- begin('lateran_treaty',_,_,Start), end('lateran_treaty',_,_,End), Start=<End.

salvadoran_col_n(Start,End) :- begin('salvadoran_col_n',_,_,Start), end('salvadoran_col_n',_,_,End), Start=<End.

generate_facts_lateran_treaty_AND_salvadoran_col_n([]) :- assert(lateran_treaty_AND_salvadoran_col_n(-1,-1)).

generate_facts_lateran_treaty_AND_salvadoran_col_n([(Start,End) | Tail]) :- assert(lateran_treaty_AND_salvadoran_col_n(Start,End)), generate_facts_lateran_treaty_AND_salvadoran_col_n(Tail).

lateran_treaty_AND_salvadoran_col_n_aux() :- findall((Start,End),lateran_treaty(Start,End),Interval1), findall((Start,End),salvadoran_col_n(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_lateran_treaty_AND_salvadoran_col_n(Interval).

lateran_treaty_AND_salvadoran_col_n_at_1781(Res) :- setof((Start,End),lateran_treaty_AND_salvadoran_col_n(Start,End),AllINtervals), checkvalidity(1781,AllINtervals,Res).

check_query() :- write('Query = lateran_treaty_AND_salvadoran_col_n_at_1781'), (lateran_treaty_AND_salvadoran_col_n_at_1781(true) -> write('\nRes   = true');write('\nRes   = false')).
?- lateran_treaty_AND_salvadoran_col_n_aux().

