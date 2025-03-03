:- include('database.pl').
wizards_of_waverly_place(Start,End) :- begin('wizards_of_waverly_place',_,_,Start), end('wizards_of_waverly_place',_,_,End), Start=<End.

ev_2011_yemeni_revolution(Start,End) :- begin('ev_2011_yemeni_revolution',_,_,Start), end('ev_2011_yemeni_revolution',_,_,End), Start=<End.

generate_facts_wizards_of_waverly_place_OR_ev_2011_yemeni_revolution([]) :- assert(wizards_of_waverly_place_OR_ev_2011_yemeni_revolution(-1,-1)).

generate_facts_wizards_of_waverly_place_OR_ev_2011_yemeni_revolution([(Start,End) | Tail]) :- assert(wizards_of_waverly_place_OR_ev_2011_yemeni_revolution(Start,End)), generate_facts_wizards_of_waverly_place_OR_ev_2011_yemeni_revolution(Tail).

wizards_of_waverly_place_OR_ev_2011_yemeni_revolution_aux() :- findall((Start,End),wizards_of_waverly_place(Start,End),Interval1), findall((Start,End),ev_2011_yemeni_revolution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_wizards_of_waverly_place_OR_ev_2011_yemeni_revolution(Interval).

wizards_of_waverly_place_OR_ev_2011_yemeni_revolution_at_1903(Res) :- setof((Start,End),wizards_of_waverly_place_OR_ev_2011_yemeni_revolution(Start,End),AllINtervals), checkvalidity(1903,AllINtervals,Res).

check_query() :- write('Query = wizards_of_waverly_place_OR_ev_2011_yemeni_revolution_at_1903'), (wizards_of_waverly_place_OR_ev_2011_yemeni_revolution_at_1903(true) -> write('\nRes   = true');write('\nRes   = false')).
?- wizards_of_waverly_place_OR_ev_2011_yemeni_revolution_aux().

