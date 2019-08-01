create procedure new_order(IN `_date_requested` timestamp, IN `_person` varchar(200), IN `_item` varchar(200),
                           IN `_amount`         varchar(100), IN `_company` varchar(150), IN `_cat_nr` varchar(100),
                           IN `_is_ordered`     tinyint(1), IN `_date_ordered` timestamp, IN `_is_delivered` tinyint(1),
                           IN `_date_delivered` timestamp, IN `_url` varchar(500))
  BEGIN

    INSERT INTO orders (date_requested,
                        person,
                        item,
                        amount,
                        company,
                        cat_nr,
                        is_ordered,
                        is_delivered,
                        
                        url)
    VALUES (`_date_requested`,
            `_person`,
            `_item`,
            `_amount`,
            `_company`,
            `_cat_nr`,
            `_is_ordered`,
            `_is_delivered`,
            `_url`);
  end;

