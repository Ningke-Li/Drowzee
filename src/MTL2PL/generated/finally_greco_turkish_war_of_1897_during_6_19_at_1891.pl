:- include('database.pl').
greco_turkish_war_of_1897(Start,End) :- begin('greco_turkish_war_of_1897',_,_,Start), end('greco_turkish_war_of_1897',_,_,End), Start=<End.

finally_greco_turkish_war_of_1897_during_6_19(Start,End) :- greco_turkish_war_of_1897(Start1,End1), (Start1-19)=<(End1-6), Start is (Start1-19), End is (End1-6), Start=<End.

finally_greco_turkish_war_of_1897_during_6_19_at_1891(Res) :- setof((Start,End),finally_greco_turkish_war_of_1897_during_6_19(Start,End),AllINtervals), checkvalidity(1891,AllINtervals,Res).

check_query() :- write('Query = finally_greco_turkish_war_of_1897_during_6_19_at_1891'), (finally_greco_turkish_war_of_1897_during_6_19_at_1891(true) -> write('\nRes   = true');write('\nRes   = false')).

