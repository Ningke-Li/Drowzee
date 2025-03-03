:- include('database.pl').
sh_wa_era(Start,End) :- begin('sh_wa_era',_,_,Start), end('sh_wa_era',_,_,End), Start=<End.

next_sh_wa_era(Start,End) :- sh_wa_era(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_sh_wa_era_at_1954(Res) :- setof((Start,End),next_sh_wa_era(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = next_sh_wa_era_at_1954'), (next_sh_wa_era_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).

