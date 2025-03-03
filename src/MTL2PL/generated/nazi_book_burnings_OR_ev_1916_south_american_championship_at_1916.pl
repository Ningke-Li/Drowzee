:- include('database.pl').
nazi_book_burnings(Start,End) :- begin('nazi_book_burnings',_,_,Start), end('nazi_book_burnings',_,_,End), Start=<End.

ev_1916_south_american_championship(Start,End) :- begin('ev_1916_south_american_championship',_,_,Start), end('ev_1916_south_american_championship',_,_,End), Start=<End.

generate_facts_nazi_book_burnings_OR_ev_1916_south_american_championship([]) :- assert(nazi_book_burnings_OR_ev_1916_south_american_championship(-1,-1)).

generate_facts_nazi_book_burnings_OR_ev_1916_south_american_championship([(Start,End) | Tail]) :- assert(nazi_book_burnings_OR_ev_1916_south_american_championship(Start,End)), generate_facts_nazi_book_burnings_OR_ev_1916_south_american_championship(Tail).

nazi_book_burnings_OR_ev_1916_south_american_championship_aux() :- findall((Start,End),nazi_book_burnings(Start,End),Interval1), findall((Start,End),ev_1916_south_american_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_nazi_book_burnings_OR_ev_1916_south_american_championship(Interval).

nazi_book_burnings_OR_ev_1916_south_american_championship_at_1916(Res) :- setof((Start,End),nazi_book_burnings_OR_ev_1916_south_american_championship(Start,End),AllINtervals), checkvalidity(1916,AllINtervals,Res).

check_query() :- write('Query = nazi_book_burnings_OR_ev_1916_south_american_championship_at_1916'), (nazi_book_burnings_OR_ev_1916_south_american_championship_at_1916(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nazi_book_burnings_OR_ev_1916_south_american_championship_aux().

