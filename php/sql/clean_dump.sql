CREATE TABLE `abcgroups` (
  `groupid` int(11) NOT NULL DEFAULT '0',
  `groupname` varchar(40) NOT NULL DEFAULT '',
  `methodid` tinyint(4) NOT NULL DEFAULT '0',
  `apercentage` tinyint(4) NOT NULL DEFAULT '0',
  `bpercentage` tinyint(4) NOT NULL DEFAULT '0',
  `cpercentage` tinyint(4) NOT NULL DEFAULT '0',
  `zerousage` char(1) NOT NULL DEFAULT 'D',
  `months` tinyint(4) NOT NULL DEFAULT '12',
  PRIMARY KEY (`groupid`),
  KEY `abctgroups_ibfk_1` (`methodid`),
  CONSTRAINT `abctgroups_ibfk_1` FOREIGN KEY (`methodid`) REFERENCES `abcmethods` (`methodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `abcmethods` (
  `methodid` tinyint(4) NOT NULL DEFAULT '0',
  `methodname` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`methodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `abcstock` (
  `groupid` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `abccategory` char(1) NOT NULL DEFAULT 'C',
  PRIMARY KEY (`groupid`,`stockid`),
  KEY `abcstock_ibfk_2` (`stockid`),
  CONSTRAINT `abcstock_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `abcgroups` (`groupid`),
  CONSTRAINT `abcstock_ibfk_2` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `accountgroups` (
  `groupname` char(30) NOT NULL DEFAULT '',
  `sectioninaccounts` int(11) NOT NULL DEFAULT '0',
  `pandl` tinyint(4) NOT NULL DEFAULT '1',
  `sequenceintb` smallint(6) NOT NULL DEFAULT '0',
  `parentgroupname` varchar(30) NOT NULL,
  PRIMARY KEY (`groupname`),
  KEY `SequenceInTB` (`sequenceintb`),
  KEY `sectioninaccounts` (`sectioninaccounts`),
  KEY `parentgroupname` (`parentgroupname`),
  CONSTRAINT `accountgroups_ibfk_1` FOREIGN KEY (`sectioninaccounts`) REFERENCES `accountsection` (`sectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `accountsection` (
  `sectionid` int(11) NOT NULL DEFAULT '0',
  `sectionname` text NOT NULL,
  PRIMARY KEY (`sectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `areas` (
  `areacode` char(3) NOT NULL,
  `parentarea` char(3) NOT NULL DEFAULT '',
  `areadescription` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`areacode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `asteriskdata` (
  `accountcode` varchar(10) NOT NULL DEFAULT '',
  `sourcenumber` varchar(20) NOT NULL DEFAULT '0',
  `destinationnumber` varchar(20) NOT NULL DEFAULT '0',
  `dcontext` varchar(20) NOT NULL DEFAULT '',
  `clid` varchar(100) NOT NULL DEFAULT '',
  `channel` varchar(100) NOT NULL DEFAULT '',
  `dstchannel` varchar(100) NOT NULL DEFAULT '',
  `lastapp` varchar(20) NOT NULL DEFAULT '',
  `lastdata` varchar(100) NOT NULL DEFAULT '',
  `callstartdate` datetime NOT NULL,
  `callanswerdate` datetime NOT NULL,
  `callenddate` datetime NOT NULL,
  `callduration` int(11) NOT NULL DEFAULT '0',
  `billseconds` int(11) NOT NULL DEFAULT '0',
  `disposition` varchar(25) NOT NULL DEFAULT '',
  `amaflags` varchar(25) NOT NULL DEFAULT '',
  `costpersecond` double NOT NULL DEFAULT '0',
  `uniqueid` varchar(20) NOT NULL DEFAULT '',
  `userfield` varchar(20) NOT NULL DEFAULT '',
  `quality` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`accountcode`,`callstartdate`),
  KEY `Debtorno` (`accountcode`),
  CONSTRAINT `asteriskdata _ibfk_1` FOREIGN KEY (`accountcode`) REFERENCES `debtorsmaster` (`debtorno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `audittrail` (
  `transactiondate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userid` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `querystring` text,
  KEY `UserID` (`userid`),
  KEY `audittrail_transactiondate` (`transactiondate`),
  CONSTRAINT `audittrail_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `www_users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bankaccounts` (
  `accountcode` varchar(20) NOT NULL DEFAULT '0',
  `currcode` char(3) NOT NULL,
  `invoice` smallint(2) NOT NULL DEFAULT '0',
  `bankaccountcode` varchar(50) NOT NULL DEFAULT '',
  `bankaccountname` char(50) NOT NULL DEFAULT '',
  `bankaccountnumber` char(50) NOT NULL DEFAULT '',
  `bankaddress` char(50) DEFAULT NULL,
  `pettycash` tinyint(1) NOT NULL DEFAULT '0',
  `importformat` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`accountcode`),
  KEY `currcode` (`currcode`),
  KEY `BankAccountName` (`bankaccountname`),
  KEY `BankAccountNumber` (`bankaccountnumber`),
  CONSTRAINT `bankaccounts_ibfk_1` FOREIGN KEY (`accountcode`) REFERENCES `chartmaster` (`accountcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bankaccountusers` (
  `accountcode` varchar(20) NOT NULL DEFAULT '',
  `userid` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `banktrans` (
  `banktransid` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `transno` bigint(20) NOT NULL DEFAULT '0',
  `bankact` varchar(20) NOT NULL DEFAULT '0',
  `ref` varchar(50) NOT NULL DEFAULT '',
  `chequeno` varchar(20) NOT NULL,
  `amountcleared` double NOT NULL DEFAULT '0',
  `exrate` double NOT NULL DEFAULT '1',
  `functionalexrate` double NOT NULL DEFAULT '1' COMMENT 'Account currency to functional currency',
  `transdate` date NOT NULL DEFAULT '0000-00-00',
  `banktranstype` varchar(30) NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `currcode` char(3) NOT NULL DEFAULT '',
  `userid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`banktransid`),
  KEY `BankAct` (`bankact`,`ref`),
  KEY `TransDate` (`transdate`),
  KEY `TransType` (`banktranstype`),
  KEY `Type` (`type`,`transno`),
  KEY `CurrCode` (`currcode`),
  KEY `ref` (`ref`),
  KEY `ref_2` (`ref`),
  KEY `ref_3` (`ref`),
  KEY `ref_4` (`ref`),
  KEY `ref_5` (`ref`),
  KEY `ref_6` (`ref`),
  KEY `ref_7` (`ref`),
  KEY `ref_8` (`ref`),
  KEY `ref_9` (`ref`),
  KEY `ref_10` (`ref`),
  CONSTRAINT `banktrans_ibfk_1` FOREIGN KEY (`type`) REFERENCES `systypes` (`typeid`),
  CONSTRAINT `banktrans_ibfk_2` FOREIGN KEY (`bankact`) REFERENCES `bankaccounts` (`accountcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bom` (
  `parent` char(20) NOT NULL DEFAULT '',
  `sequence` int(11) NOT NULL DEFAULT '0',
  `component` char(20) NOT NULL DEFAULT '',
  `workcentreadded` char(5) NOT NULL DEFAULT '',
  `loccode` char(5) NOT NULL DEFAULT '',
  `effectiveafter` date NOT NULL DEFAULT '0000-00-00',
  `effectiveto` date NOT NULL DEFAULT '9999-12-31',
  `quantity` double NOT NULL DEFAULT '1',
  `autoissue` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`parent`,`component`,`workcentreadded`,`loccode`),
  KEY `Component` (`component`),
  KEY `EffectiveAfter` (`effectiveafter`),
  KEY `EffectiveTo` (`effectiveto`),
  KEY `LocCode` (`loccode`),
  KEY `Parent` (`parent`,`effectiveafter`,`effectiveto`,`loccode`),
  KEY `Parent_2` (`parent`),
  KEY `WorkCentreAdded` (`workcentreadded`),
  CONSTRAINT `bom_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `bom_ibfk_2` FOREIGN KEY (`component`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `bom_ibfk_3` FOREIGN KEY (`workcentreadded`) REFERENCES `workcentres` (`code`),
  CONSTRAINT `bom_ibfk_4` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chartdetails` (
  `accountcode` varchar(20) NOT NULL DEFAULT '0',
  `period` smallint(6) NOT NULL DEFAULT '0',
  `budget` double NOT NULL DEFAULT '0',
  `actual` double NOT NULL DEFAULT '0',
  `bfwd` double NOT NULL DEFAULT '0',
  `bfwdbudget` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountcode`,`period`),
  KEY `Period` (`period`),
  CONSTRAINT `chartdetails_ibfk_1` FOREIGN KEY (`accountcode`) REFERENCES `chartmaster` (`accountcode`),
  CONSTRAINT `chartdetails_ibfk_2` FOREIGN KEY (`period`) REFERENCES `periods` (`periodno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chartmaster` (
  `accountcode` varchar(20) NOT NULL DEFAULT '0',
  `accountname` char(50) NOT NULL DEFAULT '',
  `group_` char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`accountcode`),
  KEY `AccountName` (`accountname`),
  KEY `Group_` (`group_`),
  CONSTRAINT `chartmaster_ibfk_1` FOREIGN KEY (`group_`) REFERENCES `accountgroups` (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cogsglpostings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` char(3) NOT NULL DEFAULT '',
  `stkcat` varchar(6) NOT NULL DEFAULT '',
  `glcode` varchar(20) NOT NULL DEFAULT '0',
  `salestype` char(2) NOT NULL DEFAULT 'AN',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Area_StkCat` (`area`,`stkcat`,`salestype`),
  KEY `Area` (`area`),
  KEY `StkCat` (`stkcat`),
  KEY `GLCode` (`glcode`),
  KEY `SalesType` (`salestype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `companies` (
  `coycode` int(11) NOT NULL DEFAULT '1',
  `coyname` varchar(50) NOT NULL DEFAULT '',
  `gstno` varchar(20) NOT NULL DEFAULT '',
  `companynumber` varchar(20) NOT NULL DEFAULT '0',
  `regoffice1` varchar(40) NOT NULL DEFAULT '',
  `regoffice2` varchar(40) NOT NULL DEFAULT '',
  `regoffice3` varchar(40) NOT NULL DEFAULT '',
  `regoffice4` varchar(40) NOT NULL DEFAULT '',
  `regoffice5` varchar(20) NOT NULL DEFAULT '',
  `regoffice6` varchar(15) NOT NULL DEFAULT '',
  `telephone` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(25) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  `currencydefault` varchar(4) NOT NULL DEFAULT '',
  `debtorsact` varchar(20) NOT NULL DEFAULT '70000',
  `pytdiscountact` varchar(20) NOT NULL DEFAULT '55000',
  `creditorsact` varchar(20) NOT NULL DEFAULT '80000',
  `payrollact` varchar(20) NOT NULL DEFAULT '84000',
  `grnact` varchar(20) NOT NULL DEFAULT '72000',
  `exchangediffact` varchar(20) NOT NULL DEFAULT '65000',
  `purchasesexchangediffact` varchar(20) NOT NULL DEFAULT '0',
  `retainedearnings` varchar(20) NOT NULL DEFAULT '90000',
  `gllink_debtors` tinyint(1) DEFAULT '1',
  `gllink_creditors` tinyint(1) DEFAULT '1',
  `gllink_stock` tinyint(1) DEFAULT '1',
  `freightact` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coycode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `config` (
  `confname` varchar(35) NOT NULL DEFAULT '',
  `confvalue` text NOT NULL,
  PRIMARY KEY (`confname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `container` (
  `id` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `location` varchar(5) NOT NULL DEFAULT '',
  `parentid` varchar(10) NOT NULL DEFAULT '',
  `xcoord` int(11) NOT NULL DEFAULT '1',
  `ycoord` int(11) NOT NULL DEFAULT '1',
  `zcoord` int(11) NOT NULL DEFAULT '1',
  `width` int(11) NOT NULL DEFAULT '1',
  `length` int(11) NOT NULL DEFAULT '1',
  `height` int(11) NOT NULL DEFAULT '1',
  `sequence` int(11) NOT NULL DEFAULT '0',
  `putaway` tinyint(1) NOT NULL DEFAULT '0',
  `picking` tinyint(1) NOT NULL DEFAULT '0',
  `replenishment` tinyint(1) NOT NULL DEFAULT '0',
  `quarantine` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `container_ibfk_1` (`location`),
  CONSTRAINT `container_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `contractbom` (
  `contractref` varchar(20) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `workcentreadded` char(5) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`contractref`,`stockid`,`workcentreadded`),
  KEY `Stockid` (`stockid`),
  KEY `ContractRef` (`contractref`),
  KEY `WorkCentreAdded` (`workcentreadded`),
  CONSTRAINT `contractbom_ibfk_1` FOREIGN KEY (`workcentreadded`) REFERENCES `workcentres` (`code`),
  CONSTRAINT `contractbom_ibfk_3` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `contractcharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractref` varchar(20) NOT NULL,
  `transtype` smallint(6) NOT NULL DEFAULT '20',
  `transno` int(11) NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `narrative` text NOT NULL,
  `anticipated` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `contractref` (`contractref`,`transtype`,`transno`),
  KEY `contractcharges_ibfk_2` (`transtype`),
  CONSTRAINT `contractcharges_ibfk_1` FOREIGN KEY (`contractref`) REFERENCES `contracts` (`contractref`),
  CONSTRAINT `contractcharges_ibfk_2` FOREIGN KEY (`transtype`) REFERENCES `systypes` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `contractreqts` (
  `contractreqid` int(11) NOT NULL AUTO_INCREMENT,
  `contractref` varchar(20) NOT NULL DEFAULT '0',
  `requirement` varchar(40) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1',
  `costperunit` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`contractreqid`),
  KEY `ContractRef` (`contractref`),
  CONSTRAINT `contractreqts_ibfk_1` FOREIGN KEY (`contractref`) REFERENCES `contracts` (`contractref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `contracts` (
  `contractref` varchar(20) NOT NULL DEFAULT '',
  `contractdescription` text NOT NULL,
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `categoryid` varchar(6) NOT NULL DEFAULT '',
  `orderno` int(11) NOT NULL DEFAULT '0',
  `customerref` varchar(20) NOT NULL DEFAULT '',
  `margin` double NOT NULL DEFAULT '1',
  `wo` int(11) NOT NULL DEFAULT '0',
  `requireddate` date NOT NULL DEFAULT '0000-00-00',
  `drawing` varchar(50) NOT NULL DEFAULT '',
  `exrate` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`contractref`),
  KEY `OrderNo` (`orderno`),
  KEY `CategoryID` (`categoryid`),
  KEY `Status` (`status`),
  KEY `WO` (`wo`),
  KEY `loccode` (`loccode`),
  KEY `DebtorNo` (`debtorno`,`branchcode`),
  CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`debtorno`, `branchcode`) REFERENCES `custbranch` (`debtorno`, `branchcode`),
  CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`categoryid`) REFERENCES `stockcategory` (`categoryid`),
  CONSTRAINT `contracts_ibfk_3` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `currencies` (
  `currency` char(20) NOT NULL DEFAULT '',
  `currabrev` char(3) NOT NULL DEFAULT '',
  `country` char(50) NOT NULL DEFAULT '',
  `hundredsname` char(15) NOT NULL DEFAULT 'Cents',
  `decimalplaces` tinyint(3) NOT NULL DEFAULT '2',
  `rate` double NOT NULL DEFAULT '1',
  `webcart` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`currabrev`),
  KEY `Country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `custallocns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amt` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `datealloc` date NOT NULL DEFAULT '0000-00-00',
  `transid_allocfrom` int(11) NOT NULL DEFAULT '0',
  `transid_allocto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `DateAlloc` (`datealloc`),
  KEY `TransID_AllocFrom` (`transid_allocfrom`),
  KEY `TransID_AllocTo` (`transid_allocto`),
  CONSTRAINT `custallocns_ibfk_1` FOREIGN KEY (`transid_allocfrom`) REFERENCES `debtortrans` (`id`),
  CONSTRAINT `custallocns_ibfk_2` FOREIGN KEY (`transid_allocto`) REFERENCES `debtortrans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `custbranch` (
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `brname` varchar(40) NOT NULL DEFAULT '',
  `braddress1` varchar(40) NOT NULL DEFAULT '',
  `braddress2` varchar(40) NOT NULL DEFAULT '',
  `braddress3` varchar(40) NOT NULL DEFAULT '',
  `braddress4` varchar(50) NOT NULL DEFAULT '',
  `braddress5` varchar(20) NOT NULL DEFAULT '',
  `braddress6` varchar(40) NOT NULL,
  `lat` float(10,6) NOT NULL DEFAULT '0.000000',
  `lng` float(10,6) NOT NULL DEFAULT '0.000000',
  `estdeliverydays` smallint(6) NOT NULL DEFAULT '1',
  `area` char(3) NOT NULL,
  `salesman` varchar(4) NOT NULL DEFAULT '',
  `fwddate` smallint(6) NOT NULL DEFAULT '0',
  `phoneno` varchar(20) NOT NULL DEFAULT '',
  `faxno` varchar(20) NOT NULL DEFAULT '',
  `contactname` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  `defaultlocation` varchar(5) NOT NULL DEFAULT '',
  `taxgroupid` tinyint(4) NOT NULL DEFAULT '1',
  `defaultshipvia` int(11) NOT NULL DEFAULT '1',
  `deliverblind` tinyint(1) DEFAULT '1',
  `disabletrans` tinyint(4) NOT NULL DEFAULT '0',
  `brpostaddr1` varchar(40) NOT NULL DEFAULT '',
  `brpostaddr2` varchar(40) NOT NULL DEFAULT '',
  `brpostaddr3` varchar(40) NOT NULL,
  `brpostaddr4` varchar(50) NOT NULL,
  `brpostaddr5` varchar(20) NOT NULL DEFAULT '',
  `brpostaddr` varchar(15) NOT NULL DEFAULT '',
  `brpostaddr6` varchar(40) NOT NULL,
  `specialinstructions` text NOT NULL,
  `custbranchcode` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`branchcode`,`debtorno`),
  KEY `BrName` (`brname`),
  KEY `DebtorNo` (`debtorno`),
  KEY `Salesman` (`salesman`),
  KEY `Area` (`area`),
  KEY `DefaultLocation` (`defaultlocation`),
  KEY `DefaultShipVia` (`defaultshipvia`),
  KEY `taxgroupid` (`taxgroupid`),
  CONSTRAINT `custbranch_ibfk_1` FOREIGN KEY (`debtorno`) REFERENCES `debtorsmaster` (`debtorno`),
  CONSTRAINT `custbranch_ibfk_2` FOREIGN KEY (`area`) REFERENCES `areas` (`areacode`),
  CONSTRAINT `custbranch_ibfk_3` FOREIGN KEY (`salesman`) REFERENCES `salesman` (`salesmancode`),
  CONSTRAINT `custbranch_ibfk_4` FOREIGN KEY (`defaultlocation`) REFERENCES `locations` (`loccode`),
  CONSTRAINT `custbranch_ibfk_6` FOREIGN KEY (`defaultshipvia`) REFERENCES `shippers` (`shipper_id`),
  CONSTRAINT `custbranch_ibfk_7` FOREIGN KEY (`taxgroupid`) REFERENCES `taxgroups` (`taxgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `custcontacts` (
  `contid` int(11) NOT NULL AUTO_INCREMENT,
  `debtorno` varchar(10) NOT NULL,
  `contactname` varchar(40) NOT NULL,
  `role` varchar(40) NOT NULL,
  `phoneno` varchar(20) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `email` varchar(55) NOT NULL,
  PRIMARY KEY (`contid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `custitem` (
  `debtorno` char(10) NOT NULL DEFAULT '',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `cust_part` varchar(20) NOT NULL DEFAULT '',
  `cust_description` varchar(30) NOT NULL DEFAULT '',
  `customersuom` char(50) NOT NULL DEFAULT '',
  `conversionfactor` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`debtorno`,`stockid`),
  KEY `StockID` (`stockid`),
  KEY `Debtorno` (`debtorno`),
  CONSTRAINT ` custitem _ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT ` custitem _ibfk_2` FOREIGN KEY (`debtorno`) REFERENCES `debtorsmaster` (`debtorno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `custnotes` (
  `noteid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `debtorno` varchar(10) NOT NULL DEFAULT '0',
  `href` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `priority` varchar(20) NOT NULL,
  PRIMARY KEY (`noteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dashboard_scripts` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `scripts` varchar(78) NOT NULL,
  `pagesecurity` int(11) NOT NULL DEFAULT '1',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dashboard_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) NOT NULL,
  `scripts` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `debtorsmaster` (
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(40) NOT NULL DEFAULT '',
  `address1` varchar(40) NOT NULL DEFAULT '',
  `address2` varchar(40) NOT NULL DEFAULT '',
  `address3` varchar(40) NOT NULL DEFAULT '',
  `address4` varchar(50) NOT NULL DEFAULT '',
  `address5` varchar(20) NOT NULL DEFAULT '',
  `address6` varchar(40) NOT NULL,
  `currcode` char(3) NOT NULL DEFAULT '',
  `salestype` char(2) NOT NULL DEFAULT '',
  `clientsince` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `holdreason` smallint(6) NOT NULL DEFAULT '0',
  `paymentterms` char(2) NOT NULL DEFAULT 'f',
  `discount` double NOT NULL DEFAULT '0',
  `pymtdiscount` double NOT NULL DEFAULT '0',
  `lastpaid` double NOT NULL DEFAULT '0',
  `lastpaiddate` datetime DEFAULT NULL,
  `creditlimit` double NOT NULL DEFAULT '1000',
  `invaddrbranch` tinyint(4) NOT NULL DEFAULT '0',
  `discountcode` char(2) NOT NULL DEFAULT '',
  `ediinvoices` tinyint(4) NOT NULL DEFAULT '0',
  `ediorders` tinyint(4) NOT NULL DEFAULT '0',
  `edireference` varchar(20) NOT NULL DEFAULT '',
  `editransport` varchar(5) NOT NULL DEFAULT 'email',
  `ediaddress` varchar(50) NOT NULL DEFAULT '',
  `ediserveruser` varchar(20) NOT NULL DEFAULT '',
  `ediserverpwd` varchar(20) NOT NULL DEFAULT '',
  `taxref` varchar(20) NOT NULL DEFAULT '',
  `customerpoline` tinyint(1) NOT NULL DEFAULT '0',
  `typeid` tinyint(4) NOT NULL DEFAULT '1',
  `language_id` varchar(10) NOT NULL DEFAULT 'en_GB.utf8',
  PRIMARY KEY (`debtorno`),
  KEY `Currency` (`currcode`),
  KEY `HoldReason` (`holdreason`),
  KEY `Name` (`name`),
  KEY `PaymentTerms` (`paymentterms`),
  KEY `SalesType` (`salestype`),
  KEY `EDIInvoices` (`ediinvoices`),
  KEY `EDIOrders` (`ediorders`),
  KEY `debtorsmaster_ibfk_5` (`typeid`),
  CONSTRAINT `debtorsmaster_ibfk_1` FOREIGN KEY (`holdreason`) REFERENCES `holdreasons` (`reasoncode`),
  CONSTRAINT `debtorsmaster_ibfk_2` FOREIGN KEY (`currcode`) REFERENCES `currencies` (`currabrev`),
  CONSTRAINT `debtorsmaster_ibfk_3` FOREIGN KEY (`paymentterms`) REFERENCES `paymentterms` (`termsindicator`),
  CONSTRAINT `debtorsmaster_ibfk_4` FOREIGN KEY (`salestype`) REFERENCES `salestypes` (`typeabbrev`),
  CONSTRAINT `debtorsmaster_ibfk_5` FOREIGN KEY (`typeid`) REFERENCES `debtortype` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `debtortrans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transno` int(11) NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `trandate` date NOT NULL DEFAULT '0000-00-00',
  `inputdate` datetime NOT NULL,
  `prd` smallint(6) NOT NULL DEFAULT '0',
  `settled` tinyint(4) NOT NULL DEFAULT '0',
  `reference` varchar(20) NOT NULL DEFAULT '',
  `tpe` char(2) NOT NULL DEFAULT '',
  `order_` int(11) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  `ovamount` double NOT NULL DEFAULT '0',
  `ovgst` double NOT NULL DEFAULT '0',
  `ovfreight` double NOT NULL DEFAULT '0',
  `ovdiscount` double NOT NULL DEFAULT '0',
  `diffonexch` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `invtext` text,
  `shipvia` int(11) NOT NULL DEFAULT '0',
  `edisent` tinyint(4) NOT NULL DEFAULT '0',
  `consignment` varchar(20) NOT NULL DEFAULT '',
  `packages` int(11) NOT NULL DEFAULT '1',
  `salesperson` varchar(4) NOT NULL DEFAULT 'DE',
  PRIMARY KEY (`id`),
  KEY `DebtorNo` (`debtorno`,`branchcode`),
  KEY `Order_` (`order_`),
  KEY `Prd` (`prd`),
  KEY `Tpe` (`tpe`),
  KEY `Type` (`type`),
  KEY `Settled` (`settled`),
  KEY `TranDate` (`trandate`),
  KEY `TransNo` (`transno`),
  KEY `Type_2` (`type`,`transno`),
  KEY `EDISent` (`edisent`),
  KEY `salesperson` (`salesperson`),
  CONSTRAINT `debtortrans_ibfk_2` FOREIGN KEY (`type`) REFERENCES `systypes` (`typeid`),
  CONSTRAINT `debtortrans_ibfk_3` FOREIGN KEY (`prd`) REFERENCES `periods` (`periodno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `debtortranstaxes` (
  `debtortransid` int(11) NOT NULL DEFAULT '0',
  `taxauthid` tinyint(4) NOT NULL DEFAULT '0',
  `taxamount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`debtortransid`,`taxauthid`),
  KEY `taxauthid` (`taxauthid`),
  CONSTRAINT `debtortranstaxes_ibfk_1` FOREIGN KEY (`taxauthid`) REFERENCES `taxauthorities` (`taxid`),
  CONSTRAINT `debtortranstaxes_ibfk_2` FOREIGN KEY (`debtortransid`) REFERENCES `debtortrans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `debtortype` (
  `typeid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `debtortypenotes` (
  `noteid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `typeid` tinyint(4) NOT NULL DEFAULT '0',
  `href` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `priority` varchar(20) NOT NULL,
  PRIMARY KEY (`noteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `deliverynotes` (
  `deliverynotenumber` int(11) NOT NULL,
  `deliverynotelineno` tinyint(4) NOT NULL,
  `salesorderno` int(11) NOT NULL,
  `salesorderlineno` int(11) NOT NULL,
  `qtydelivered` double NOT NULL DEFAULT '0',
  `printed` tinyint(4) NOT NULL DEFAULT '0',
  `invoiced` tinyint(4) NOT NULL DEFAULT '0',
  `deliverydate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`deliverynotenumber`,`deliverynotelineno`),
  KEY `deliverynotes_ibfk_2` (`salesorderno`,`salesorderlineno`),
  CONSTRAINT `deliverynotes_ibfk_1` FOREIGN KEY (`salesorderno`) REFERENCES `salesorders` (`orderno`),
  CONSTRAINT `deliverynotes_ibfk_2` FOREIGN KEY (`salesorderno`, `salesorderlineno`) REFERENCES `salesorderdetails` (`orderno`, `orderlineno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `departments` (
  `departmentid` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  `authoriser` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `discountmatrix` (
  `salestype` char(2) NOT NULL DEFAULT '',
  `discountcategory` char(2) NOT NULL DEFAULT '',
  `quantitybreak` int(11) NOT NULL DEFAULT '1',
  `discountrate` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`salestype`,`discountcategory`,`quantitybreak`),
  KEY `QuantityBreak` (`quantitybreak`),
  KEY `DiscountCategory` (`discountcategory`),
  KEY `SalesType` (`salestype`),
  CONSTRAINT `discountmatrix_ibfk_1` FOREIGN KEY (`salestype`) REFERENCES `salestypes` (`typeabbrev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `edi_orders_seg_groups` (
  `seggroupno` tinyint(4) NOT NULL DEFAULT '0',
  `maxoccur` int(4) NOT NULL DEFAULT '0',
  `parentseggroup` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seggroupno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `edi_orders_segs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `segtag` char(3) NOT NULL DEFAULT '',
  `seggroup` tinyint(4) NOT NULL DEFAULT '0',
  `maxoccur` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `SegTag` (`segtag`),
  KEY `SegNo` (`seggroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ediitemmapping` (
  `supporcust` varchar(4) NOT NULL DEFAULT '',
  `partnercode` varchar(10) NOT NULL DEFAULT '',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `partnerstockid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`supporcust`,`partnercode`,`stockid`),
  KEY `PartnerCode` (`partnercode`),
  KEY `StockID` (`stockid`),
  KEY `PartnerStockID` (`partnerstockid`),
  KEY `SuppOrCust` (`supporcust`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `edimessageformat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partnercode` varchar(10) NOT NULL DEFAULT '',
  `messagetype` varchar(6) NOT NULL DEFAULT '',
  `section` varchar(7) NOT NULL DEFAULT '',
  `sequenceno` int(11) NOT NULL DEFAULT '0',
  `linetext` varchar(70) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `PartnerCode` (`partnercode`,`messagetype`,`sequenceno`),
  KEY `Section` (`section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `emailsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(50) NOT NULL DEFAULT '',
  `port` char(5) NOT NULL,
  `heloaddress` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `timeout` int(11) DEFAULT '5',
  `companyname` varchar(50) DEFAULT NULL,
  `auth` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `factorcompanies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coyname` varchar(50) NOT NULL DEFAULT '',
  `address1` varchar(40) NOT NULL DEFAULT '',
  `address2` varchar(40) NOT NULL DEFAULT '',
  `address3` varchar(40) NOT NULL DEFAULT '',
  `address4` varchar(40) NOT NULL DEFAULT '',
  `address5` varchar(20) NOT NULL DEFAULT '',
  `address6` varchar(15) NOT NULL DEFAULT '',
  `contact` varchar(25) NOT NULL DEFAULT '',
  `telephone` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(25) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `factor_name` (`coyname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `favourites` (
  `userid` varchar(20) NOT NULL DEFAULT '',
  `caption` varchar(50) NOT NULL DEFAULT '',
  `href` varchar(200) NOT NULL DEFAULT '#',
  PRIMARY KEY (`userid`,`caption`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fixedassetcategories` (
  `categoryid` char(6) NOT NULL DEFAULT '',
  `categorydescription` char(20) NOT NULL DEFAULT '',
  `costact` varchar(20) NOT NULL DEFAULT '0',
  `depnact` varchar(20) NOT NULL DEFAULT '0',
  `disposalact` varchar(20) NOT NULL DEFAULT '80000',
  `accumdepnact` varchar(20) NOT NULL DEFAULT '0',
  `defaultdepnrate` double NOT NULL DEFAULT '0.2',
  `defaultdepntype` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fixedassetlocations` (
  `locationid` char(6) NOT NULL DEFAULT '',
  `locationdescription` char(20) NOT NULL DEFAULT '',
  `parentlocationid` char(6) DEFAULT '',
  PRIMARY KEY (`locationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fixedassets` (
  `assetid` int(11) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(30) NOT NULL DEFAULT '',
  `barcode` varchar(20) NOT NULL,
  `assetlocation` varchar(6) NOT NULL DEFAULT '',
  `cost` double NOT NULL DEFAULT '0',
  `accumdepn` double NOT NULL DEFAULT '0',
  `datepurchased` date NOT NULL DEFAULT '0000-00-00',
  `disposalproceeds` double NOT NULL DEFAULT '0',
  `assetcategoryid` varchar(6) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `longdescription` text NOT NULL,
  `depntype` int(11) NOT NULL DEFAULT '1',
  `depnrate` double NOT NULL,
  `disposaldate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`assetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fixedassettasks` (
  `taskid` int(11) NOT NULL AUTO_INCREMENT,
  `assetid` int(11) NOT NULL,
  `taskdescription` text NOT NULL,
  `frequencydays` int(11) NOT NULL DEFAULT '365',
  `lastcompleted` date NOT NULL,
  `userresponsible` varchar(20) NOT NULL,
  `manager` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`taskid`),
  KEY `assetid` (`assetid`),
  KEY `userresponsible` (`userresponsible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fixedassettrans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetid` int(11) NOT NULL,
  `transtype` tinyint(4) NOT NULL,
  `transdate` date NOT NULL,
  `transno` int(11) NOT NULL,
  `periodno` smallint(6) NOT NULL,
  `inputdate` date NOT NULL,
  `fixedassettranstype` varchar(8) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assetid` (`assetid`,`transtype`,`transno`),
  KEY `inputdate` (`inputdate`),
  KEY `transdate` (`transdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `freightcosts` (
  `shipcostfromid` int(11) NOT NULL AUTO_INCREMENT,
  `locationfrom` varchar(5) NOT NULL DEFAULT '',
  `destinationcountry` varchar(40) NOT NULL DEFAULT '',
  `destination` varchar(40) NOT NULL DEFAULT '',
  `shipperid` int(11) NOT NULL DEFAULT '0',
  `cubrate` double NOT NULL DEFAULT '0',
  `kgrate` double NOT NULL DEFAULT '0',
  `maxkgs` double NOT NULL DEFAULT '999999',
  `maxcub` double NOT NULL DEFAULT '999999',
  `fixedprice` double NOT NULL DEFAULT '0',
  `minimumchg` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipcostfromid`),
  KEY `Destination` (`destination`),
  KEY `LocationFrom` (`locationfrom`),
  KEY `ShipperID` (`shipperid`),
  KEY `Destination_2` (`destination`,`locationfrom`,`shipperid`),
  CONSTRAINT `freightcosts_ibfk_1` FOREIGN KEY (`locationfrom`) REFERENCES `locations` (`loccode`),
  CONSTRAINT `freightcosts_ibfk_2` FOREIGN KEY (`shipperid`) REFERENCES `shippers` (`shipper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `geocode_param` (
  `geocodeid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `geocode_key` varchar(200) NOT NULL DEFAULT '',
  `center_long` varchar(20) NOT NULL DEFAULT '',
  `center_lat` varchar(20) NOT NULL DEFAULT '',
  `map_height` varchar(10) NOT NULL DEFAULT '',
  `map_width` varchar(10) NOT NULL DEFAULT '',
  `map_host` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`geocodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gltrans` (
  `counterindex` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `typeno` bigint(16) NOT NULL DEFAULT '1',
  `chequeno` int(11) NOT NULL DEFAULT '0',
  `trandate` date NOT NULL DEFAULT '0000-00-00',
  `periodno` smallint(6) NOT NULL DEFAULT '0',
  `account` varchar(20) NOT NULL DEFAULT '0',
  `narrative` varchar(200) NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `posted` tinyint(4) NOT NULL DEFAULT '0',
  `jobref` varchar(20) NOT NULL DEFAULT '',
  `tag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`counterindex`),
  KEY `Account` (`account`),
  KEY `ChequeNo` (`chequeno`),
  KEY `PeriodNo` (`periodno`),
  KEY `Posted` (`posted`),
  KEY `TranDate` (`trandate`),
  KEY `TypeNo` (`typeno`),
  KEY `Type_and_Number` (`type`,`typeno`),
  KEY `JobRef` (`jobref`),
  CONSTRAINT `gltrans_ibfk_1` FOREIGN KEY (`account`) REFERENCES `chartmaster` (`accountcode`),
  CONSTRAINT `gltrans_ibfk_2` FOREIGN KEY (`type`) REFERENCES `systypes` (`typeid`),
  CONSTRAINT `gltrans_ibfk_3` FOREIGN KEY (`periodno`) REFERENCES `periods` (`periodno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `grns` (
  `grnbatch` smallint(6) NOT NULL DEFAULT '0',
  `grnno` int(11) NOT NULL AUTO_INCREMENT,
  `podetailitem` int(11) NOT NULL DEFAULT '0',
  `itemcode` varchar(20) NOT NULL DEFAULT '',
  `deliverydate` date NOT NULL DEFAULT '0000-00-00',
  `itemdescription` varchar(100) NOT NULL DEFAULT '',
  `qtyrecd` double NOT NULL DEFAULT '0',
  `quantityinv` double NOT NULL DEFAULT '0',
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `stdcostunit` double NOT NULL DEFAULT '0',
  `reference` varchar(50) NOT NULL DEFAULT '""',
  PRIMARY KEY (`grnno`),
  KEY `DeliveryDate` (`deliverydate`),
  KEY `ItemCode` (`itemcode`),
  KEY `PODetailItem` (`podetailitem`),
  KEY `SupplierID` (`supplierid`),
  CONSTRAINT `grns_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `suppliers` (`supplierid`),
  CONSTRAINT `grns_ibfk_2` FOREIGN KEY (`podetailitem`) REFERENCES `purchorderdetails` (`podetailitem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `holdreasons` (
  `reasoncode` smallint(6) NOT NULL DEFAULT '1',
  `reasondescription` char(30) NOT NULL DEFAULT '',
  `dissallowinvoices` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`reasoncode`),
  KEY `ReasonDescription` (`reasondescription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `internalstockcatrole` (
  `categoryid` varchar(6) NOT NULL,
  `secroleid` int(11) NOT NULL,
  PRIMARY KEY (`categoryid`,`secroleid`),
  KEY `internalstockcatrole_ibfk_1` (`categoryid`),
  KEY `internalstockcatrole_ibfk_2` (`secroleid`),
  CONSTRAINT `internalstockcatrole_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `stockcategory` (`categoryid`),
  CONSTRAINT `internalstockcatrole_ibfk_2` FOREIGN KEY (`secroleid`) REFERENCES `securityroles` (`secroleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `jobcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debtorno` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `task1` varchar(500) DEFAULT NULL,
  `task2` varchar(500) DEFAULT NULL,
  `task3` varchar(500) DEFAULT NULL,
  `task4` varchar(500) DEFAULT NULL,
  `task5` varchar(500) DEFAULT NULL,
  `task6` varchar(500) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `completedate` date DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `labelfields` (
  `labelfieldid` int(11) NOT NULL AUTO_INCREMENT,
  `labelid` tinyint(4) NOT NULL,
  `fieldvalue` varchar(20) NOT NULL,
  `vpos` double NOT NULL DEFAULT '0',
  `hpos` double NOT NULL DEFAULT '0',
  `fontsize` tinyint(4) NOT NULL,
  `barcode` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`labelfieldid`),
  KEY `labelid` (`labelid`),
  KEY `vpos` (`vpos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `labels` (
  `labelid` tinyint(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `pagewidth` double NOT NULL DEFAULT '0',
  `pageheight` double NOT NULL DEFAULT '0',
  `height` double NOT NULL DEFAULT '0',
  `width` double NOT NULL DEFAULT '0',
  `topmargin` double NOT NULL DEFAULT '0',
  `leftmargin` double NOT NULL DEFAULT '0',
  `rowheight` double NOT NULL DEFAULT '0',
  `columnwidth` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`labelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `lastcostrollup` (
  `stockid` char(20) NOT NULL DEFAULT '',
  `totalonhand` double NOT NULL DEFAULT '0',
  `matcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `labcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `oheadcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `categoryid` char(6) NOT NULL DEFAULT '',
  `stockact` varchar(20) NOT NULL DEFAULT '0',
  `adjglact` varchar(20) NOT NULL DEFAULT '0',
  `newmatcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `newlabcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `newoheadcost` decimal(20,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `locations` (
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `locationname` varchar(50) NOT NULL DEFAULT '',
  `deladd1` varchar(40) NOT NULL DEFAULT '',
  `deladd2` varchar(40) NOT NULL DEFAULT '',
  `deladd3` varchar(40) NOT NULL DEFAULT '',
  `deladd4` varchar(40) NOT NULL DEFAULT '',
  `deladd5` varchar(20) NOT NULL DEFAULT '',
  `deladd6` varchar(15) NOT NULL DEFAULT '',
  `tel` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  `taxprovinceid` tinyint(4) NOT NULL DEFAULT '1',
  `cashsalecustomer` varchar(10) NOT NULL,
  `managed` int(11) DEFAULT '0',
  `cashsalebranch` varchar(10) DEFAULT '',
  `internalrequest` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Allow (1) or not (0) internal request from this location',
  `usedforwo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`loccode`),
  UNIQUE KEY `locationname` (`locationname`),
  KEY `taxprovinceid` (`taxprovinceid`),
  CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`taxprovinceid`) REFERENCES `taxprovinces` (`taxprovinceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `locationusers` (
  `loccode` varchar(5) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `canview` tinyint(4) NOT NULL DEFAULT '0',
  `canupd` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loccode`,`userid`),
  KEY `UserId` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `locstock` (
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '0',
  `reorderlevel` bigint(20) NOT NULL DEFAULT '0',
  `bin` varchar(10) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`loccode`,`stockid`),
  KEY `StockID` (`stockid`),
  CONSTRAINT `locstock_ibfk_1` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`),
  CONSTRAINT `locstock_ibfk_2` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `loctransfers` (
  `reference` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `shipqty` double NOT NULL DEFAULT '0',
  `recqty` double NOT NULL DEFAULT '0',
  `shipdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shiploc` varchar(7) NOT NULL DEFAULT '',
  `recloc` varchar(7) NOT NULL DEFAULT '',
  KEY `Reference` (`reference`,`stockid`),
  KEY `ShipLoc` (`shiploc`),
  KEY `RecLoc` (`recloc`),
  KEY `StockID` (`stockid`),
  CONSTRAINT `loctransfers_ibfk_1` FOREIGN KEY (`shiploc`) REFERENCES `locations` (`loccode`),
  CONSTRAINT `loctransfers_ibfk_2` FOREIGN KEY (`recloc`) REFERENCES `locations` (`loccode`),
  CONSTRAINT `loctransfers_ibfk_3` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Shipments To And From Locations';

CREATE TABLE `mailgroupdetails` (
  `groupname` varchar(100) NOT NULL,
  `userid` varchar(20) NOT NULL,
  KEY `userid` (`userid`),
  KEY `groupname` (`groupname`),
  CONSTRAINT `mailgroupdetails_ibfk_1` FOREIGN KEY (`groupname`) REFERENCES `mailgroups` (`groupname`),
  CONSTRAINT `mailgroupdetails_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `www_users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mailgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupname` (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL,
  `manufacturers_url` varchar(50) NOT NULL DEFAULT '',
  `manufacturers_image` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `manufacturers_name` (`manufacturers_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menuitems` (
  `secroleid` int(11) NOT NULL DEFAULT '8',
  `modulelink` varchar(10) NOT NULL DEFAULT '',
  `menusection` varchar(15) NOT NULL DEFAULT '',
  `caption` varchar(60) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `sequence` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`secroleid`,`modulelink`,`menusection`,`caption`),
  CONSTRAINT `menuitems_ibfk_1` FOREIGN KEY (`secroleid`) REFERENCES `securityroles` (`secroleid`),
  CONSTRAINT `menuitems_ibfk_2` FOREIGN KEY (`secroleid`, `modulelink`) REFERENCES `modules` (`secroleid`, `modulelink`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `modules` (
  `secroleid` int(11) NOT NULL DEFAULT '8',
  `modulelink` varchar(10) NOT NULL DEFAULT '',
  `reportlink` varchar(4) NOT NULL DEFAULT '',
  `modulename` varchar(25) NOT NULL DEFAULT '',
  `sequence` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`secroleid`,`modulelink`),
  CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`secroleid`) REFERENCES `securityroles` (`secroleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mrpdemands` (
  `demandid` int(11) NOT NULL AUTO_INCREMENT,
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `mrpdemandtype` varchar(6) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '0',
  `duedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`demandid`),
  KEY `StockID` (`stockid`),
  KEY `mrpdemands_ibfk_1` (`mrpdemandtype`),
  CONSTRAINT `mrpdemands_ibfk_1` FOREIGN KEY (`mrpdemandtype`) REFERENCES `mrpdemandtypes` (`mrpdemandtype`),
  CONSTRAINT `mrpdemands_ibfk_2` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mrpdemandtypes` (
  `mrpdemandtype` varchar(6) NOT NULL DEFAULT '',
  `description` char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`mrpdemandtype`),
  KEY `mrpdemandtype` (`mrpdemandtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `offers` (
  `offerid` int(11) NOT NULL AUTO_INCREMENT,
  `tenderid` int(11) NOT NULL DEFAULT '0',
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '0',
  `uom` varchar(15) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `expirydate` date NOT NULL DEFAULT '0000-00-00',
  `currcode` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`offerid`),
  KEY `offers_ibfk_1` (`supplierid`),
  KEY `offers_ibfk_2` (`stockid`),
  CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `suppliers` (`supplierid`),
  CONSTRAINT `offers_ibfk_2` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `orderdeliverydifferenceslog` (
  `orderno` int(11) NOT NULL DEFAULT '0',
  `invoiceno` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantitydiff` double NOT NULL DEFAULT '0',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branch` varchar(10) NOT NULL DEFAULT '',
  `can_or_bo` char(3) NOT NULL DEFAULT 'CAN',
  KEY `StockID` (`stockid`),
  KEY `DebtorNo` (`debtorno`,`branch`),
  KEY `Can_or_BO` (`can_or_bo`),
  KEY `OrderNo` (`orderno`),
  CONSTRAINT `orderdeliverydifferenceslog_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `orderdeliverydifferenceslog_ibfk_2` FOREIGN KEY (`debtorno`, `branch`) REFERENCES `custbranch` (`debtorno`, `branchcode`),
  CONSTRAINT `orderdeliverydifferenceslog_ibfk_3` FOREIGN KEY (`orderno`) REFERENCES `salesorders` (`orderno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `paymentmethods` (
  `paymentid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `paymentname` varchar(15) NOT NULL DEFAULT '',
  `paymenttype` int(11) NOT NULL DEFAULT '1',
  `receipttype` int(11) NOT NULL DEFAULT '1',
  `usepreprintedstationery` tinyint(4) NOT NULL DEFAULT '0',
  `opencashdrawer` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `paymentterms` (
  `termsindicator` char(2) NOT NULL DEFAULT '',
  `terms` char(40) NOT NULL DEFAULT '',
  `daysbeforedue` smallint(6) NOT NULL DEFAULT '0',
  `dayinfollowingmonth` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`termsindicator`),
  KEY `DaysBeforeDue` (`daysbeforedue`),
  KEY `DayInFollowingMonth` (`dayinfollowingmonth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pcashdetails` (
  `counterindex` int(20) NOT NULL AUTO_INCREMENT,
  `tabcode` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `codeexpense` varchar(20) NOT NULL,
  `amount` double NOT NULL,
  `authorized` date NOT NULL COMMENT 'date cash assigment was revised and authorized by authorizer from tabs table',
  `posted` tinyint(4) NOT NULL COMMENT 'has (or has not) been posted into gltrans',
  `notes` text NOT NULL,
  `receipt` text COMMENT 'filename or path to scanned receipt or code of receipt to find physical receipt if tax guys or auditors show up',
  PRIMARY KEY (`counterindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pcexpenses` (
  `codeexpense` varchar(20) NOT NULL COMMENT 'code for the group',
  `description` varchar(50) NOT NULL COMMENT 'text description, e.g. meals, train tickets, fuel, etc',
  `glaccount` varchar(20) NOT NULL DEFAULT '0',
  `tag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codeexpense`),
  KEY `glaccount` (`glaccount`),
  CONSTRAINT `pcexpenses_ibfk_1` FOREIGN KEY (`glaccount`) REFERENCES `chartmaster` (`accountcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pctabexpenses` (
  `typetabcode` varchar(20) NOT NULL,
  `codeexpense` varchar(20) NOT NULL,
  KEY `typetabcode` (`typetabcode`),
  KEY `codeexpense` (`codeexpense`),
  CONSTRAINT `pctabexpenses_ibfk_1` FOREIGN KEY (`typetabcode`) REFERENCES `pctypetabs` (`typetabcode`),
  CONSTRAINT `pctabexpenses_ibfk_2` FOREIGN KEY (`codeexpense`) REFERENCES `pcexpenses` (`codeexpense`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pctabs` (
  `tabcode` varchar(20) NOT NULL,
  `usercode` varchar(20) NOT NULL COMMENT 'code of user employee from www_users',
  `typetabcode` varchar(20) NOT NULL,
  `currency` char(3) NOT NULL,
  `tablimit` double NOT NULL,
  `assigner` varchar(20) NOT NULL COMMENT 'Cash assigner for the tab',
  `authorizer` varchar(20) NOT NULL COMMENT 'code of user from www_users',
  `authorizerexpenses` varchar(20) NOT NULL DEFAULT '""',
  `glaccountassignment` varchar(20) NOT NULL DEFAULT '0',
  `glaccountpcash` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tabcode`),
  KEY `usercode` (`usercode`),
  KEY `typetabcode` (`typetabcode`),
  KEY `currency` (`currency`),
  KEY `authorizer` (`authorizer`),
  KEY `glaccountassignment` (`glaccountassignment`),
  CONSTRAINT `pctabs_ibfk_1` FOREIGN KEY (`usercode`) REFERENCES `www_users` (`userid`),
  CONSTRAINT `pctabs_ibfk_2` FOREIGN KEY (`typetabcode`) REFERENCES `pctypetabs` (`typetabcode`),
  CONSTRAINT `pctabs_ibfk_3` FOREIGN KEY (`currency`) REFERENCES `currencies` (`currabrev`),
  CONSTRAINT `pctabs_ibfk_4` FOREIGN KEY (`authorizer`) REFERENCES `www_users` (`userid`),
  CONSTRAINT `pctabs_ibfk_5` FOREIGN KEY (`glaccountassignment`) REFERENCES `chartmaster` (`accountcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pctypetabs` (
  `typetabcode` varchar(20) NOT NULL COMMENT 'code for the type of petty cash tab',
  `typetabdescription` varchar(50) NOT NULL COMMENT 'text description, e.g. tab for CEO',
  PRIMARY KEY (`typetabcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `periods` (
  `periodno` smallint(6) NOT NULL DEFAULT '0',
  `lastdate_in_period` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`periodno`),
  KEY `LastDate_in_Period` (`lastdate_in_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pickinglistdetails` (
  `pickinglistno` int(11) NOT NULL DEFAULT '0',
  `pickinglistlineno` int(11) NOT NULL DEFAULT '0',
  `orderlineno` int(11) NOT NULL DEFAULT '0',
  `qtyexpected` double NOT NULL DEFAULT '0',
  `qtypicked` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`pickinglistno`,`pickinglistlineno`),
  CONSTRAINT `pickinglistdetails_ibfk_1` FOREIGN KEY (`pickinglistno`) REFERENCES `pickinglists` (`pickinglistno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pickinglists` (
  `pickinglistno` int(11) NOT NULL DEFAULT '0',
  `orderno` int(11) NOT NULL DEFAULT '0',
  `pickinglistdate` date NOT NULL DEFAULT '0000-00-00',
  `dateprinted` date NOT NULL DEFAULT '0000-00-00',
  `deliverynotedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`pickinglistno`),
  KEY `pickinglists_ibfk_1` (`orderno`),
  CONSTRAINT `pickinglists_ibfk_1` FOREIGN KEY (`orderno`) REFERENCES `salesorders` (`orderno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pickreq` (
  `prid` int(11) NOT NULL AUTO_INCREMENT,
  `initiator` varchar(20) NOT NULL DEFAULT '',
  `shippedby` varchar(20) NOT NULL DEFAULT '',
  `initdate` date NOT NULL DEFAULT '0000-00-00',
  `requestdate` date NOT NULL DEFAULT '0000-00-00',
  `shipdate` date NOT NULL DEFAULT '0000-00-00',
  `status` varchar(12) NOT NULL DEFAULT '',
  `comments` text,
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `orderno` int(11) NOT NULL DEFAULT '1',
  `consignment` varchar(15) NOT NULL DEFAULT '',
  `packages` int(11) NOT NULL DEFAULT '1' COMMENT 'number of cartons',
  PRIMARY KEY (`prid`),
  KEY `orderno` (`orderno`),
  KEY `requestdate` (`requestdate`),
  KEY `shipdate` (`shipdate`),
  KEY `status` (`status`),
  KEY `closed` (`closed`),
  KEY `loccode` (`loccode`),
  CONSTRAINT `pickreq_ibfk_1` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`),
  CONSTRAINT `pickreq_ibfk_2` FOREIGN KEY (`orderno`) REFERENCES `salesorders` (`orderno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pickreqdetails` (
  `detailno` int(11) NOT NULL AUTO_INCREMENT,
  `prid` int(11) NOT NULL DEFAULT '1',
  `orderlineno` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `qtyexpected` double NOT NULL DEFAULT '0',
  `qtypicked` double NOT NULL DEFAULT '0',
  `invoicedqty` double NOT NULL DEFAULT '0',
  `shipqty` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`detailno`),
  KEY `prid` (`prid`),
  KEY `stockid` (`stockid`),
  CONSTRAINT `pickreqdetails_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `pickreqdetails_ibfk_2` FOREIGN KEY (`prid`) REFERENCES `pickreq` (`prid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pickserialdetails` (
  `serialmoveid` int(11) NOT NULL AUTO_INCREMENT,
  `detailno` int(11) NOT NULL DEFAULT '1',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `serialno` varchar(30) NOT NULL DEFAULT '',
  `moveqty` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`serialmoveid`),
  KEY `detailno` (`detailno`),
  KEY `stockid` (`stockid`,`serialno`),
  KEY `serialno` (`serialno`),
  CONSTRAINT `pickserialdetails_ibfk_1` FOREIGN KEY (`detailno`) REFERENCES `pickreqdetails` (`detailno`),
  CONSTRAINT `pickserialdetails_ibfk_2` FOREIGN KEY (`stockid`, `serialno`) REFERENCES `stockserialitems` (`stockid`, `serialno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pricematrix` (
  `salestype` char(2) NOT NULL DEFAULT '',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantitybreak` int(11) NOT NULL DEFAULT '1',
  `price` double NOT NULL DEFAULT '0',
  `currabrev` char(3) NOT NULL DEFAULT '""',
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `enddate` date NOT NULL DEFAULT '9999-12-31',
  PRIMARY KEY (`salestype`,`stockid`,`currabrev`,`quantitybreak`,`startdate`,`enddate`),
  KEY `SalesType` (`salestype`),
  KEY `currabrev` (`currabrev`),
  KEY `stockid` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `prices` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `typeabbrev` char(2) NOT NULL DEFAULT '',
  `currabrev` char(3) NOT NULL DEFAULT '',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `enddate` date NOT NULL DEFAULT '9999-12-31',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stockid`,`typeabbrev`,`currabrev`,`debtorno`,`branchcode`,`startdate`,`enddate`),
  KEY `CurrAbrev` (`currabrev`),
  KEY `DebtorNo` (`debtorno`),
  KEY `StockID` (`stockid`),
  KEY `TypeAbbrev` (`typeabbrev`),
  CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `prices_ibfk_2` FOREIGN KEY (`currabrev`) REFERENCES `currencies` (`currabrev`),
  CONSTRAINT `prices_ibfk_3` FOREIGN KEY (`typeabbrev`) REFERENCES `salestypes` (`typeabbrev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `prodspecs` (
  `keyval` varchar(25) NOT NULL,
  `testid` int(11) NOT NULL,
  `defaultvalue` varchar(150) NOT NULL DEFAULT '',
  `targetvalue` varchar(30) NOT NULL DEFAULT '',
  `rangemin` float NOT NULL DEFAULT '0',
  `rangemax` float NOT NULL DEFAULT '0',
  `showoncert` tinyint(11) NOT NULL DEFAULT '1',
  `showonspec` tinyint(4) NOT NULL DEFAULT '1',
  `showontestplan` tinyint(4) NOT NULL DEFAULT '1',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`keyval`,`testid`),
  KEY `testid` (`testid`),
  CONSTRAINT `prodspecs_ibfk_1` FOREIGN KEY (`testid`) REFERENCES `qatests` (`testid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `purchdata` (
  `supplierno` char(10) NOT NULL DEFAULT '',
  `stockid` char(20) NOT NULL DEFAULT '',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `suppliersuom` char(50) NOT NULL DEFAULT '',
  `conversionfactor` double NOT NULL DEFAULT '1',
  `supplierdescription` char(50) NOT NULL DEFAULT '',
  `leadtime` smallint(6) NOT NULL DEFAULT '1',
  `preferred` tinyint(4) NOT NULL DEFAULT '0',
  `effectivefrom` date NOT NULL,
  `suppliers_partno` varchar(50) NOT NULL DEFAULT '',
  `minorderqty` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`supplierno`,`stockid`,`effectivefrom`),
  KEY `StockID` (`stockid`),
  KEY `SupplierNo` (`supplierno`),
  KEY `Preferred` (`preferred`),
  CONSTRAINT `purchdata_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `purchdata_ibfk_2` FOREIGN KEY (`supplierno`) REFERENCES `suppliers` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `purchorderauth` (
  `userid` varchar(20) NOT NULL DEFAULT '',
  `currabrev` char(3) NOT NULL DEFAULT '',
  `cancreate` smallint(2) NOT NULL DEFAULT '0',
  `authlevel` int(11) NOT NULL DEFAULT '0',
  `offhold` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`currabrev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `purchorderdetails` (
  `podetailitem` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` int(11) NOT NULL DEFAULT '0',
  `itemcode` varchar(20) NOT NULL DEFAULT '',
  `deliverydate` date NOT NULL DEFAULT '0000-00-00',
  `itemdescription` varchar(100) NOT NULL,
  `glcode` varchar(20) NOT NULL DEFAULT '0',
  `qtyinvoiced` double NOT NULL DEFAULT '0',
  `unitprice` double NOT NULL DEFAULT '0',
  `actprice` double NOT NULL DEFAULT '0',
  `stdcostunit` double NOT NULL DEFAULT '0',
  `quantityord` double NOT NULL DEFAULT '0',
  `quantityrecd` double NOT NULL DEFAULT '0',
  `shiptref` int(11) NOT NULL DEFAULT '0',
  `jobref` varchar(20) NOT NULL DEFAULT '',
  `completed` tinyint(4) NOT NULL DEFAULT '0',
  `suppliersunit` varchar(50) DEFAULT NULL,
  `suppliers_partno` varchar(50) NOT NULL DEFAULT '',
  `assetid` int(11) NOT NULL DEFAULT '0',
  `conversionfactor` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`podetailitem`),
  KEY `DeliveryDate` (`deliverydate`),
  KEY `GLCode` (`glcode`),
  KEY `ItemCode` (`itemcode`),
  KEY `JobRef` (`jobref`),
  KEY `OrderNo` (`orderno`),
  KEY `ShiptRef` (`shiptref`),
  KEY `Completed` (`completed`),
  CONSTRAINT `purchorderdetails_ibfk_1` FOREIGN KEY (`orderno`) REFERENCES `purchorders` (`orderno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `purchorders` (
  `orderno` int(11) NOT NULL AUTO_INCREMENT,
  `supplierno` varchar(10) NOT NULL DEFAULT '',
  `comments` longblob,
  `orddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rate` double NOT NULL DEFAULT '1',
  `dateprinted` datetime DEFAULT NULL,
  `allowprint` tinyint(4) NOT NULL DEFAULT '1',
  `initiator` varchar(20) NOT NULL,
  `authoriser` varchar(20) NOT NULL DEFAULT '',
  `requisitionno` varchar(15) DEFAULT NULL,
  `intostocklocation` varchar(5) NOT NULL DEFAULT '',
  `deladd1` varchar(40) NOT NULL DEFAULT '',
  `deladd2` varchar(40) NOT NULL DEFAULT '',
  `deladd3` varchar(40) NOT NULL DEFAULT '',
  `deladd4` varchar(40) NOT NULL DEFAULT '',
  `deladd5` varchar(20) NOT NULL DEFAULT '',
  `deladd6` varchar(15) NOT NULL DEFAULT '',
  `tel` varchar(30) NOT NULL DEFAULT '',
  `suppdeladdress1` varchar(40) NOT NULL DEFAULT '',
  `suppdeladdress2` varchar(40) NOT NULL DEFAULT '',
  `suppdeladdress3` varchar(40) NOT NULL DEFAULT '',
  `suppdeladdress4` varchar(40) NOT NULL DEFAULT '',
  `suppdeladdress5` varchar(20) NOT NULL DEFAULT '',
  `suppdeladdress6` varchar(15) NOT NULL DEFAULT '',
  `suppliercontact` varchar(30) NOT NULL DEFAULT '',
  `supptel` varchar(30) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  `version` decimal(3,2) NOT NULL DEFAULT '1.00',
  `revised` date NOT NULL DEFAULT '0000-00-00',
  `realorderno` varchar(16) NOT NULL DEFAULT '',
  `deliveryby` varchar(100) NOT NULL DEFAULT '',
  `deliverydate` date NOT NULL DEFAULT '0000-00-00',
  `status` varchar(12) NOT NULL DEFAULT '',
  `stat_comment` text NOT NULL,
  `paymentterms` char(2) NOT NULL DEFAULT '',
  `port` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`orderno`),
  KEY `OrdDate` (`orddate`),
  KEY `SupplierNo` (`supplierno`),
  KEY `IntoStockLocation` (`intostocklocation`),
  KEY `AllowPrintPO` (`allowprint`),
  CONSTRAINT `purchorders_ibfk_1` FOREIGN KEY (`supplierno`) REFERENCES `suppliers` (`supplierid`),
  CONSTRAINT `purchorders_ibfk_2` FOREIGN KEY (`intostocklocation`) REFERENCES `locations` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qasamples` (
  `sampleid` int(11) NOT NULL AUTO_INCREMENT,
  `prodspeckey` varchar(25) NOT NULL DEFAULT '',
  `lotkey` varchar(25) NOT NULL DEFAULT '',
  `identifier` varchar(10) NOT NULL DEFAULT '',
  `createdby` varchar(15) NOT NULL DEFAULT '',
  `sampledate` date NOT NULL DEFAULT '0000-00-00',
  `comments` varchar(255) NOT NULL DEFAULT '',
  `cert` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sampleid`),
  KEY `prodspeckey` (`prodspeckey`,`lotkey`),
  CONSTRAINT `qasamples_ibfk_1` FOREIGN KEY (`prodspeckey`) REFERENCES `prodspecs` (`keyval`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qatests` (
  `testid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `method` varchar(20) DEFAULT NULL,
  `groupby` varchar(20) DEFAULT NULL,
  `units` varchar(20) NOT NULL,
  `type` varchar(15) NOT NULL,
  `defaultvalue` varchar(150) NOT NULL DEFAULT '''''',
  `numericvalue` tinyint(4) NOT NULL DEFAULT '0',
  `showoncert` int(11) NOT NULL DEFAULT '1',
  `showonspec` int(11) NOT NULL DEFAULT '1',
  `showontestplan` tinyint(4) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`testid`),
  KEY `name` (`name`),
  KEY `groupname` (`groupby`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `recurringsalesorders` (
  `recurrorderno` int(11) NOT NULL AUTO_INCREMENT,
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `customerref` varchar(50) NOT NULL DEFAULT '',
  `buyername` varchar(50) DEFAULT NULL,
  `comments` longblob,
  `orddate` date NOT NULL DEFAULT '0000-00-00',
  `ordertype` char(2) NOT NULL DEFAULT '',
  `shipvia` int(11) NOT NULL DEFAULT '0',
  `deladd1` varchar(40) NOT NULL DEFAULT '',
  `deladd2` varchar(40) NOT NULL,
  `deladd3` varchar(40) NOT NULL,
  `deladd4` varchar(40) NOT NULL,
  `deladd5` varchar(20) NOT NULL DEFAULT '',
  `deladd6` varchar(15) NOT NULL DEFAULT '',
  `contactphone` varchar(25) DEFAULT NULL,
  `contactemail` varchar(25) DEFAULT NULL,
  `deliverto` varchar(40) NOT NULL DEFAULT '',
  `freightcost` double NOT NULL DEFAULT '0',
  `fromstkloc` varchar(5) NOT NULL DEFAULT '',
  `lastrecurrence` date NOT NULL DEFAULT '0000-00-00',
  `stopdate` date NOT NULL DEFAULT '0000-00-00',
  `frequency` tinyint(4) NOT NULL DEFAULT '1',
  `autoinvoice` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`recurrorderno`),
  KEY `debtorno` (`debtorno`),
  KEY `orddate` (`orddate`),
  KEY `ordertype` (`ordertype`),
  KEY `locationindex` (`fromstkloc`),
  KEY `branchcode` (`branchcode`,`debtorno`),
  CONSTRAINT `recurringsalesorders_ibfk_1` FOREIGN KEY (`branchcode`, `debtorno`) REFERENCES `custbranch` (`branchcode`, `debtorno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `recurrsalesorderdetails` (
  `recurrorderno` int(11) NOT NULL DEFAULT '0',
  `stkcode` varchar(20) NOT NULL DEFAULT '',
  `unitprice` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `discountpercent` double NOT NULL DEFAULT '0',
  `narrative` text NOT NULL,
  KEY `orderno` (`recurrorderno`),
  KEY `stkcode` (`stkcode`),
  CONSTRAINT `recurrsalesorderdetails_ibfk_1` FOREIGN KEY (`recurrorderno`) REFERENCES `recurringsalesorders` (`recurrorderno`),
  CONSTRAINT `recurrsalesorderdetails_ibfk_2` FOREIGN KEY (`stkcode`) REFERENCES `stockmaster` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `relateditems` (
  `stockid` varchar(20) NOT NULL,
  `related` varchar(20) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stockid`,`related`),
  UNIQUE KEY `Related` (`related`,`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `reportcolumns` (
  `reportid` smallint(6) NOT NULL DEFAULT '0',
  `colno` smallint(6) NOT NULL DEFAULT '0',
  `heading1` varchar(15) NOT NULL DEFAULT '',
  `heading2` varchar(15) DEFAULT NULL,
  `calculation` tinyint(1) NOT NULL DEFAULT '0',
  `periodfrom` smallint(6) DEFAULT NULL,
  `periodto` smallint(6) DEFAULT NULL,
  `datatype` varchar(15) DEFAULT NULL,
  `colnumerator` tinyint(4) DEFAULT NULL,
  `coldenominator` tinyint(4) DEFAULT NULL,
  `calcoperator` char(1) DEFAULT NULL,
  `budgetoractual` tinyint(1) NOT NULL DEFAULT '0',
  `valformat` char(1) NOT NULL DEFAULT 'N',
  `constant` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`reportid`,`colno`),
  CONSTRAINT `reportcolumns_ibfk_1` FOREIGN KEY (`reportid`) REFERENCES `reportheaders` (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `reportfields` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `reportid` int(5) NOT NULL DEFAULT '0',
  `entrytype` varchar(15) NOT NULL DEFAULT '',
  `seqnum` int(3) NOT NULL DEFAULT '0',
  `fieldname` varchar(80) NOT NULL DEFAULT '',
  `displaydesc` varchar(25) NOT NULL DEFAULT '',
  `visible` enum('1','0') NOT NULL DEFAULT '1',
  `columnbreak` enum('1','0') NOT NULL DEFAULT '1',
  `params` text,
  PRIMARY KEY (`id`),
  KEY `reportid` (`reportid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `reportheaders` (
  `reportid` smallint(6) NOT NULL AUTO_INCREMENT,
  `reportheading` varchar(80) NOT NULL DEFAULT '',
  `groupbydata1` varchar(15) NOT NULL DEFAULT '',
  `newpageafter1` tinyint(1) NOT NULL DEFAULT '0',
  `lower1` varchar(10) NOT NULL DEFAULT '',
  `upper1` varchar(10) NOT NULL DEFAULT '',
  `groupbydata2` varchar(15) DEFAULT NULL,
  `newpageafter2` tinyint(1) NOT NULL DEFAULT '0',
  `lower2` varchar(10) DEFAULT NULL,
  `upper2` varchar(10) DEFAULT NULL,
  `groupbydata3` varchar(15) DEFAULT NULL,
  `newpageafter3` tinyint(1) NOT NULL DEFAULT '0',
  `lower3` varchar(10) DEFAULT NULL,
  `upper3` varchar(10) DEFAULT NULL,
  `groupbydata4` varchar(15) NOT NULL DEFAULT '',
  `newpageafter4` tinyint(1) NOT NULL DEFAULT '0',
  `upper4` varchar(10) NOT NULL DEFAULT '',
  `lower4` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`reportid`),
  KEY `ReportHeading` (`reportheading`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `reportlinks` (
  `table1` varchar(25) NOT NULL DEFAULT '',
  `table2` varchar(25) NOT NULL DEFAULT '',
  `equation` varchar(75) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `reports` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `reportname` varchar(30) NOT NULL DEFAULT '',
  `reporttype` char(3) NOT NULL DEFAULT 'rpt',
  `groupname` varchar(9) NOT NULL DEFAULT 'misc',
  `defaultreport` enum('1','0') NOT NULL DEFAULT '0',
  `papersize` varchar(15) NOT NULL DEFAULT 'A4,210,297',
  `paperorientation` enum('P','L') NOT NULL DEFAULT 'P',
  `margintop` int(3) NOT NULL DEFAULT '10',
  `marginbottom` int(3) NOT NULL DEFAULT '10',
  `marginleft` int(3) NOT NULL DEFAULT '10',
  `marginright` int(3) NOT NULL DEFAULT '10',
  `coynamefont` varchar(20) NOT NULL DEFAULT 'Helvetica',
  `coynamefontsize` int(3) NOT NULL DEFAULT '12',
  `coynamefontcolor` varchar(11) NOT NULL DEFAULT '0,0,0',
  `coynamealign` enum('L','C','R') NOT NULL DEFAULT 'C',
  `coynameshow` enum('1','0') NOT NULL DEFAULT '1',
  `title1desc` varchar(50) NOT NULL DEFAULT '%reportname%',
  `title1font` varchar(20) NOT NULL DEFAULT 'Helvetica',
  `title1fontsize` int(3) NOT NULL DEFAULT '10',
  `title1fontcolor` varchar(11) NOT NULL DEFAULT '0,0,0',
  `title1fontalign` enum('L','C','R') NOT NULL DEFAULT 'C',
  `title1show` enum('1','0') NOT NULL DEFAULT '1',
  `title2desc` varchar(50) NOT NULL DEFAULT 'Report Generated %date%',
  `title2font` varchar(20) NOT NULL DEFAULT 'Helvetica',
  `title2fontsize` int(3) NOT NULL DEFAULT '10',
  `title2fontcolor` varchar(11) NOT NULL DEFAULT '0,0,0',
  `title2fontalign` enum('L','C','R') NOT NULL DEFAULT 'C',
  `title2show` enum('1','0') NOT NULL DEFAULT '1',
  `filterfont` varchar(10) NOT NULL DEFAULT 'Helvetica',
  `filterfontsize` int(3) NOT NULL DEFAULT '8',
  `filterfontcolor` varchar(11) NOT NULL DEFAULT '0,0,0',
  `filterfontalign` enum('L','C','R') NOT NULL DEFAULT 'L',
  `datafont` varchar(10) NOT NULL DEFAULT 'Helvetica',
  `datafontsize` int(3) NOT NULL DEFAULT '10',
  `datafontcolor` varchar(10) NOT NULL DEFAULT 'black',
  `datafontalign` enum('L','C','R') NOT NULL DEFAULT 'L',
  `totalsfont` varchar(10) NOT NULL DEFAULT 'Helvetica',
  `totalsfontsize` int(3) NOT NULL DEFAULT '10',
  `totalsfontcolor` varchar(11) NOT NULL DEFAULT '0,0,0',
  `totalsfontalign` enum('L','C','R') NOT NULL DEFAULT 'L',
  `col1width` int(3) NOT NULL DEFAULT '25',
  `col2width` int(3) NOT NULL DEFAULT '25',
  `col3width` int(3) NOT NULL DEFAULT '25',
  `col4width` int(3) NOT NULL DEFAULT '25',
  `col5width` int(3) NOT NULL DEFAULT '25',
  `col6width` int(3) NOT NULL DEFAULT '25',
  `col7width` int(3) NOT NULL DEFAULT '25',
  `col8width` int(3) NOT NULL DEFAULT '25',
  `col9width` int(3) NOT NULL DEFAULT '25',
  `col10width` int(3) NOT NULL DEFAULT '25',
  `col11width` int(3) NOT NULL DEFAULT '25',
  `col12width` int(3) NOT NULL DEFAULT '25',
  `col13width` int(3) NOT NULL DEFAULT '25',
  `col14width` int(3) NOT NULL DEFAULT '25',
  `col15width` int(3) NOT NULL DEFAULT '25',
  `col16width` int(3) NOT NULL DEFAULT '25',
  `col17width` int(3) NOT NULL DEFAULT '25',
  `col18width` int(3) NOT NULL DEFAULT '25',
  `col19width` int(3) NOT NULL DEFAULT '25',
  `col20width` int(3) NOT NULL DEFAULT '25',
  `table1` varchar(25) NOT NULL DEFAULT '',
  `table2` varchar(25) DEFAULT NULL,
  `table2criteria` varchar(75) DEFAULT NULL,
  `table3` varchar(25) DEFAULT NULL,
  `table3criteria` varchar(75) DEFAULT NULL,
  `table4` varchar(25) DEFAULT NULL,
  `table4criteria` varchar(75) DEFAULT NULL,
  `table5` varchar(25) DEFAULT NULL,
  `table5criteria` varchar(75) DEFAULT NULL,
  `table6` varchar(25) DEFAULT NULL,
  `table6criteria` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`reportname`,`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `salesanalysis` (
  `typeabbrev` char(2) NOT NULL DEFAULT '',
  `periodno` smallint(6) NOT NULL DEFAULT '0',
  `amt` double NOT NULL DEFAULT '0',
  `cost` double NOT NULL DEFAULT '0',
  `cust` varchar(10) NOT NULL DEFAULT '',
  `custbranch` varchar(10) NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT '0',
  `disc` double NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `area` varchar(3) NOT NULL,
  `budgetoractual` tinyint(1) NOT NULL DEFAULT '0',
  `salesperson` char(3) NOT NULL DEFAULT '',
  `stkcategory` varchar(6) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `CustBranch` (`custbranch`),
  KEY `Cust` (`cust`),
  KEY `PeriodNo` (`periodno`),
  KEY `StkCategory` (`stkcategory`),
  KEY `StockID` (`stockid`),
  KEY `TypeAbbrev` (`typeabbrev`),
  KEY `Area` (`area`),
  KEY `BudgetOrActual` (`budgetoractual`),
  KEY `Salesperson` (`salesperson`),
  CONSTRAINT `salesanalysis_ibfk_1` FOREIGN KEY (`periodno`) REFERENCES `periods` (`periodno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salescat` (
  `salescatid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `parentcatid` tinyint(4) DEFAULT NULL,
  `salescatname` varchar(50) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`salescatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salescatprod` (
  `salescatid` tinyint(4) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `featured` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`salescatid`,`stockid`),
  KEY `salescatid` (`salescatid`),
  KEY `stockid` (`stockid`),
  KEY `manufacturers_id` (`manufacturers_id`),
  CONSTRAINT `salescatprod_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `salescatprod_ibfk_2` FOREIGN KEY (`salescatid`) REFERENCES `salescat` (`salescatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salescattranslations` (
  `salescatid` tinyint(4) NOT NULL DEFAULT '0',
  `language_id` varchar(10) NOT NULL DEFAULT 'en_GB.utf8',
  `salescattranslation` varchar(40) NOT NULL,
  PRIMARY KEY (`salescatid`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salesglpostings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(3) NOT NULL,
  `stkcat` varchar(6) NOT NULL DEFAULT '',
  `discountglcode` varchar(20) NOT NULL DEFAULT '0',
  `salesglcode` varchar(20) NOT NULL DEFAULT '0',
  `salestype` char(2) NOT NULL DEFAULT 'AN',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Area_StkCat` (`area`,`stkcat`,`salestype`),
  KEY `Area` (`area`),
  KEY `StkCat` (`stkcat`),
  KEY `SalesType` (`salestype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salesman` (
  `salesmancode` varchar(4) NOT NULL,
  `salesmanname` char(30) NOT NULL DEFAULT '',
  `salesarea` char(3) NOT NULL DEFAULT '',
  `manager` int(1) NOT NULL DEFAULT '0',
  `smantel` char(20) NOT NULL DEFAULT '',
  `smanfax` char(20) NOT NULL DEFAULT '',
  `commissionrate1` double NOT NULL DEFAULT '0',
  `breakpoint` decimal(10,0) NOT NULL DEFAULT '0',
  `commissionrate2` double NOT NULL DEFAULT '0',
  `current` tinyint(4) NOT NULL COMMENT 'Salesman current (1) or not (0)',
  PRIMARY KEY (`salesmancode`),
  KEY `fk_salesman_1` (`salesarea`),
  CONSTRAINT `fk_salesman_1` FOREIGN KEY (`salesarea`) REFERENCES `areas` (`areacode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salesorderdetails` (
  `orderlineno` int(11) NOT NULL DEFAULT '0',
  `orderno` int(11) NOT NULL DEFAULT '0',
  `stkcode` varchar(20) NOT NULL DEFAULT '',
  `qtyinvoiced` double NOT NULL DEFAULT '0',
  `unitprice` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `estimate` tinyint(4) NOT NULL DEFAULT '0',
  `discountpercent` double NOT NULL DEFAULT '0',
  `actualdispatchdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `narrative` text,
  `itemdue` date DEFAULT NULL COMMENT 'Due date for line item.  Some customers require \r\nacknowledgements with due dates by line item',
  `poline` varchar(10) DEFAULT NULL COMMENT 'Some Customers require acknowledgements with a PO line number for each sales line',
  PRIMARY KEY (`orderlineno`,`orderno`),
  KEY `OrderNo` (`orderno`),
  KEY `StkCode` (`stkcode`),
  KEY `Completed` (`completed`),
  CONSTRAINT `salesorderdetails_ibfk_1` FOREIGN KEY (`orderno`) REFERENCES `salesorders` (`orderno`),
  CONSTRAINT `salesorderdetails_ibfk_2` FOREIGN KEY (`stkcode`) REFERENCES `stockmaster` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salesorders` (
  `orderno` int(11) NOT NULL,
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `customerref` varchar(50) NOT NULL DEFAULT '',
  `buyername` varchar(50) DEFAULT NULL,
  `comments` longblob,
  `orddate` date NOT NULL DEFAULT '0000-00-00',
  `ordertype` char(2) NOT NULL DEFAULT '',
  `shipvia` int(11) NOT NULL DEFAULT '0',
  `deladd1` varchar(40) NOT NULL DEFAULT '',
  `deladd2` varchar(40) NOT NULL,
  `deladd3` varchar(40) NOT NULL,
  `deladd4` varchar(40) NOT NULL,
  `deladd5` varchar(20) NOT NULL DEFAULT '',
  `deladd6` varchar(15) NOT NULL DEFAULT '',
  `contactphone` varchar(25) DEFAULT NULL,
  `contactemail` varchar(40) NOT NULL,
  `deliverto` varchar(40) NOT NULL DEFAULT '',
  `deliverblind` tinyint(1) DEFAULT '1',
  `freightcost` double NOT NULL DEFAULT '0',
  `fromstkloc` varchar(5) NOT NULL DEFAULT '',
  `deliverydate` date NOT NULL DEFAULT '0000-00-00',
  `confirmeddate` date NOT NULL DEFAULT '0000-00-00',
  `printedpackingslip` tinyint(4) NOT NULL DEFAULT '0',
  `datepackingslipprinted` date NOT NULL DEFAULT '0000-00-00',
  `quotation` tinyint(4) NOT NULL DEFAULT '0',
  `quotedate` date NOT NULL DEFAULT '0000-00-00',
  `poplaced` tinyint(4) NOT NULL DEFAULT '0',
  `salesperson` varchar(4) NOT NULL,
  `internalcomment` blob,
  PRIMARY KEY (`orderno`),
  KEY `DebtorNo` (`debtorno`),
  KEY `OrdDate` (`orddate`),
  KEY `OrderType` (`ordertype`),
  KEY `LocationIndex` (`fromstkloc`),
  KEY `BranchCode` (`branchcode`,`debtorno`),
  KEY `ShipVia` (`shipvia`),
  KEY `quotation` (`quotation`),
  KEY `poplaced` (`poplaced`),
  KEY `salesperson` (`salesperson`),
  CONSTRAINT `salesorders_ibfk_1` FOREIGN KEY (`branchcode`, `debtorno`) REFERENCES `custbranch` (`branchcode`, `debtorno`),
  CONSTRAINT `salesorders_ibfk_2` FOREIGN KEY (`shipvia`) REFERENCES `shippers` (`shipper_id`),
  CONSTRAINT `salesorders_ibfk_3` FOREIGN KEY (`fromstkloc`) REFERENCES `locations` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salestypes` (
  `typeabbrev` char(2) NOT NULL DEFAULT '',
  `sales_type` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`typeabbrev`),
  KEY `Sales_Type` (`sales_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sampleresults` (
  `resultid` bigint(20) NOT NULL AUTO_INCREMENT,
  `sampleid` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `defaultvalue` varchar(150) NOT NULL,
  `targetvalue` varchar(30) NOT NULL,
  `rangemin` float NOT NULL DEFAULT '0',
  `rangemax` float NOT NULL DEFAULT '0',
  `testvalue` varchar(30) NOT NULL DEFAULT '',
  `testdate` date NOT NULL DEFAULT '0000-00-00',
  `testedby` varchar(15) NOT NULL DEFAULT '',
  `comments` varchar(255) NOT NULL DEFAULT '',
  `isinspec` tinyint(4) NOT NULL DEFAULT '0',
  `showoncert` tinyint(4) NOT NULL DEFAULT '1',
  `showontestplan` tinyint(4) NOT NULL DEFAULT '1',
  `manuallyadded` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resultid`),
  KEY `sampleid` (`sampleid`),
  KEY `testid` (`testid`),
  CONSTRAINT `sampleresults_ibfk_1` FOREIGN KEY (`testid`) REFERENCES `qatests` (`testid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schedule` (
  `jobnumber` int(11) NOT NULL AUTO_INCREMENT,
  `script` varchar(60) NOT NULL DEFAULT '',
  `nextrun` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `frequency` char(1) NOT NULL DEFAULT 'd',
  PRIMARY KEY (`jobnumber`),
  KEY `Script` (`script`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `scripts` (
  `script` varchar(78) NOT NULL DEFAULT '',
  `pagesecurity` int(11) NOT NULL DEFAULT '1',
  `description` text NOT NULL,
  PRIMARY KEY (`script`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `securitygroups` (
  `secroleid` int(11) NOT NULL DEFAULT '0',
  `tokenid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`secroleid`,`tokenid`),
  KEY `secroleid` (`secroleid`),
  KEY `tokenid` (`tokenid`),
  CONSTRAINT `securitygroups_secroleid_fk` FOREIGN KEY (`secroleid`) REFERENCES `securityroles` (`secroleid`),
  CONSTRAINT `securitygroups_tokenid_fk` FOREIGN KEY (`tokenid`) REFERENCES `securitytokens` (`tokenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `securityroles` (
  `secroleid` int(11) NOT NULL AUTO_INCREMENT,
  `secrolename` text NOT NULL,
  PRIMARY KEY (`secroleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `securitytokens` (
  `tokenid` int(11) NOT NULL DEFAULT '0',
  `tokenname` text NOT NULL,
  PRIMARY KEY (`tokenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sellthroughsupport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplierno` varchar(10) NOT NULL,
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `categoryid` char(6) NOT NULL DEFAULT '',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `narrative` varchar(20) NOT NULL DEFAULT '',
  `rebatepercent` double NOT NULL DEFAULT '0',
  `rebateamount` double NOT NULL DEFAULT '0',
  `effectivefrom` date NOT NULL,
  `effectiveto` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `supplierno` (`supplierno`),
  KEY `debtorno` (`debtorno`),
  KEY `effectivefrom` (`effectivefrom`),
  KEY `effectiveto` (`effectiveto`),
  KEY `stockid` (`stockid`),
  KEY `categoryid` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `shipmentcharges` (
  `shiptchgid` int(11) NOT NULL AUTO_INCREMENT,
  `shiptref` int(11) NOT NULL DEFAULT '0',
  `transtype` smallint(6) NOT NULL DEFAULT '0',
  `transno` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `value` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`shiptchgid`),
  KEY `TransType` (`transtype`,`transno`),
  KEY `ShiptRef` (`shiptref`),
  KEY `StockID` (`stockid`),
  KEY `TransType_2` (`transtype`),
  CONSTRAINT `shipmentcharges_ibfk_1` FOREIGN KEY (`shiptref`) REFERENCES `shipments` (`shiptref`),
  CONSTRAINT `shipmentcharges_ibfk_2` FOREIGN KEY (`transtype`) REFERENCES `systypes` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `shipments` (
  `shiptref` int(11) NOT NULL DEFAULT '0',
  `voyageref` varchar(20) NOT NULL DEFAULT '0',
  `vessel` varchar(50) NOT NULL DEFAULT '',
  `shipmentdate` date NOT NULL DEFAULT '1901-01-01',
  `eta` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `accumvalue` double NOT NULL DEFAULT '0',
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shiptref`),
  KEY `ETA` (`eta`),
  KEY `SupplierID` (`supplierid`),
  KEY `ShipperRef` (`voyageref`),
  KEY `Vessel` (`vessel`),
  CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `suppliers` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `shippers` (
  `shipper_id` int(11) NOT NULL AUTO_INCREMENT,
  `shippername` char(40) NOT NULL DEFAULT '',
  `mincharge` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockcategory` (
  `categoryid` char(6) NOT NULL DEFAULT '',
  `categorydescription` char(20) NOT NULL DEFAULT '',
  `defaulttaxcatid` int(1) NOT NULL DEFAULT '1',
  `stocktype` char(1) NOT NULL DEFAULT 'F',
  `stockact` varchar(20) NOT NULL DEFAULT '0',
  `adjglact` varchar(20) NOT NULL DEFAULT '0',
  `issueglact` varchar(20) NOT NULL DEFAULT '0',
  `purchpricevaract` varchar(20) NOT NULL DEFAULT '80000',
  `materialuseagevarac` varchar(20) NOT NULL DEFAULT '80000',
  `wipact` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoryid`),
  KEY `CategoryDescription` (`categorydescription`),
  KEY `StockType` (`stocktype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockcatproperties` (
  `stkcatpropid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` char(6) NOT NULL,
  `label` text NOT NULL,
  `controltype` tinyint(4) NOT NULL DEFAULT '0',
  `defaultvalue` varchar(100) NOT NULL DEFAULT '''''',
  `maximumvalue` double NOT NULL DEFAULT '999999999',
  `reqatsalesorder` tinyint(4) NOT NULL DEFAULT '0',
  `minimumvalue` double NOT NULL DEFAULT '-999999999',
  `numericvalue` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stkcatpropid`),
  KEY `categoryid` (`categoryid`),
  CONSTRAINT `categoryid` FOREIGN KEY (`categoryid`) REFERENCES `stockcategory` (`categoryid`),
  CONSTRAINT `stockcatproperties_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `stockcategory` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockcheckfreeze` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `qoh` double NOT NULL DEFAULT '0',
  `stockcheckdate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`stockid`,`loccode`),
  KEY `LocCode` (`loccode`),
  CONSTRAINT `stockcheckfreeze_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `stockcheckfreeze_ibfk_2` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockcosts` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `materialcost` double NOT NULL DEFAULT '0',
  `labourcost` double NOT NULL DEFAULT '0',
  `overheadcost` double NOT NULL DEFAULT '0',
  `costfrom` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `succeeded` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stockid`,`costfrom`),
  CONSTRAINT ` stockcosts _ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockcounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `qtycounted` double NOT NULL DEFAULT '0',
  `reference` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `StockID` (`stockid`),
  KEY `LocCode` (`loccode`),
  CONSTRAINT `stockcounts_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `stockcounts_ibfk_2` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockdescriptiontranslations` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `language_id` varchar(10) NOT NULL DEFAULT 'en_GB.utf8',
  `descriptiontranslation` varchar(50) NOT NULL,
  `needsrevision` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stockid`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockitemproperties` (
  `stockid` varchar(20) NOT NULL,
  `stkcatpropid` int(11) NOT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`stockid`,`stkcatpropid`),
  KEY `stockid` (`stockid`),
  KEY `value` (`value`),
  KEY `stkcatpropid` (`stkcatpropid`),
  CONSTRAINT `stkcatpropid` FOREIGN KEY (`stkcatpropid`) REFERENCES `stockcatproperties` (`stkcatpropid`),
  CONSTRAINT `stockid` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `stockitemproperties_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `stockitemproperties_ibfk_2` FOREIGN KEY (`stkcatpropid`) REFERENCES `stockcatproperties` (`stkcatpropid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stocklongdescriptiontranslations` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `language_id` varchar(10) NOT NULL DEFAULT 'en_GB.utf8',
  `longdescriptiontranslation` mediumtext NOT NULL,
  `needsrevision` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stockid`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockmaster` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `categoryid` varchar(6) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `longdescription` text NOT NULL,
  `units` varchar(20) NOT NULL DEFAULT 'each',
  `mbflag` char(1) NOT NULL DEFAULT 'B',
  `actualcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `lastcost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `lowestlevel` smallint(6) NOT NULL DEFAULT '0',
  `discontinued` tinyint(4) NOT NULL DEFAULT '0',
  `controlled` tinyint(4) NOT NULL DEFAULT '0',
  `eoq` double NOT NULL DEFAULT '0',
  `volume` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `grossweight` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `barcode` varchar(50) NOT NULL DEFAULT '',
  `discountcategory` char(2) NOT NULL DEFAULT '',
  `taxcatid` tinyint(4) NOT NULL DEFAULT '1',
  `serialised` tinyint(4) NOT NULL DEFAULT '0',
  `appendfile` varchar(40) NOT NULL DEFAULT 'none',
  `perishable` tinyint(1) NOT NULL DEFAULT '0',
  `decimalplaces` tinyint(4) NOT NULL DEFAULT '0',
  `pansize` double NOT NULL DEFAULT '0',
  `shrinkfactor` double NOT NULL DEFAULT '0',
  `nextserialno` bigint(20) NOT NULL DEFAULT '0',
  `netweight` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `unitsdimension` varchar(15) NOT NULL DEFAULT 'mm',
  `lastcostupdate` date NOT NULL DEFAULT '0000-00-00',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stockid`),
  KEY `CategoryID` (`categoryid`),
  KEY `Description` (`description`),
  KEY `MBflag` (`mbflag`),
  KEY `StockID` (`stockid`,`categoryid`),
  KEY `Controlled` (`controlled`),
  KEY `DiscountCategory` (`discountcategory`),
  KEY `taxcatid` (`taxcatid`),
  KEY `stockmaster_ibix_1` (`taxcatid`),
  CONSTRAINT `stockmaster_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `stockcategory` (`categoryid`),
  CONSTRAINT `stockmaster_ibfk_2` FOREIGN KEY (`taxcatid`) REFERENCES `taxcategories` (`taxcatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockmoves` (
  `stkmoveno` int(11) NOT NULL AUTO_INCREMENT,
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `transno` int(11) NOT NULL DEFAULT '0',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `trandate` date NOT NULL DEFAULT '0000-00-00',
  `userid` varchar(20) NOT NULL DEFAULT '',
  `debtorno` varchar(10) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `prd` smallint(6) NOT NULL DEFAULT '0',
  `reference` varchar(100) NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT '1',
  `discountpercent` double NOT NULL DEFAULT '0',
  `standardcost` double NOT NULL DEFAULT '0',
  `show_on_inv_crds` tinyint(4) NOT NULL DEFAULT '1',
  `newqoh` double NOT NULL DEFAULT '0',
  `hidemovt` tinyint(4) NOT NULL DEFAULT '0',
  `narrative` text,
  PRIMARY KEY (`stkmoveno`),
  KEY `DebtorNo` (`debtorno`),
  KEY `LocCode` (`loccode`),
  KEY `Prd` (`prd`),
  KEY `StockID_2` (`stockid`),
  KEY `TranDate` (`trandate`),
  KEY `TransNo` (`transno`),
  KEY `Type` (`type`),
  KEY `Show_On_Inv_Crds` (`show_on_inv_crds`),
  KEY `Hide` (`hidemovt`),
  KEY `reference` (`reference`),
  KEY `stockmoves` (`reference`),
  CONSTRAINT `stockmoves_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `stockmoves_ibfk_2` FOREIGN KEY (`type`) REFERENCES `systypes` (`typeid`),
  CONSTRAINT `stockmoves_ibfk_3` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`),
  CONSTRAINT `stockmoves_ibfk_4` FOREIGN KEY (`prd`) REFERENCES `periods` (`periodno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockmovestaxes` (
  `stkmoveno` int(11) NOT NULL DEFAULT '0',
  `taxauthid` tinyint(4) NOT NULL DEFAULT '0',
  `taxrate` double NOT NULL DEFAULT '0',
  `taxontax` tinyint(4) NOT NULL DEFAULT '0',
  `taxcalculationorder` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stkmoveno`,`taxauthid`),
  KEY `taxauthid` (`taxauthid`),
  KEY `calculationorder` (`taxcalculationorder`),
  CONSTRAINT `stkmoveno` FOREIGN KEY (`stkmoveno`) REFERENCES `stockmoves` (`stkmoveno`),
  CONSTRAINT `stockmovestaxes_ibfk_1` FOREIGN KEY (`taxauthid`) REFERENCES `taxauthorities` (`taxid`),
  CONSTRAINT `stockmovestaxes_ibfk_2` FOREIGN KEY (`stkmoveno`) REFERENCES `stockmoves` (`stkmoveno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockrequest` (
  `dispatchid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) NOT NULL DEFAULT '',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `departmentid` int(11) NOT NULL DEFAULT '0',
  `despatchdate` date NOT NULL DEFAULT '0000-00-00',
  `authorised` tinyint(4) NOT NULL DEFAULT '0',
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `narrative` text NOT NULL,
  PRIMARY KEY (`dispatchid`),
  KEY `loccode` (`loccode`),
  KEY `departmentid` (`departmentid`),
  KEY `loccode_2` (`loccode`),
  KEY `departmentid_2` (`departmentid`),
  CONSTRAINT `departmentid` FOREIGN KEY (`departmentid`) REFERENCES `departments` (`departmentid`),
  CONSTRAINT `loccode` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`),
  CONSTRAINT `stockrequest_ibfk_1` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`),
  CONSTRAINT `stockrequest_ibfk_2` FOREIGN KEY (`departmentid`) REFERENCES `departments` (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockrequestitems` (
  `dispatchitemsid` int(11) NOT NULL DEFAULT '0',
  `dispatchid` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '0',
  `qtydelivered` double NOT NULL DEFAULT '0',
  `decimalplaces` int(11) NOT NULL DEFAULT '0',
  `uom` varchar(20) NOT NULL DEFAULT '',
  `completed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dispatchitemsid`,`dispatchid`),
  KEY `dispatchid` (`dispatchid`),
  KEY `stockid` (`stockid`),
  KEY `dispatchid_2` (`dispatchid`),
  KEY `stockid_2` (`stockid`),
  CONSTRAINT `stockrequestitems_ibfk_1` FOREIGN KEY (`dispatchid`) REFERENCES `stockrequest` (`dispatchid`),
  CONSTRAINT `stockrequestitems_ibfk_2` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockserialitems` (
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `loccode` varchar(5) NOT NULL DEFAULT '',
  `serialno` varchar(30) NOT NULL DEFAULT '',
  `expirationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `quantity` double NOT NULL DEFAULT '0',
  `qualitytext` text NOT NULL,
  PRIMARY KEY (`stockid`,`serialno`,`loccode`),
  KEY `StockID` (`stockid`),
  KEY `LocCode` (`loccode`),
  KEY `serialno` (`serialno`),
  CONSTRAINT `stockserialitems_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `stockserialitems_ibfk_2` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stockserialmoves` (
  `stkitmmoveno` int(11) NOT NULL AUTO_INCREMENT,
  `stockmoveno` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `serialno` varchar(30) NOT NULL DEFAULT '',
  `moveqty` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`stkitmmoveno`),
  KEY `StockMoveNo` (`stockmoveno`),
  KEY `StockID_SN` (`stockid`,`serialno`),
  KEY `serialno` (`serialno`),
  CONSTRAINT `stockserialmoves_ibfk_1` FOREIGN KEY (`stockmoveno`) REFERENCES `stockmoves` (`stkmoveno`),
  CONSTRAINT `stockserialmoves_ibfk_2` FOREIGN KEY (`stockid`, `serialno`) REFERENCES `stockserialitems` (`stockid`, `serialno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stocktypes` (
  `type` char(1) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `physicalitem` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `suppallocs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amt` double NOT NULL DEFAULT '0',
  `datealloc` date NOT NULL DEFAULT '0000-00-00',
  `transid_allocfrom` int(11) NOT NULL DEFAULT '0',
  `transid_allocto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `TransID_AllocFrom` (`transid_allocfrom`),
  KEY `TransID_AllocTo` (`transid_allocto`),
  KEY `DateAlloc` (`datealloc`),
  CONSTRAINT `suppallocs_ibfk_1` FOREIGN KEY (`transid_allocfrom`) REFERENCES `supptrans` (`id`),
  CONSTRAINT `suppallocs_ibfk_2` FOREIGN KEY (`transid_allocto`) REFERENCES `supptrans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `suppliercontacts` (
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  `position` varchar(30) NOT NULL DEFAULT '',
  `tel` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `mobile` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(55) NOT NULL DEFAULT '',
  `ordercontact` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplierid`,`contact`),
  KEY `Contact` (`contact`),
  KEY `SupplierID` (`supplierid`),
  CONSTRAINT `suppliercontacts_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `suppliers` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `supplierdiscounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplierno` varchar(10) NOT NULL,
  `stockid` varchar(20) NOT NULL,
  `discountnarrative` varchar(20) NOT NULL,
  `discountpercent` double NOT NULL,
  `discountamount` double NOT NULL,
  `effectivefrom` date NOT NULL,
  `effectiveto` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `supplierno` (`supplierno`),
  KEY `effectivefrom` (`effectivefrom`),
  KEY `effectiveto` (`effectiveto`),
  KEY `stockid` (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `suppliers` (
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `suppname` varchar(40) NOT NULL DEFAULT '',
  `address1` varchar(40) NOT NULL DEFAULT '',
  `address2` varchar(40) NOT NULL DEFAULT '',
  `address3` varchar(40) NOT NULL DEFAULT '',
  `address4` varchar(50) NOT NULL DEFAULT '',
  `address5` varchar(20) NOT NULL DEFAULT '',
  `address6` varchar(40) NOT NULL,
  `supptype` tinyint(4) NOT NULL DEFAULT '1',
  `lat` float(10,6) NOT NULL DEFAULT '0.000000',
  `lng` float(10,6) NOT NULL DEFAULT '0.000000',
  `currcode` char(3) NOT NULL DEFAULT '',
  `suppliersince` date NOT NULL DEFAULT '0000-00-00',
  `paymentterms` char(2) NOT NULL DEFAULT '',
  `lastpaid` double NOT NULL DEFAULT '0',
  `lastpaiddate` datetime DEFAULT NULL,
  `bankact` varchar(30) NOT NULL,
  `bankref` varchar(12) NOT NULL DEFAULT '',
  `bankpartics` varchar(12) NOT NULL DEFAULT '',
  `remittance` tinyint(4) NOT NULL DEFAULT '1',
  `taxgroupid` tinyint(4) NOT NULL DEFAULT '1',
  `factorcompanyid` int(11) NOT NULL DEFAULT '1',
  `taxref` varchar(20) NOT NULL DEFAULT '',
  `phn` varchar(50) NOT NULL DEFAULT '',
  `port` varchar(200) NOT NULL DEFAULT '',
  `email` varchar(55) DEFAULT NULL,
  `url` varchar(70) NOT NULL DEFAULT '',
  `fax` varchar(25) DEFAULT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`supplierid`),
  KEY `CurrCode` (`currcode`),
  KEY `PaymentTerms` (`paymentterms`),
  KEY `SuppName` (`suppname`),
  KEY `taxgroupid` (`taxgroupid`),
  KEY `suppliers_ibfk_4` (`factorcompanyid`),
  CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`currcode`) REFERENCES `currencies` (`currabrev`),
  CONSTRAINT `suppliers_ibfk_2` FOREIGN KEY (`paymentterms`) REFERENCES `paymentterms` (`termsindicator`),
  CONSTRAINT `suppliers_ibfk_3` FOREIGN KEY (`taxgroupid`) REFERENCES `taxgroups` (`taxgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `suppliertype` (
  `typeid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `supptrans` (
  `transno` int(11) NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `supplierno` varchar(10) NOT NULL DEFAULT '',
  `suppreference` varchar(20) NOT NULL DEFAULT '',
  `trandate` date NOT NULL DEFAULT '0000-00-00',
  `duedate` date NOT NULL DEFAULT '0000-00-00',
  `inputdate` datetime NOT NULL,
  `settled` tinyint(4) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `ovamount` double NOT NULL DEFAULT '0',
  `ovgst` double NOT NULL DEFAULT '0',
  `diffonexch` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `transtext` text,
  `hold` tinyint(4) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TypeTransNo` (`transno`,`type`),
  KEY `DueDate` (`duedate`),
  KEY `Hold` (`hold`),
  KEY `SupplierNo` (`supplierno`),
  KEY `Settled` (`settled`),
  KEY `SupplierNo_2` (`supplierno`,`suppreference`),
  KEY `SuppReference` (`suppreference`),
  KEY `TranDate` (`trandate`),
  KEY `TransNo` (`transno`),
  KEY `Type` (`type`),
  CONSTRAINT `supptrans_ibfk_1` FOREIGN KEY (`type`) REFERENCES `systypes` (`typeid`),
  CONSTRAINT `supptrans_ibfk_2` FOREIGN KEY (`supplierno`) REFERENCES `suppliers` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `supptranstaxes` (
  `supptransid` int(11) NOT NULL DEFAULT '0',
  `taxauthid` tinyint(4) NOT NULL DEFAULT '0',
  `taxamount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`supptransid`,`taxauthid`),
  KEY `taxauthid` (`taxauthid`),
  CONSTRAINT `supptranstaxes_ibfk_1` FOREIGN KEY (`taxauthid`) REFERENCES `taxauthorities` (`taxid`),
  CONSTRAINT `supptranstaxes_ibfk_2` FOREIGN KEY (`supptransid`) REFERENCES `supptrans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `systypes` (
  `typeid` smallint(6) NOT NULL DEFAULT '0',
  `typename` char(50) NOT NULL DEFAULT '',
  `typeno` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`typeid`),
  KEY `TypeNo` (`typeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tags` (
  `tagref` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tagdescription` varchar(50) NOT NULL,
  PRIMARY KEY (`tagref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxauthorities` (
  `taxid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `description` varchar(40) NOT NULL,
  `taxglcode` varchar(20) NOT NULL DEFAULT '0',
  `purchtaxglaccount` varchar(20) NOT NULL DEFAULT '0',
  `bank` varchar(50) NOT NULL DEFAULT '',
  `bankacctype` varchar(20) NOT NULL DEFAULT '',
  `bankacc` varchar(50) NOT NULL DEFAULT '',
  `bankswift` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`taxid`),
  KEY `TaxGLCode` (`taxglcode`),
  KEY `PurchTaxGLAccount` (`purchtaxglaccount`),
  CONSTRAINT `taxauthorities_ibfk_1` FOREIGN KEY (`taxglcode`) REFERENCES `chartmaster` (`accountcode`),
  CONSTRAINT `taxauthorities_ibfk_2` FOREIGN KEY (`purchtaxglaccount`) REFERENCES `chartmaster` (`accountcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxauthrates` (
  `taxauthority` tinyint(4) NOT NULL DEFAULT '1',
  `dispatchtaxprovince` tinyint(4) NOT NULL DEFAULT '1',
  `taxcatid` tinyint(4) NOT NULL DEFAULT '0',
  `taxrate` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`taxauthority`,`dispatchtaxprovince`,`taxcatid`),
  KEY `TaxAuthority` (`taxauthority`),
  KEY `dispatchtaxprovince` (`dispatchtaxprovince`),
  KEY `taxcatid` (`taxcatid`),
  CONSTRAINT `taxauthrates_ibfk_1` FOREIGN KEY (`taxauthority`) REFERENCES `taxauthorities` (`taxid`),
  CONSTRAINT `taxauthrates_ibfk_2` FOREIGN KEY (`taxcatid`) REFERENCES `taxcategories` (`taxcatid`),
  CONSTRAINT `taxauthrates_ibfk_3` FOREIGN KEY (`dispatchtaxprovince`) REFERENCES `taxprovinces` (`taxprovinceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxcategories` (
  `taxcatid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `taxcatname` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`taxcatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxgroups` (
  `taxgroupid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `taxgroupdescription` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`taxgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxgrouptaxes` (
  `taxgroupid` tinyint(4) NOT NULL DEFAULT '0',
  `taxauthid` tinyint(4) NOT NULL DEFAULT '0',
  `calculationorder` tinyint(4) NOT NULL DEFAULT '0',
  `taxontax` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`taxgroupid`,`taxauthid`),
  KEY `taxgroupid` (`taxgroupid`),
  KEY `taxauthid` (`taxauthid`),
  CONSTRAINT `taxgrouptaxes_ibfk_1` FOREIGN KEY (`taxgroupid`) REFERENCES `taxgroups` (`taxgroupid`),
  CONSTRAINT `taxgrouptaxes_ibfk_2` FOREIGN KEY (`taxauthid`) REFERENCES `taxauthorities` (`taxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taxprovinces` (
  `taxprovinceid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `taxprovincename` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`taxprovinceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `telecomrates` (
  `region` varchar(100) NOT NULL DEFAULT '',
  `prefix` varchar(20) NOT NULL DEFAULT '1',
  `ratepersecond` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tenderitems` (
  `tenderid` int(11) NOT NULL DEFAULT '0',
  `stockid` varchar(20) NOT NULL DEFAULT '',
  `quantity` varchar(40) NOT NULL DEFAULT '',
  `units` varchar(20) NOT NULL DEFAULT 'each',
  PRIMARY KEY (`tenderid`,`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tenders` (
  `tenderid` int(11) NOT NULL DEFAULT '0',
  `location` varchar(5) NOT NULL DEFAULT '',
  `address1` varchar(40) NOT NULL DEFAULT '',
  `address2` varchar(40) NOT NULL DEFAULT '',
  `address3` varchar(40) NOT NULL DEFAULT '',
  `address4` varchar(40) NOT NULL DEFAULT '',
  `address5` varchar(20) NOT NULL DEFAULT '',
  `address6` varchar(15) NOT NULL DEFAULT '',
  `telephone` varchar(25) NOT NULL DEFAULT '',
  `closed` int(2) NOT NULL DEFAULT '0',
  `requiredbydate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tenderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tendersuppliers` (
  `tenderid` int(11) NOT NULL DEFAULT '0',
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `email` varchar(40) NOT NULL DEFAULT '',
  `responded` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tenderid`,`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `unitsofdimension` (
  `unitid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `unitname` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`unitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `unitsofmeasure` (
  `unitid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `unitname` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`unitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `woitems` (
  `wo` int(11) NOT NULL,
  `stockid` char(20) NOT NULL DEFAULT '',
  `qtyreqd` double NOT NULL DEFAULT '1',
  `qtyrecd` double NOT NULL DEFAULT '0',
  `stdcost` double NOT NULL,
  `nextlotsnref` varchar(20) DEFAULT '',
  `comments` text,
  PRIMARY KEY (`wo`,`stockid`),
  KEY `stockid` (`stockid`),
  CONSTRAINT `woitems_ibfk_1` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `woitems_ibfk_2` FOREIGN KEY (`wo`) REFERENCES `workorders` (`wo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `worequirements` (
  `wo` int(11) NOT NULL,
  `parentstockid` varchar(20) NOT NULL,
  `stockid` varchar(20) NOT NULL,
  `qtypu` double NOT NULL DEFAULT '1',
  `stdcost` double NOT NULL DEFAULT '0',
  `autoissue` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wo`,`parentstockid`,`stockid`),
  KEY `stockid` (`stockid`),
  KEY `worequirements_ibfk_3` (`parentstockid`),
  CONSTRAINT `worequirements_ibfk_1` FOREIGN KEY (`wo`) REFERENCES `workorders` (`wo`),
  CONSTRAINT `worequirements_ibfk_2` FOREIGN KEY (`stockid`) REFERENCES `stockmaster` (`stockid`),
  CONSTRAINT `worequirements_ibfk_3` FOREIGN KEY (`wo`, `parentstockid`) REFERENCES `woitems` (`wo`, `stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `workcentres` (
  `code` char(5) NOT NULL DEFAULT '',
  `location` char(5) NOT NULL DEFAULT '',
  `description` char(20) NOT NULL DEFAULT '',
  `capacity` double NOT NULL DEFAULT '1',
  `overheadperhour` decimal(10,0) NOT NULL DEFAULT '0',
  `overheadrecoveryact` varchar(20) NOT NULL DEFAULT '0',
  `setuphrs` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`),
  KEY `Description` (`description`),
  KEY `Location` (`location`),
  CONSTRAINT `workcentres_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `workorders` (
  `wo` int(11) NOT NULL,
  `loccode` char(5) NOT NULL DEFAULT '',
  `requiredby` date NOT NULL DEFAULT '0000-00-00',
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `costissued` double NOT NULL DEFAULT '0',
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `closecomments` text NOT NULL,
  PRIMARY KEY (`wo`),
  KEY `LocCode` (`loccode`),
  KEY `StartDate` (`startdate`),
  KEY `RequiredBy` (`requiredby`),
  CONSTRAINT `workorders_ibfk_1` FOREIGN KEY (`loccode`) REFERENCES `locations` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `woserialnos` (
  `wo` int(11) NOT NULL,
  `stockid` varchar(20) NOT NULL,
  `serialno` varchar(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT '1',
  `qualitytext` text NOT NULL,
  PRIMARY KEY (`wo`,`stockid`,`serialno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `www_users` (
  `userid` varchar(20) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `realname` varchar(35) NOT NULL DEFAULT '',
  `customerid` varchar(10) NOT NULL DEFAULT '',
  `supplierid` varchar(10) NOT NULL DEFAULT '',
  `salesman` char(3) NOT NULL,
  `phone` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(55) DEFAULT NULL,
  `defaultlocation` varchar(5) NOT NULL DEFAULT '',
  `restrictlocations` tinyint(1) NOT NULL DEFAULT '1',
  `fullaccess` int(11) NOT NULL DEFAULT '1',
  `cancreatetender` tinyint(1) NOT NULL DEFAULT '0',
  `lastvisitdate` datetime DEFAULT NULL,
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `pagesize` varchar(20) NOT NULL DEFAULT 'A4',
  `modulesallowed` varchar(40) NOT NULL DEFAULT '',
  `blocked` tinyint(4) NOT NULL DEFAULT '0',
  `displayrecordsmax` int(11) NOT NULL DEFAULT '0',
  `theme` varchar(30) NOT NULL DEFAULT 'fresh',
  `language` varchar(10) NOT NULL DEFAULT 'en_GB.utf8',
  `pdflanguage` tinyint(1) NOT NULL DEFAULT '0',
  `department` int(11) NOT NULL DEFAULT '0',
  `fontsize` tinyint(2) NOT NULL DEFAULT '0',
  `defaulttag` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`),
  KEY `CustomerID` (`customerid`),
  KEY `DefaultLocation` (`defaultlocation`),
  CONSTRAINT `www_users_ibfk_1` FOREIGN KEY (`defaultlocation`) REFERENCES `locations` (`loccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

