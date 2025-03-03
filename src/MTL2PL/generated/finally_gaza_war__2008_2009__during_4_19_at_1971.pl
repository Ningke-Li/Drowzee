:- include('database.pl').
gaza_war__2008_2009_(Start,End) :- begin('gaza_war__2008_2009_',_,_,Start), end('gaza_war__2008_2009_',_,_,End), Start=<End.

finally_gaza_war__2008_2009__during_4_19(Start,End) :- gaza_war__2008_2009_(Start1,End1), (Start1-19)=<(End1-4), Start is (Start1-19), End is (End1-4), Start=<End.

finally_gaza_war__2008_2009__during_4_19_at_1971(Res) :- setof((Start,End),finally_gaza_war__2008_2009__during_4_19(Start,End),AllINtervals), checkvalidity(1971,AllINtervals,Res).

check_query() :- write('Query = finally_gaza_war__2008_2009__during_4_19_at_1971'), (finally_gaza_war__2008_2009__during_4_19_at_1971(true) -> write('\nRes   = true');write('\nRes   = false')).

