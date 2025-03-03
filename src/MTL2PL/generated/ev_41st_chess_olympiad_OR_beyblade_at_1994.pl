:- include('database.pl').
ev_41st_chess_olympiad(Start,End) :- begin('ev_41st_chess_olympiad',_,_,Start), end('ev_41st_chess_olympiad',_,_,End), Start=<End.

beyblade(Start,End) :- begin('beyblade',_,_,Start), end('beyblade',_,_,End), Start=<End.

generate_facts_ev_41st_chess_olympiad_OR_beyblade([]) :- assert(ev_41st_chess_olympiad_OR_beyblade(-1,-1)).

generate_facts_ev_41st_chess_olympiad_OR_beyblade([(Start,End) | Tail]) :- assert(ev_41st_chess_olympiad_OR_beyblade(Start,End)), generate_facts_ev_41st_chess_olympiad_OR_beyblade(Tail).

ev_41st_chess_olympiad_OR_beyblade_aux() :- findall((Start,End),ev_41st_chess_olympiad(Start,End),Interval1), findall((Start,End),beyblade(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_41st_chess_olympiad_OR_beyblade(Interval).

ev_41st_chess_olympiad_OR_beyblade_at_1994(Res) :- setof((Start,End),ev_41st_chess_olympiad_OR_beyblade(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = ev_41st_chess_olympiad_OR_beyblade_at_1994'), (ev_41st_chess_olympiad_OR_beyblade_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_41st_chess_olympiad_OR_beyblade_aux().

