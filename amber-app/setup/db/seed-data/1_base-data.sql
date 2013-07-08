insert into bloomberg_product values(1, 'BBG.1', 'desc 1');
insert into bloomberg_product values(2, 'BBG.2', 'desc 2');

INSERT INTO futures_rjo (id, futures_name, futures_desc) VALUES (1,'FF.1',''),(2,'FF.2','2');
INSERT INTO futures_unl_contr (id, futures_name, futures_desc) VALUES (1,'FFU.1',''),(2,'FFU.2','2');
INSERT INTO futures_xtrader (id, futures_name, futures_desc) VALUES (1,'FFX.1',''),(2,'FFX.2','2');
insert into invenio_product values(1, 'INV.1', 'desc 1'),(2, 'INV.2', 'desc 1');
insert into murex_exchange values(1, 'MSE', 'Murex SE');
INSERT INTO options_rjo (id, options_name, options_desc) VALUES (1,'OP.1',''),(2,'OP.2','2');
INSERT INTO options_unl_contr (id, options_name, options_desc) VALUES (1,'OPU.1',''),(2,'OPU.2','2');
INSERT INTO options_xtrader (id, options_name, options_desc) VALUES (1,'OPX.1',''),(2,'OPX.2','2');
insert into product (id,exchange,invenio_product,bloomberg_product) values(1,1,1,1),(2,1,1,1);
insert into reuters_product values(1, 'RP.1', 'desc 1'),(2, 'RP.2', 'desc 1');
insert into rjo_exchange values(1, 'RSE', 'RJO SE');
insert into xtraders_exchange values(1, 'XSE', 'Xtraders SE');

insert into brokerage_callsign values(1,'BCS1','');
insert into brokerage_callsign values(2,'BCS2','');
insert into exchange_callsign values(1,'ECS1','');
insert into exchange_callsign values(2,'ECS2','');

insert into future_contract values (1,'2013-01-01','2013-01-31','2013-02-01','fut1',50,'2013-02-28','2013-02-15',1);
insert into future_prices values(1,'futp1','2013-02-28',10,1);
insert into option_contract values (1,'2013-01-01','2013-01-31','2013-02-01','opt1',50,1);

insert into portfolio values(1,'por1',1),(2,'por2',1);

insert into deal_ticket (id, trade_id, parent_trade_id, product_id,vol_override,correl_override,
reconed_with_clearer, brokerage_paid,expiry_processed,
derivative_type_id, action_type_id, quanto_type_id, version_ref, version_number, version_date) 
values (1,1,0,1,'N','N','N','N','N',1,1,1, 'ref-100', 0, '2013-01-01');
insert into deal_ticket (id, trade_id, parent_trade_id, product_id,vol_override,correl_override,
reconed_with_clearer, brokerage_paid,expiry_processed,
derivative_type_id, action_type_id, quanto_type_id, version_ref, version_number, version_date) 
values (2,2,0,1,'Y','Y','N','N','N',1,1,1, 'ref-101', 0, '2013-02-01');
insert into deal_ticket (id, trade_id, parent_trade_id, product_id,vol_override,correl_override,
reconed_with_clearer, brokerage_paid,expiry_processed,
derivative_type_id, action_type_id, quanto_type_id, version_ref, version_number, version_date) 
values (3,3,0,2,'N','N','Y','Y','N',1,1,1, 'ref-102', 0, '2013-03-01');
insert into deal_ticket (id, trade_id, parent_trade_id, product_id,vol_override,correl_override,
reconed_with_clearer, brokerage_paid,expiry_processed,
derivative_type_id, action_type_id, quanto_type_id, version_ref, version_number, version_date) 
values (4,4,0,2,'N','N','Y','Y','Y',1,1,1, 'ref-103', 0, '2013-03-01');
insert into deal_ticket (id, trade_id, parent_trade_id, product_id,vol_override,correl_override,
reconed_with_clearer, brokerage_paid,expiry_processed,
derivative_type_id, action_type_id, quanto_type_id, version_ref, version_number, version_date) 
values (5,5,0,1,'N','N','Y','Y','N',1,1,1, 'ref-104', 0, '2013-03-01');

INSERT INTO brokerage_master (`id`, `exchange`, `portfolio`, `product`, `executing_broker`, `clearing_broker`, `currency`, `futures`, `special_trade`, `rate`, `payment_mode`, `gua`, `brokerage_callsign`, `exchange_brokerage_fees`, `invoice_brokerage_fees`) VALUES ('3', '1', '1', '1', '1', '1', '1', '1', 'N', '61', 'USD', 'N', '1', '1', '1');

INSERT INTO exchange_master (`id`, `exchange`, `product`, `futures`, `options`, `execution_type`, `exchange_callsign`) VALUES ('1', '1', '1', '1', '1', '1', '1');
INSERT INTO exchange_master (`id`, `exchange`, `product`, `futures`, `options`, `execution_type`, `exchange_callsign`) VALUES ('2', '2', '2', '1', '1', '2', '2');

