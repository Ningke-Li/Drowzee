:- include('database.pl').
greco_turkish_war(Start,End) :- begin('greco_turkish_war',_,_,Start), end('greco_turkish_war',_,_,End), Start=<End.

globally_greco_turkish_war_during_1_3(Start,End) :- greco_turkish_war(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_greco_turkish_war_during_1_3_at_1813(Res) :- setof((Start,End),globally_greco_turkish_war_during_1_3(Start,End),AllINtervals), checkvalidity(1813,AllINtervals,Res).

check_query() :- write('Query = globally_greco_turkish_war_during_1_3_at_1813'), (globally_greco_turkish_war_during_1_3_at_1813(true) -> write('\nRes   = true');write('\nRes   = false')).

