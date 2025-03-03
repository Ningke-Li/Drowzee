:- include('database.pl').
figure_skating_at_the_2010_winter_olympics(Start,End) :- begin('figure_skating_at_the_2010_winter_olympics',_,_,Start), end('figure_skating_at_the_2010_winter_olympics',_,_,End), Start=<End.

next_figure_skating_at_the_2010_winter_olympics(Start,End) :- figure_skating_at_the_2010_winter_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_figure_skating_at_the_2010_winter_olympics_at_2053(Res) :- setof((Start,End),next_figure_skating_at_the_2010_winter_olympics(Start,End),AllINtervals), checkvalidity(2053,AllINtervals,Res).

check_query() :- write('Query = next_figure_skating_at_the_2010_winter_olympics_at_2053'), (next_figure_skating_at_the_2010_winter_olympics_at_2053(true) -> write('\nRes   = true');write('\nRes   = false')).

