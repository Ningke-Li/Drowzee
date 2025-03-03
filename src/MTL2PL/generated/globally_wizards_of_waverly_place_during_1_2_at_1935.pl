:- include('database.pl').
wizards_of_waverly_place(Start,End) :- begin('wizards_of_waverly_place',_,_,Start), end('wizards_of_waverly_place',_,_,End), Start=<End.

globally_wizards_of_waverly_place_during_1_2(Start,End) :- wizards_of_waverly_place(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_wizards_of_waverly_place_during_1_2_at_1935(Res) :- setof((Start,End),globally_wizards_of_waverly_place_during_1_2(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = globally_wizards_of_waverly_place_during_1_2_at_1935'), (globally_wizards_of_waverly_place_during_1_2_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).

