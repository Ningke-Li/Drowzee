:- include('database.pl').
finnish_war(Start,End) :- begin('finnish_war',_,_,Start), end('finnish_war',_,_,End), Start=<End.

salvadoran_col_n(Start,End) :- begin('salvadoran_col_n',_,_,Start), end('salvadoran_col_n',_,_,End), Start=<End.

generate_facts_finnish_war_OR_salvadoran_col_n([]) :- assert(finnish_war_OR_salvadoran_col_n(-1,-1)).

generate_facts_finnish_war_OR_salvadoran_col_n([(Start,End) | Tail]) :- assert(finnish_war_OR_salvadoran_col_n(Start,End)), generate_facts_finnish_war_OR_salvadoran_col_n(Tail).

finnish_war_OR_salvadoran_col_n_aux() :- findall((Start,End),finnish_war(Start,End),Interval1), findall((Start,End),salvadoran_col_n(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_finnish_war_OR_salvadoran_col_n(Interval).

finnish_war_OR_salvadoran_col_n_at_1843(Res) :- setof((Start,End),finnish_war_OR_salvadoran_col_n(Start,End),AllINtervals), checkvalidity(1843,AllINtervals,Res).

check_query() :- write('Query = finnish_war_OR_salvadoran_col_n_at_1843'), (finnish_war_OR_salvadoran_col_n_at_1843(true) -> write('\nRes   = true');write('\nRes   = false')).
?- finnish_war_OR_salvadoran_col_n_aux().

