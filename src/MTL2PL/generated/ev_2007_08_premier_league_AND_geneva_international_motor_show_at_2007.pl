:- include('database.pl').
ev_2007_08_premier_league(Start,End) :- begin('ev_2007_08_premier_league',_,_,Start), end('ev_2007_08_premier_league',_,_,End), Start=<End.

geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

generate_facts_ev_2007_08_premier_league_AND_geneva_international_motor_show([]) :- assert(ev_2007_08_premier_league_AND_geneva_international_motor_show(-1,-1)).

generate_facts_ev_2007_08_premier_league_AND_geneva_international_motor_show([(Start,End) | Tail]) :- assert(ev_2007_08_premier_league_AND_geneva_international_motor_show(Start,End)), generate_facts_ev_2007_08_premier_league_AND_geneva_international_motor_show(Tail).

ev_2007_08_premier_league_AND_geneva_international_motor_show_aux() :- findall((Start,End),ev_2007_08_premier_league(Start,End),Interval1), findall((Start,End),geneva_international_motor_show(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2007_08_premier_league_AND_geneva_international_motor_show(Interval).

ev_2007_08_premier_league_AND_geneva_international_motor_show_at_2007(Res) :- setof((Start,End),ev_2007_08_premier_league_AND_geneva_international_motor_show(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = ev_2007_08_premier_league_AND_geneva_international_motor_show_at_2007'), (ev_2007_08_premier_league_AND_geneva_international_motor_show_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2007_08_premier_league_AND_geneva_international_motor_show_aux().

