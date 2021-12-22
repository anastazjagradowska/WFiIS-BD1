CREATE OR REPLACE FUNCTION reorders(n INTEGER)
RETURNS TABLE (produkty_brakujace INTEGER) AS $$
DECLARE     
    rec RECORD;
    rec2 RECORD;
    query text;
    query2 text;
    ilosc INTEGER;
    message text;
    
BEGIN 
   query:='SELECT COUNT(*) AS product_count FROM stock WHERE quantity < ' || CAST(n AS varchar);
   
   FOR rec IN EXECUTE query 
    LOOP
            produkty_brakujace = rec.product_count;
            
            RETURN NEXT;
    END LOOP;
    
    query2:='SELECT * FROM stock WHERE quantity < ' || CAST(n AS varchar);

    FOR rec2 IN EXECUTE query2
    LOOP
        IF rec2.quantity = 0 THEN 
		    message:='Brak';
	    ELSE  
		    message:='Zostalo jeszcze ' || CAST(rec2.quantity AS varchar) || ' sztuk';
	    END IF;
            
            INSERT INTO reorders(item_id, message) values (rec2.item_id, message);
            
            
    END LOOP;
        
END;
$$ LANGUAGE plpgsql;  