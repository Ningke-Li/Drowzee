:- include('database.pl').
desperate_housewives(Start,End) :- begin('desperate_housewives',_,_,Start), end('desperate_housewives',_,_,End), Start=<End.

gaza_war__2008_2009_(Start,End) :- begin('gaza_war__2008_2009_',_,_,Start), end('gaza_war__2008_2009_',_,_,End), Start=<End.

desperate_housewives_last_till_1_10(Start,End) :- desperate_housewives(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

desperate_housewives_until_gaza_war__2008_2009__during_1_10_overlap(Start,End) :- desperate_housewives_last_till_1_10(Start1,End1), gaza_war__2008_2009_(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

desperate_housewives_until_gaza_war__2008_2009__during_1_10(Start,End) :- desperate_housewives(W1,_), desperate_housewives_until_gaza_war__2008_2009__during_1_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-1), Start=<End.

desperate_housewives_until_gaza_war__2008_2009__during_1_10_at_2004(Res) :- setof((Start,End),desperate_housewives_until_gaza_war__2008_2009__during_1_10(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = desperate_housewives_until_gaza_war__2008_2009__during_1_10_at_2004'), (desperate_housewives_until_gaza_war__2008_2009__during_1_10_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

