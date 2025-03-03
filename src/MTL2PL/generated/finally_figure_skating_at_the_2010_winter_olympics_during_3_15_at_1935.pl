:- include('database.pl').
figure_skating_at_the_2010_winter_olympics(Start,End) :- begin('figure_skating_at_the_2010_winter_olympics',_,_,Start), end('figure_skating_at_the_2010_winter_olympics',_,_,End), Start=<End.

finally_figure_skating_at_the_2010_winter_olympics_during_3_15(Start,End) :- figure_skating_at_the_2010_winter_olympics(Start1,End1), (Start1-15)=<(End1-3), Start is (Start1-15), End is (End1-3), Start=<End.

finally_figure_skating_at_the_2010_winter_olympics_during_3_15_at_1935(Res) :- setof((Start,End),finally_figure_skating_at_the_2010_winter_olympics_during_3_15(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = finally_figure_skating_at_the_2010_winter_olympics_during_3_15_at_1935'), (finally_figure_skating_at_the_2010_winter_olympics_during_3_15_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).

