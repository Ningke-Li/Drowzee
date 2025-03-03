:- include('database.pl').
the_legend_of_korra(Start,End) :- begin('the_legend_of_korra',_,_,Start), end('the_legend_of_korra',_,_,End), Start=<End.

ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

generate_facts_the_legend_of_korra_AND_ev_3rd_millennium([]) :- assert(the_legend_of_korra_AND_ev_3rd_millennium(-1,-1)).

generate_facts_the_legend_of_korra_AND_ev_3rd_millennium([(Start,End) | Tail]) :- assert(the_legend_of_korra_AND_ev_3rd_millennium(Start,End)), generate_facts_the_legend_of_korra_AND_ev_3rd_millennium(Tail).

the_legend_of_korra_AND_ev_3rd_millennium_aux() :- findall((Start,End),the_legend_of_korra(Start,End),Interval1), findall((Start,End),ev_3rd_millennium(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_legend_of_korra_AND_ev_3rd_millennium(Interval).

the_legend_of_korra_AND_ev_3rd_millennium_at_2013(Res) :- setof((Start,End),the_legend_of_korra_AND_ev_3rd_millennium(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = the_legend_of_korra_AND_ev_3rd_millennium_at_2013'), (the_legend_of_korra_AND_ev_3rd_millennium_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_legend_of_korra_AND_ev_3rd_millennium_aux().

