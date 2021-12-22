CREATE OR REPLACE FUNCTION fun_11 () RETURNS TABLE(itemid INTEGER, description VARCHAR, message VARCHAR) AS $$
DECLARE     
    rec RECORD;
    query text;
    value text;
    
BEGIN 
    query := 'SELECT c.item_id AS itemid, c.description AS description, count(i.quantity) AS message FROM item c JOIN orderline i USING(item_id) GROUP BY itemid ORDER BY itemid';
   
    FOR rec IN EXECUTE query
        LOOP
	    IF rec.message = '1' THEN 
		value:='Kupiono ' || CAST(rec.message AS varchar) || ' raz';
	    ELSE  
		value:='Kupiono ' || CAST(rec.message AS varchar) || ' razy';
	    END IF;
            itemid = rec.itemid;
            description = rec.description;
            message = value;
            RETURN NEXT;
        END LOOP;
        
END;
$$ LANGUAGE plpgsql;  