create table vol_surface (
id integer(10) not null auto_increment,
type varchar(200) not null,
primary key (id)
) engine=innodb;

create table instrument (
id integer(10) not null auto_increment,
name varchar(200) not null,
code varchar(200),
portfolio  varchar(200), 
maturity varchar(200), 
start_value decimal(10,2),
end_value decimal(10,2),
multiple decimal(10,2),
primary key (id)
)engine=innodb;

create table vol_dump(
id integer(10) not null auto_increment,
product varchar(200),
vol_surface_id integer(10),
instrument_id  integer(10), 
start decimal(10,2),
step decimal(10,2),
extrapolate varchar(1), 
multiple decimal(10,2),
code varchar(200),
future_ref varchar(200),
options_ref  varchar(200),
expiry_date date,
primary key (id),
foreign key (vol_surface_id) references vol_surface(id),
foreign key (instrument_id) references instrument(id)
) engine=innodb;

create table bloomberg_product(
id integer(10 ) not null auto_increment,
bloomberg_product_name varchar(200),
bloomberg_product_desc varchar(200),
primary key (id)
)engine=innodb;


CREATE TABLE product (			
id INTEGER (10) AUTO_INCREMENT,		
exchange INTEGER (10),
invenio_product INTEGER (10),
bloomberg_product INTEGER (10),
reuters_product INTEGER (10),
xtraders_exchange INTEGER (10),
rjo_exchange INTEGER (10),
murex_exchange INTEGER (10),
options_unl_contr INTEGER (10),
futures_unl_contr INTEGER (10),
options_xtrader INTEGER (10),
futures_xtrader INTEGER (10),
options_rjo INTEGER (10),
futures_rjo INTEGER (10),
dollar_conversion DECIMAL(15,6),
price_unit_quote INTEGER (10),
currency_quote VARCHAR(200),
qty_unit_quote VARCHAR(200),
lots_to_mt DECIMAL(15,6),
exchange_exercise_type INTEGER (10),
atm_convention_for_expiry INTEGER (10),
cash_physical_settlement INTEGER (10),
contract_month_futf CHAR(1),
contract_month_futg CHAR(1),
contract_month_futh CHAR(1),
contract_month_futj CHAR(1),
contract_month_futk CHAR(1),
contract_month_futm CHAR(1),
contract_month_futn CHAR(1),
contract_month_futq CHAR(1),
contract_month_futu CHAR(1),
contract_month_futv CHAR(1),
contract_month_futx CHAR(1),
contract_month_futz CHAR(1),
contract_month_optf CHAR(1),
contract_month_optg CHAR(1),
contract_month_opth CHAR(1),
contract_month_optj CHAR(1),
contract_month_optk CHAR(1),
contract_month_optm CHAR(1),
contract_month_optn CHAR(1),
contract_month_optq CHAR(1),
contract_month_optu CHAR(1),
contract_month_optv CHAR(1),
contract_month_optx CHAR(1),
contract_month_optz CHAR(1),
PRIMARY KEY(id)
)ENGINE=INNODB;


create table reuters_product(
id integer(10 ) not null auto_increment,
reuters_product_name varchar(200),
reuters_product_desc varchar(200),
primary key (id)
)engine=innodb;

create table invenio_product(
id integer(10 ) not null auto_increment,
invenio_product_name varchar(200),
invenio_product_desc varchar(200),
primary key (id)
)engine=innodb;

create table exchange(
id integer(10 ) not null auto_increment,
exchange_name varchar(200),
exchange_desc varchar(200),
primary key (id)
)engine=innodb;

create table murex_exchange(
id integer(10 ) not null auto_increment,
murex_exchange_name varchar(200),
murex_exchange_desc varchar(200),
primary key (id)
)engine=innodb;

create table rjo_exchange(
id integer(10 ) not null auto_increment,
rjo_exchange_name varchar(200),
rjo_exchange_desc varchar(200),
primary key (id)
)engine=innodb;

create table xtraders_exchange(
id integer(10 ) not null auto_increment,
xtraders_exchange_name varchar(200),
xtraders_exchange_desc varchar(200),
primary key (id)
)engine=innodb;

