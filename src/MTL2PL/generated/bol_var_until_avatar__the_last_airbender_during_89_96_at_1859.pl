:- include('database.pl').
bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

avatar__the_last_airbender(Start,End) :- begin('avatar__the_last_airbender',_,_,Start), end('avatar__the_last_airbender',_,_,End), Start=<End.

bol_var_last_till_89_96(Start,End) :- bol_var(Start1,End1), (End1-Start1)>=89, Start is (Start1+89), End is (End1+1).

bol_var_until_avatar__the_last_airbender_during_89_96_overlap(Start,End) :- bol_var_last_till_89_96(Start1,End1), avatar__the_last_airbender(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

bol_var_until_avatar__the_last_airbender_during_89_96(Start,End) :- bol_var(W1,_), bol_var_until_avatar__the_last_airbender_during_89_96_overlap(Start1,End1), Start is max((Start1-96),W1), End is (End1-89), Start=<End.

bol_var_until_avatar__the_last_airbender_during_89_96_at_1859(Res) :- setof((Start,End),bol_var_until_avatar__the_last_airbender_during_89_96(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = bol_var_until_avatar__the_last_airbender_during_89_96_at_1859'), (bol_var_until_avatar__the_last_airbender_during_89_96_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).

