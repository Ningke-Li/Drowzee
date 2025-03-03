:- include('database.pl').
western_african_ebola_virus_epidemic(Start,End) :- begin('western_african_ebola_virus_epidemic',_,_,Start), end('western_african_ebola_virus_epidemic',_,_,End), Start=<End.

the_legend_of_korra(Start,End) :- begin('the_legend_of_korra',_,_,Start), end('the_legend_of_korra',_,_,End), Start=<End.

generate_facts_western_african_ebola_virus_epidemic_AND_the_legend_of_korra([]) :- assert(western_african_ebola_virus_epidemic_AND_the_legend_of_korra(-1,-1)).

generate_facts_western_african_ebola_virus_epidemic_AND_the_legend_of_korra([(Start,End) | Tail]) :- assert(western_african_ebola_virus_epidemic_AND_the_legend_of_korra(Start,End)), generate_facts_western_african_ebola_virus_epidemic_AND_the_legend_of_korra(Tail).

western_african_ebola_virus_epidemic_AND_the_legend_of_korra_aux() :- findall((Start,End),western_african_ebola_virus_epidemic(Start,End),Interval1), findall((Start,End),the_legend_of_korra(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_western_african_ebola_virus_epidemic_AND_the_legend_of_korra(Interval).

western_african_ebola_virus_epidemic_AND_the_legend_of_korra_at_1885(Res) :- setof((Start,End),western_african_ebola_virus_epidemic_AND_the_legend_of_korra(Start,End),AllINtervals), checkvalidity(1885,AllINtervals,Res).

check_query() :- write('Query = western_african_ebola_virus_epidemic_AND_the_legend_of_korra_at_1885'), (western_african_ebola_virus_epidemic_AND_the_legend_of_korra_at_1885(true) -> write('\nRes   = true');write('\nRes   = false')).
?- western_african_ebola_virus_epidemic_AND_the_legend_of_korra_aux().

