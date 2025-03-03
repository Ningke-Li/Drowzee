:- include('database.pl').
italo_turkish_war(Start,End) :- begin('italo_turkish_war',_,_,Start), end('italo_turkish_war',_,_,End), Start=<End.

next_italo_turkish_war(Start,End) :- italo_turkish_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_italo_turkish_war_at_1798(Res) :- setof((Start,End),next_italo_turkish_war(Start,End),AllINtervals), checkvalidity(1798,AllINtervals,Res).

check_query() :- write('Query = next_italo_turkish_war_at_1798'), (next_italo_turkish_war_at_1798(true) -> write('\nRes   = true');write('\nRes   = false')).

