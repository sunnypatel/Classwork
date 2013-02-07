-- store with no products
insert into stores (storename, storenbr, city) values ('Sunnys store', 403,
'Philadelphia');

insert into planogram (planogramname, planogramdescription,
planogramid,category) values ('NoProds','Should be empty',999,23458);

insert into storepogs (storenbr,planogramid,storetable,side,section) values
(403,999,'12345','C',888);