create table futures_rjo(
id integer(10 ) not null auto_increment,
futures_name varchar(200),
futures_desc varchar(200),
primary key (id)
)engine=innodb;

create table options_rjo(
id integer(10 ) not null auto_increment,
options_name varchar(200),
options_desc varchar(200),
primary key (id)
)engine=innodb;

create table futures_unl_contr(
id integer(10 ) not null auto_increment,
futures_name varchar(200),
futures_desc varchar(200),
primary key (id)
)engine=innodb;

create table options_unl_contr(
id integer(10 ) not null auto_increment,
options_name varchar(200),
options_desc varchar(200),
primary key (id)
)engine=innodb;

create table futures_xtrader(
id integer(10 ) not null auto_increment,
futures_name varchar(200),
futures_desc varchar(200),
primary key (id)
)engine=innodb;

create table options_xtrader(
id integer(10 ) not null auto_increment,
options_name varchar(200),
options_desc varchar(200),
primary key (id)
)engine=innodb;

CREATE TABLE frequency (
id INTEGER(10) not null AUTO_INCREMENT,
frequency_type VARCHAR(200),
PRIMARY KEY(id)
) ENGINE=INNODB;

CREATE TABLE accumulation_frequency (
id INTEGER(10) not null AUTO_INCREMENT,
frequency_type VARCHAR(200),
PRIMARY KEY(id)
) ENGINE=INNODB;

CREATE TABLE averaging_frequency (
id INTEGER(10) not null AUTO_INCREMENT,
frequency_type VARCHAR(200),
PRIMARY KEY(id)
) ENGINE=INNODB;

CREATE TABLE quanto_type (
id INTEGER(10) not null AUTO_INCREMENT,
quanto_type VARCHAR(200),
PRIMARY KEY(id)
) ENGINE=INNODB;

CREATE TABLE derivative_type (
id INTEGER(10) not null AUTO_INCREMENT,
derivative_type VARCHAR(200),
PRIMARY KEY(id)
) ENGINE=INNODB;

CREATE TABLE action_type (
id INTEGER(10) not null AUTO_INCREMENT,
action_type VARCHAR(200),
PRIMARY KEY(id)
) ENGINE=INNODB;

create table vol_surface_greeks(
id integer(10) not null auto_increment,
name varchar(200),
description varchar(200),
primary key (id)
)engine=innodb;

create table intrapolation_technique(
id integer(10) not null auto_increment,
name varchar(200),
description varchar(200),
primary key (id)
)engine=innodb;

create table extrapolation_technique(
id integer(10) not null auto_increment,
name varchar(200),
description varchar(200),
primary key (id)
)engine=innodb;

DROP TABLE IF EXISTS access;
create table access(
id integer(10) not null auto_increment,
name varchar(200),
description varchar(200),
primary key (id)
)engine=innodb;

create table execution_type(
id integer(10) not null auto_increment,
name varchar(200),
description varchar(200),
primary key (id)
)engine=innodb;

create table brokerage_callsign(
id integer(10) not null auto_increment,
name varchar(200),
description varchar(200),
primary key (id)
)engine=innodb;

create table exchange_callsign(
id integer(10) not null auto_increment,
name varchar(200),
description varchar(200),
primary key (id)
)engine=innodb;

create table execution_broker(
id integer(10) not null auto_increment,
name varchar(200),
description varchar(200),
primary key (id)
)engine=innodb;

create table clearing_broker(
id integer(10) not null auto_increment,
name varchar(200),
description varchar(200),
primary key (id)
)engine=innodb;

