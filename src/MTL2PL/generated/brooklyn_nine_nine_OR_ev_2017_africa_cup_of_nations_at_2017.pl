:- include('database.pl').
brooklyn_nine_nine(Start,End) :- begin('brooklyn_nine_nine',_,_,Start), end('brooklyn_nine_nine',_,_,End), Start=<End.

ev_2017_africa_cup_of_nations(Start,End) :- begin('ev_2017_africa_cup_of_nations',_,_,Start), end('ev_2017_africa_cup_of_nations',_,_,End), Start=<End.

generate_facts_brooklyn_nine_nine_OR_ev_2017_africa_cup_of_nations([]) :- assert(brooklyn_nine_nine_OR_ev_2017_africa_cup_of_nations(-1,-1)).

generate_facts_brooklyn_nine_nine_OR_ev_2017_africa_cup_of_nations([(Start,End) | Tail]) :- assert(brooklyn_nine_nine_OR_ev_2017_africa_cup_of_nations(Start,End)), generate_facts_brooklyn_nine_nine_OR_ev_2017_africa_cup_of_nations(Tail).

brooklyn_nine_nine_OR_ev_2017_africa_cup_of_nations_aux() :- findall((Start,End),brooklyn_nine_nine(Start,End),Interval1), findall((Start,End),ev_2017_africa_cup_of_nations(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_brooklyn_nine_nine_OR_ev_2017_africa_cup_of_nations(Interval).

brooklyn_nine_nine_OR_ev_2017_africa_cup_of_nations_at_2017(Res) :- setof((Start,End),brooklyn_nine_nine_OR_ev_2017_africa_cup_of_nations(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = brooklyn_nine_nine_OR_ev_2017_africa_cup_of_nations_at_2017'), (brooklyn_nine_nine_OR_ev_2017_africa_cup_of_nations_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- brooklyn_nine_nine_OR_ev_2017_africa_cup_of_nations_aux().

