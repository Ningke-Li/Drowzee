:- include('database.pl').
western_african_ebola_virus_epidemic(Start,End) :- begin('western_african_ebola_virus_epidemic',_,_,Start), end('western_african_ebola_virus_epidemic',_,_,End), Start=<End.

next_western_african_ebola_virus_epidemic(Start,End) :- western_african_ebola_virus_epidemic(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_western_african_ebola_virus_epidemic_at_1959(Res) :- setof((Start,End),next_western_african_ebola_virus_epidemic(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = next_western_african_ebola_virus_epidemic_at_1959'), (next_western_african_ebola_virus_epidemic_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).