CREATE TABLE deal_ticket (
id INTEGER(10) not null AUTO_INCREMENT,
trade_id	integer(10) not null,
parent_trade_id	integer(10) not null,
portfolio	 VARCHAR(200),
sub_portfolio	VARCHAR(200),
strategy_name	VARCHAR(200),
product_id INTEGER(10),
sub_product1 VARCHAR(200),
sub_product2 VARCHAR(200),
derivative_type_id	INTEGER(10),
strike	DECIMAL(15,6),
action_type_id	INTEGER(10),
original_lots	DECIMAL(15,2),
original_premium	DECIMAL(15,6),
vol_override	CHAR(1),
vol_override_value	DECIMAL(15,6),
correl_override	CHAR(1),
correl_override_value	DECIMAL(15,6),
counterparty_parent	VARCHAR(200),
counterparty_bu	VARCHAR(200),
counterparty_entity	VARCHAR(200),
execution_broker	VARCHAR(200),
clearing_broker	VARCHAR(200),
channel VARCHAR(200),
brokerage_rate	VARCHAR(200),
brokerage_comment	VARCHAR(200),
ref_futures_price	DECIMAL(15,6),
barrier1	DECIMAL(15,6),
barrier2	DECIMAL(15,6),
barrier1obs_start DATE,
barrier2obs_start DATE,
barrier1obs_end_date	DATE,
barrier2obs_end_date	DATE,
rebate	DECIMAL(15,6),
quanto_type_id	INTEGER(10), 
averaging_frequency_id	INTEGER(10), 
averaging_start_date	DATE,
averaging_end_date	DATE,
average_till_now	DECIMAL(15,6),
accumulation_frequency_id	INTEGER(10), 
accumulation_start_date	DATE,
accumulation_end_date	DATE,
accumulation_till_now	DECIMAL(10,2),
active_lots	DECIMAL(10,2),
exercised_lots	DECIMAL(10,2),
abandoned_lots	DECIMAL(10,2),
got_assigned_lots	DECIMAL(10,2),
date_time DATETIME,
system_date DATETIME,
created_by VARCHAR(200),
modified_time DATETIME,	
reconed_with_clearer	CHAR(1),
reconed_completed_by	VARCHAR(200),
recon_date	DATE,
recon_time_stamp	DATETIME,
brokerage_accrued	DECIMAL(10,2),
brokerage_paid	CHAR(1),
expiry_processed	CHAR(1),
version_ref	VARCHAR(50) not null, 
version_number	INTEGER(10) not null, 
version_date DATE not null, 
versioned_by VARCHAR(200),
PRIMARY KEY(id)
)ENGINE=INNODB;

ALTER TABLE deal_ticket ADD FOREIGN KEY (accumulation_frequency_id) REFERENCES accumulation_frequency(id);
ALTER TABLE deal_ticket ADD FOREIGN KEY (averaging_frequency_id) REFERENCES averaging_frequency(id);
ALTER TABLE deal_ticket ADD FOREIGN KEY (quanto_type_id) REFERENCES quanto_type(id);
ALTER TABLE deal_ticket ADD FOREIGN KEY (derivative_type_id) REFERENCES derivative_type(id);
ALTER TABLE deal_ticket ADD FOREIGN KEY (action_type_id) REFERENCES action_type(id);



