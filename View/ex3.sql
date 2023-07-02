create view BookReservation as
select book_name
from book
where treasury = 'b2';
