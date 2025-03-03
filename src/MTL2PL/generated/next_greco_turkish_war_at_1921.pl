:- include('database.pl').
greco_turkish_war(Start,End) :- begin('greco_turkish_war',_,_,Start), end('greco_turkish_war',_,_,End), Start=<End.

next_greco_turkish_war(Start,End) :- greco_turkish_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_greco_turkish_war_at_1921(Res) :- setof((Start,End),next_greco_turkish_war(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = next_greco_turkish_war_at_1921'), (next_greco_turkish_war_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).

