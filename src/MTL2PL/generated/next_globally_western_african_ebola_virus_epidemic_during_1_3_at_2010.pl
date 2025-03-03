:- include('database.pl').
western_african_ebola_virus_epidemic(Start,End) :- begin('western_african_ebola_virus_epidemic',_,_,Start), end('western_african_ebola_virus_epidemic',_,_,End), Start=<End.

globally_western_african_ebola_virus_epidemic_during_1_3(Start,End) :- western_african_ebola_virus_epidemic(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_western_african_ebola_virus_epidemic_during_1_3(Start,End) :- globally_western_african_ebola_virus_epidemic_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_western_african_ebola_virus_epidemic_during_1_3_at_2010(Res) :- setof((Start,End),next_globally_western_african_ebola_virus_epidemic_during_1_3(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = next_globally_western_african_ebola_virus_epidemic_during_1_3_at_2010'), (next_globally_western_african_ebola_virus_epidemic_during_1_3_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

