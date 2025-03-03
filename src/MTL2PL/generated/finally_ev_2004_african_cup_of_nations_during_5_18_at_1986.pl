:- include('database.pl').
ev_2004_african_cup_of_nations(Start,End) :- begin('ev_2004_african_cup_of_nations',_,_,Start), end('ev_2004_african_cup_of_nations',_,_,End), Start=<End.

finally_ev_2004_african_cup_of_nations_during_5_18(Start,End) :- ev_2004_african_cup_of_nations(Start1,End1), (Start1-18)=<(End1-5), Start is (Start1-18), End is (End1-5), Start=<End.

finally_ev_2004_african_cup_of_nations_during_5_18_at_1986(Res) :- setof((Start,End),finally_ev_2004_african_cup_of_nations_during_5_18(Start,End),AllINtervals), checkvalidity(1986,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2004_african_cup_of_nations_during_5_18_at_1986'), (finally_ev_2004_african_cup_of_nations_during_5_18_at_1986(true) -> write('\nRes   = true');write('\nRes   = false')).

