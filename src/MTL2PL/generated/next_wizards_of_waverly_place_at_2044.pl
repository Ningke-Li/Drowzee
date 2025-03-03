:- include('database.pl').
wizards_of_waverly_place(Start,End) :- begin('wizards_of_waverly_place',_,_,Start), end('wizards_of_waverly_place',_,_,End), Start=<End.

next_wizards_of_waverly_place(Start,End) :- wizards_of_waverly_place(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_wizards_of_waverly_place_at_2044(Res) :- setof((Start,End),next_wizards_of_waverly_place(Start,End),AllINtervals), checkvalidity(2044,AllINtervals,Res).

check_query() :- write('Query = next_wizards_of_waverly_place_at_2044'), (next_wizards_of_waverly_place_at_2044(true) -> write('\nRes   = true');write('\nRes   = false')).