CREATE TABLE `atm_convention_for_expiry` (
  `id` int(11) NOT NULL auto_increment,
  `atm_convention_for_expiry_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB ;

CREATE TABLE `cash_physical_settlement` (
  `id` int(11) NOT NULL auto_increment,
  `cash_physical_settlement_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB;

CREATE TABLE `exchange_exercise_type` (
  `id` int(11) NOT NULL auto_increment,
  `exchange_exercise_type_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB;

CREATE TABLE `future_contract` (
  `id` int(11) NOT NULL auto_increment,
  `first_deilvery_day` datetime default NULL,
  `first_notice_day` datetime default NULL,
  `first_trading_day` datetime default NULL,
  `fut_id` varchar(255) default NULL,
  `future_settlement_reference_price` decimal(19,2) default NULL,
  `last_delivery_day` datetime default NULL,
  `last_trading_day` datetime default NULL,
  `invenio_product` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_fut_cont_inv_prod` (`invenio_product`),
  CONSTRAINT `FK_fut_cont_inv_prod` FOREIGN KEY (`invenio_product`) REFERENCES `invenio_product` (`id`)
) ENGINE=InnoDB; 


CREATE TABLE `future_prices` (
  `id` int(11) NOT NULL auto_increment,
  `fut_id` varchar(255) default NULL,
  `future_date` datetime default NULL,
  `price` decimal(19,2) default NULL,
  `invenio_product` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_fut_price_inv_prod` (`invenio_product`),
  CONSTRAINT `FK_fut_price_inv_prod` FOREIGN KEY (`invenio_product`) REFERENCES `invenio_product` (`id`)
) ENGINE=InnoDB; 


CREATE TABLE `inv_vol_param` (
  `id` int(11) NOT NULL auto_increment,
  `atm1p1` varchar(255) default NULL,
  `atm1p2` varchar(255) default NULL,
  `atm1p3` varchar(255) default NULL,
  `atm1p4` varchar(255) default NULL,
  `atm1p5` varchar(255) default NULL,
  `atm2p1` varchar(255) default NULL,
  `atm2p2` varchar(255) default NULL,
  `atm2p3` varchar(255) default NULL,
  `atm2p4` varchar(255) default NULL,
  `atm2p5` varchar(255) default NULL,
  `atm2p6` varchar(255) default NULL,
  `atm2p7` varchar(255) default NULL,
  `ending_strike_exch` decimal(19,2) default NULL,
  `ending_strike_inv` decimal(19,2) default NULL,
  `expiration_date` decimal(19,2) default NULL,
  `extrapolation_technique` decimal(19,2) default NULL,
  `intrapolation_technique` decimal(19,2) default NULL,
  `ladder_metadate_source` varchar(255) default NULL,
  `misc1p1` varchar(255) default NULL,
  `misc1p10` varchar(255) default NULL,
  `misc1p11` varchar(255) default NULL,
  `misc1p12` varchar(255) default NULL,
  `misc1p2` varchar(255) default NULL,
  `misc1p3` varchar(255) default NULL,
  `misc1p4` varchar(255) default NULL,
  `misc1p5` varchar(255) default NULL,
  `misc1p6` varchar(255) default NULL,
  `misc1p7` varchar(255) default NULL,
  `misc1p8` varchar(255) default NULL,
  `misc1p9` varchar(255) default NULL,
  `misc2p1` varchar(255) default NULL,
  `misc2p10` varchar(255) default NULL,
  `misc2p11` varchar(255) default NULL,
  `misc2p12` varchar(255) default NULL,
  `misc2p2` varchar(255) default NULL,
  `misc2p3` varchar(255) default NULL,
  `misc2p4` varchar(255) default NULL,
  `misc2p5` varchar(255) default NULL,
  `misc2p6` varchar(255) default NULL,
  `misc2p7` varchar(255) default NULL,
  `misc2p8` varchar(255) default NULL,
  `misc2p9` varchar(255) default NULL,
  `misc3p1` varchar(255) default NULL,
  `misc3p10` varchar(255) default NULL,
  `misc3p11` varchar(255) default NULL,
  `misc3p12` varchar(255) default NULL,
  `misc3p2` varchar(255) default NULL,
  `misc3p3` varchar(255) default NULL,
  `misc3p4` varchar(255) default NULL,
  `misc3p5` varchar(255) default NULL,
  `misc3p6` varchar(255) default NULL,
  `misc3p7` varchar(255) default NULL,
  `misc3p8` varchar(255) default NULL,
  `misc3p9` varchar(255) default NULL,
  `misc4p1` varchar(255) default NULL,
  `misc4p10` varchar(255) default NULL,
  `misc4p11` varchar(255) default NULL,
  `misc4p12` varchar(255) default NULL,
  `misc4p2` varchar(255) default NULL,
  `misc4p3` varchar(255) default NULL,
  `misc4p4` varchar(255) default NULL,
  `misc4p5` varchar(255) default NULL,
  `misc4p6` varchar(255) default NULL,
  `misc4p7` varchar(255) default NULL,
  `misc4p8` varchar(255) default NULL,
  `misc4p9` varchar(255) default NULL,
  `misc5p1` varchar(255) default NULL,
  `misc5p10` varchar(255) default NULL,
  `misc5p11` varchar(255) default NULL,
  `misc5p12` varchar(255) default NULL,
  `misc5p2` varchar(255) default NULL,
  `misc5p3` varchar(255) default NULL,
  `misc5p4` varchar(255) default NULL,
  `misc5p5` varchar(255) default NULL,
  `misc5p6` varchar(255) default NULL,
  `misc5p7` varchar(255) default NULL,
  `misc5p8` varchar(255) default NULL,
  `misc5p9` varchar(255) default NULL,
  `opt` varchar(255) default NULL,
  `starting_strike_exch` decimal(19,2) default NULL,
  `strike_jump_exch` decimal(19,2) default NULL,
  `strike_jump_inv` decimal(19,2) default NULL,
  `vol_pathp1` varchar(255) default NULL,
  `vol_pathp10` varchar(255) default NULL,
  `vol_pathp11` varchar(255) default NULL,
  `vol_pathp12` varchar(255) default NULL,
  `vol_pathp2` varchar(255) default NULL,
  `vol_pathp3` varchar(255) default NULL,
  `vol_pathp4` varchar(255) default NULL,
  `vol_pathp5` varchar(255) default NULL,
  `vol_pathp6` varchar(255) default NULL,
  `vol_pathp7` varchar(255) default NULL,
  `vol_pathp8` varchar(255) default NULL,
  `vol_pathp9` varchar(255) default NULL,
  `invenio_product` int(11) default NULL,
  `surface_type` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_inv_vol_param_inv_prod` (`invenio_product`),
  KEY `FK_inv_vol_param_surtype` (`surface_type`),
  CONSTRAINT `FK_inv_vol_param_surtype` FOREIGN KEY (`surface_type`) REFERENCES `vol_surface` (`id`),
  CONSTRAINT `FK_inv_vol_param_inv_prod` FOREIGN KEY (`invenio_product`) REFERENCES `invenio_product` (`id`)
) ENGINE=InnoDB; 


CREATE TABLE `option_contract` (
  `id` int(11) NOT NULL auto_increment,
  `expiration_date` datetime default NULL,
  `first_trading_day` datetime default NULL,
  `last_trading_day` datetime default NULL,
  `opt_id` varchar(255) default NULL,
  `option_settlement_reference_price` decimal(19,2) default NULL,
  `invenio_product` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_option_contract_inv_prod` (`invenio_product`),
  CONSTRAINT `FK_option_contract_inv_prod` FOREIGN KEY (`invenio_product`) REFERENCES `invenio_product` (`id`)
) ENGINE=InnoDB; 


CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL auto_increment,
  `portfolio_name` varchar(255) default NULL,
  `invenio_product` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_portfolio_inv_prod` (`invenio_product`),
  CONSTRAINT `FK_portfolio_inv_prod` FOREIGN KEY (`invenio_product`) REFERENCES `invenio_product` (`id`)
) ENGINE=InnoDB; 



ALTER TABLE product ADD FOREIGN KEY (exchange) REFERENCES exchange(id);
ALTER TABLE product ADD FOREIGN KEY (invenio_product) REFERENCES invenio_product(id);
ALTER TABLE product ADD FOREIGN KEY (cash_physical_settlement) REFERENCES cash_physical_settlement(id);
ALTER TABLE product ADD FOREIGN KEY (atm_convention_for_expiry) REFERENCES atm_convention_for_expiry (id);
ALTER TABLE product ADD FOREIGN KEY (exchange_exercise_type) REFERENCES exchange_exercise_type(id);
ALTER TABLE product ADD FOREIGN KEY (bloomberg_product) REFERENCES bloomberg_product(id);
ALTER TABLE product ADD FOREIGN KEY (reuters_product) REFERENCES reuters_product(id);
ALTER TABLE product ADD FOREIGN KEY (xtraders_exchange) REFERENCES xtraders_exchange(id);
ALTER TABLE product ADD FOREIGN KEY (rjo_exchange) REFERENCES rjo_exchange (id);
ALTER TABLE product ADD FOREIGN KEY (murex_exchange) REFERENCES murex_exchange (id);
ALTER TABLE product ADD FOREIGN KEY (options_unl_contr) REFERENCES options_unl_contr(id);
ALTER TABLE product ADD FOREIGN KEY (futures_unl_contr) REFERENCES futures_unl_contr(id);
ALTER TABLE product ADD FOREIGN KEY (options_xtrader) REFERENCES options_xtrader(id);
ALTER TABLE product ADD FOREIGN KEY (futures_xtrader) REFERENCES futures_xtrader(id);
ALTER TABLE product ADD FOREIGN KEY (options_rjo) REFERENCES options_rjo(id);
ALTER TABLE product ADD FOREIGN KEY (futures_rjo) REFERENCES futures_rjo(id);


CREATE TABLE brokerage_master (			
id INTEGER (10) AUTO_INCREMENT,		
exchange INTEGER (10),
portfolio INTEGER (10),
product INTEGER (10),
executing_broker INTEGER (10),
clearing_broker INTEGER (10),
currency VARCHAR (200),
futures INTEGER (10),
options INTEGER (10),
special_trade VARCHAR (200),
rate DECIMAL (10,2),
payment_mode VARCHAR(200),
gua CHAR(1),
brokerage_callsign INTEGER (10),
exchange_brokerage_fees DECIMAL(15,6),
invoice_brokerage_fees DECIMAL (15,6),
start_date DATE,
end_date DATE,
comment VARCHAR(200),
PRIMARY KEY(id)
)ENGINE=INNODB;

ALTER TABLE brokerage_master ADD FOREIGN KEY (exchange) REFERENCES exchange(id);
ALTER TABLE brokerage_master ADD FOREIGN KEY (product) REFERENCES product(id);
ALTER TABLE brokerage_master ADD FOREIGN KEY (portfolio) REFERENCES portfolio(id);
ALTER TABLE brokerage_master ADD FOREIGN KEY (executing_broker) REFERENCES execution_broker(id);
ALTER TABLE brokerage_master ADD FOREIGN KEY (clearing_broker) REFERENCES clearing_broker(id);
ALTER TABLE brokerage_master ADD FOREIGN KEY (futures) REFERENCES future_contract(id);
ALTER TABLE brokerage_master ADD FOREIGN KEY (options) REFERENCES option_contract(id);
ALTER TABLE brokerage_master ADD FOREIGN KEY (brokerage_callsign) REFERENCES brokerage_callsign(id);

CREATE TABLE exchange_master (			
id INTEGER (10) AUTO_INCREMENT,		
exchange INTEGER (10),
product INTEGER (10),
futures INTEGER (10),
options INTEGER (10),
execution_type INTEGER (10),
exchange_callsign INTEGER (10),
actual_exchange_fees DECIMAL(15,6),
actual_exchange_clearing_fees DECIMAL(15,6),
actual_nfa_fees DECIMAL(15,6),
actual_exchange_currency VARCHAR(200),
published_exchange_fees DECIMAL(15,6),
published_exchange_clearing_fees DECIMAL(15,6),
published_nfa_fees DECIMAL(15,6),
published_exchange_currency VARCHAR(200),
bache DECIMAL (15,6),
bache_currency VARCHAR(200),
bache_spcl DECIMAL (15,6),
bache_spcl_currency VARCHAR(200),
rj_obrien DECIMAL (15,6),
rj_obrien_currency VARCHAR(200),
phillip_futures DECIMAL (15,6),
phillip_futures_currency VARCHAR(200),
start_date DATE,
end_date DATE,
comment VARCHAR(200),
PRIMARY KEY(id)
)ENGINE=INNODB;

ALTER TABLE exchange_master ADD FOREIGN KEY (exchange) REFERENCES exchange(id);
ALTER TABLE exchange_master ADD FOREIGN KEY (product) REFERENCES product(id);
ALTER TABLE exchange_master ADD FOREIGN KEY (futures) REFERENCES future_contract(id);
ALTER TABLE exchange_master ADD FOREIGN KEY (options) REFERENCES option_contract(id);
ALTER TABLE exchange_master ADD FOREIGN KEY (exchange_callsign) REFERENCES exchange_callsign(id);
ALTER TABLE exchange_master ADD FOREIGN KEY (execution_type) REFERENCES execution_type(id);
