:- include('database.pl').
franco_dutch_war(Start,End) :- begin('franco_dutch_war',_,_,Start), end('franco_dutch_war',_,_,End), Start=<End.

globally_franco_dutch_war_during_3_4(Start,End) :- franco_dutch_war(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

globally_franco_dutch_war_during_3_4_at_1539(Res) :- setof((Start,End),globally_franco_dutch_war_during_3_4(Start,End),AllINtervals), checkvalidity(1539,AllINtervals,Res).

check_query() :- write('Query = globally_franco_dutch_war_during_3_4_at_1539'), (globally_franco_dutch_war_during_3_4_at_1539(true) -> write('\nRes   = true');write('\nRes   = false')).

