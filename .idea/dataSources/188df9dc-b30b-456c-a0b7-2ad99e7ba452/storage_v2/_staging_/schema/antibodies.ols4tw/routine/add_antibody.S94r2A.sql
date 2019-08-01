create procedure add_antibody(IN `_antigen` varchar(200), IN `_produced_in` varchar(100), IN `_company` varchar(150),
                              IN `_cat_nr`  varchar(100), IN `_location` varchar(10), IN `_box` varchar(15),
                              IN `_details` varchar(250))
  BEGIN

    INSERT INTO list (antigen, produced_in, company, cat_nr, location, box, details)
    VALUES (_antigen, _produced_in, _company, _cat_nr, _location, _box, _details);
  end;

DROP procedure add_antibody;