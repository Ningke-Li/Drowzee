:- include('database.pl').
salvadoran_col_n(Start,End) :- begin('salvadoran_col_n',_,_,Start), end('salvadoran_col_n',_,_,End), Start=<End.

eighth_russo_turkish_war(Start,End) :- begin('eighth_russo_turkish_war',_,_,Start), end('eighth_russo_turkish_war',_,_,End), Start=<End.

generate_facts_salvadoran_col_n_OR_eighth_russo_turkish_war([]) :- assert(salvadoran_col_n_OR_eighth_russo_turkish_war(-1,-1)).

generate_facts_salvadoran_col_n_OR_eighth_russo_turkish_war([(Start,End) | Tail]) :- assert(salvadoran_col_n_OR_eighth_russo_turkish_war(Start,End)), generate_facts_salvadoran_col_n_OR_eighth_russo_turkish_war(Tail).

salvadoran_col_n_OR_eighth_russo_turkish_war_aux() :- findall((Start,End),salvadoran_col_n(Start,End),Interval1), findall((Start,End),eighth_russo_turkish_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_salvadoran_col_n_OR_eighth_russo_turkish_war(Interval).

salvadoran_col_n_OR_eighth_russo_turkish_war_at_1937(Res) :- setof((Start,End),salvadoran_col_n_OR_eighth_russo_turkish_war(Start,End),AllINtervals), checkvalidity(1937,AllINtervals,Res).

check_query() :- write('Query = salvadoran_col_n_OR_eighth_russo_turkish_war_at_1937'), (salvadoran_col_n_OR_eighth_russo_turkish_war_at_1937(true) -> write('\nRes   = true');write('\nRes   = false')).
?- salvadoran_col_n_OR_eighth_russo_turkish_war_aux().

