
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `t_card_info`;
CREATE TABLE `t_card_info` (
                             `id` int NOT NULL AUTO_INCREMENT COLLATE utf8_bin COMMENT 'ID；说明：记录唯一ID；样例：Seehoo生成',
                             `s_card_no` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '短卡号；样例：实体卡：7310258531757312
电子卡：7310292390006602639',
                             `l_card_no` varchar(255)  COLLATE utf8_bin COMMENT '长卡号；样例：92RJb3myyfYFEEXn3EUfZpNUNkFD3tzalFU4XaOQHCTxtQxp1pILNUuVyOZqi2A4',
                             `enc_type` varchar(255)  COLLATE utf8_bin COMMENT '长卡号加密方式',
                             `apply_type1` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '卡类型1；说明：类型ID +“-” +名称；样例：电子卡、实体卡',
                             `apply_type2` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '卡类型2；说明：类型ID +“-” +名称；样例：标准卡、季节卡',
                             `sku_no` varchar(50) NOT NULL COLLATE utf8_bin COMMENT 'SKU；说明：卡品类号；样例：0800000025',
                             `card_name` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '卡名称；样例：星礼卡288元',
                             `issuing_bank` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '发卡行；样例：星巴克',
                             `channel_name` varchar(200) NOT NULL COLLATE utf8_bin COMMENT '发卡渠道；样例：支付宝、星巴克移动应用、宝尊电子商务、微信3.0',
                             `partner_code` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '发行商户号；样例：6113400329',
                             `partner_name` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '发行商户名称；样例：支付宝、星巴克（上海）商业有限公司、上海宝尊电子商务有限公司、微信3.0',
                             `store_no` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '门店号；样例：051',
                             `store_name` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '门店名称；样例：支付宝、星巴克移动应用、宝尊电子商务、微信3.0',
                             `company_name` varchar(200) NOT NULL COLLATE utf8_bin COMMENT '公司名称；样例：支付宝、星巴克（上海）商业有限公司、上海宝尊电子商务有限公司、微信3.0',
                             `active_card_date` varchar(10) NOT NULL COLLATE utf8_bin COMMENT '激活日期；样例：20191231',
                             `active_card_time` varchar(15) NOT NULL COLLATE utf8_bin COMMENT '激活时间；样例：21:45:58',
                             `valid_start_date` varchar(10) NOT NULL COLLATE utf8_bin COMMENT '有效期开始日期；样例：20191231',
                             `valid_start_time` varchar(15) NOT NULL COLLATE utf8_bin COMMENT '有效期开始时间；样例：21:45:58',
                             `valid_end_date` varchar(10) NOT NULL COLLATE utf8_bin COMMENT '有效期结束日期；样例：20221230',
                             `valid_end_time` varchar(15) NOT NULL COLLATE utf8_bin COMMENT '有效期结束时间；样例：21:45:58',
                             `init_amount_a` bigint(16) NOT NULL COLLATE utf8_bin COMMENT '激活金额；说明：指初始金额；样例：288',
                             `init_amount_b` bigint(16) NOT NULL COLLATE utf8_bin COMMENT '补贴金额；说明：指初始折扣金额；样例：0',
                             `card_amount_a` bigint(16) NOT NULL COLLATE utf8_bin COMMENT '余额；样例：288',
                             `card_amount_b` bigint(16) NOT NULL COLLATE utf8_bin COMMENT '补贴余额；说明：指折扣金额；样例：0',
                             `card_status` varchar(10) NOT NULL COLLATE utf8_bin COMMENT '卡状态；说明：类型ID +“-” +名称；样例：06-激活、12-冻结、20-作废',
                             `is_repeat_a` int(1)  COLLATE utf8_bin COMMENT '卡能否重复充值',
                             `is_repeat_b` int(1)  COLLATE utf8_bin COMMENT '卡能否重复消费',
                             `l_expired_date` varchar(10)  COLLATE utf8_bin COMMENT '长码过期日期；样例：20191213',
                             `l_expired_time` varchar(15)  COLLATE utf8_bin COMMENT '长码过期时间；样例：12:23:37',
                             `freeze_amount_a` bigint(16)  COLLATE utf8_bin COMMENT '冻结金额；样例：100',
                             `freeze_amount_b` bigint(16)  COLLATE utf8_bin COMMENT '冻结补贴金额；样例：100',
                             `unactive_card_date` varchar(10)  COLLATE utf8_bin COMMENT '取消激活日期；样例：20191213',
                             `unactive_card_time` varchar(15)  COLLATE utf8_bin COMMENT '取消激活时间；样例：12:23:37',
                             `create_card_date` varchar(10)  COLLATE utf8_bin COMMENT '生卡日期；样例：20191213',
                             `create_card_time` varchar(15)  COLLATE utf8_bin COMMENT '生卡时间；说明：制卡时间；样例：12:23:37',
                             `freeze_card_date` varchar(10)  COLLATE utf8_bin COMMENT '冻结日期；样例：20191213',
                             `freeze_card_time` varchar(15)  COLLATE utf8_bin COMMENT '冻结时间；样例：12:23:37',
                             `unfreeze_card_date` varchar(10)  COLLATE utf8_bin COMMENT '解冻日期；样例：20191213',
                             `unfreeze_card_time` varchar(15)  COLLATE utf8_bin COMMENT '解冻时间；样例：12:23:37',
                             `rloss_card_date` varchar(10)  COLLATE utf8_bin COMMENT '挂失日期；样例：20191213',
                             `rloss_card_time` varchar(15)  COLLATE utf8_bin COMMENT '挂失时间；样例：12:23:37',
                             `closs_card_date` varchar(10)  COLLATE utf8_bin COMMENT '解挂日期；样例：20191213',
                             `closs_card_time` varchar(15)  COLLATE utf8_bin COMMENT '解挂时间；样例：12:23:37',
                             `invalid_card_date` varchar(10)  COLLATE utf8_bin COMMENT '作废日期；样例：20191213',
                             `invalid_card_time` varchar(15)  COLLATE utf8_bin COMMENT '作废时间；样例：12:23:37',
                             `consume_amount` bigint(16) NOT NULL COLLATE utf8_bin COMMENT '累计消费金额；样例：186',
                             `recharge_amount` bigint(16) NOT NULL COLLATE utf8_bin COMMENT '累计充值金额；样例：0',
                             `first_trans_no` varchar(64)  COLLATE utf8_bin COMMENT '首笔交易交易号；说明：首笔交易订单号',
                             `first_recharge_no` varchar(64)  COLLATE utf8_bin COMMENT '首笔充值交易号；说明：首笔交易订单号',
                             `is_used` varchar(10)  COLLATE utf8_bin COMMENT '是否使用过；样例：否',
                             `is_replace` varchar(10)  COLLATE utf8_bin COMMENT '是否补卡过；样例：否',
                             `o_card_no` varchar(50)  COLLATE utf8_bin COMMENT '原卡号；样例：实体卡：7310258531757312
电子卡：7310292390006602639',
                             `delete_flag` varchar(10)  COLLATE utf8_bin COMMENT '删除标识；说明：逻辑删除标识
(0:正常、1:删除)；样例：正常',
                             `create_date` varchar(10)  COLLATE utf8_bin COMMENT '创建日期；样例：20191231',
                             `create_time` varchar(15)  COLLATE utf8_bin COMMENT '创建时间；样例：21:45:58',
                             `update_date` varchar(10)  COLLATE utf8_bin COMMENT '更新日期；样例：20191213',
                             `update_time` varchar(15)  COLLATE utf8_bin COMMENT '更新时间；样例：21:45:58',
                             `import_data_source` int(1)  COLLATE utf8_bin COMMENT '数据来源（1:PNC，2:FEEMUD，3:E-BUY）；样例：1',
                             `import_batch_date` varchar(10)  COLLATE utf8_bin COMMENT '导入批次日期(格式为：YYYYMMDD)；样例：20200103',
                             `import_batch_no` int(1)  COLLATE utf8_bin COMMENT '导入批次编号；说明：无需三家填写；样例：Seehoo生成',
                             `import_time` datetime  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COLLATE utf8_bin COMMENT '数据插入时间；说明：无需三家填写；样例：Seehoo生成',
                             PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8
  COLLATE = utf8_bin
  COMMENT = '卡基础信息表'
  ROW_FORMAT = COMPACT;

DROP TABLE IF EXISTS `t_card_create_record`;
CREATE TABLE `t_card_create_record` (
                                      `id` int NOT NULL AUTO_INCREMENT COLLATE utf8_bin COMMENT 'ID；说明：记录唯一ID；样例：Seehoo生成',
                                      `trans_id` varchar(50)  COLLATE utf8_bin COMMENT '交易号/订单号；样例：2019071111174900079a6d',
                                      `card_no` varchar(255) NOT NULL COLLATE utf8_bin COMMENT '卡号；样例：实体卡：7310258531757312
电子卡：7310292390006602639',
                                      `card_amount_a` bigint(16) NOT NULL COLLATE utf8_bin COMMENT '金额；样例：100',
                                      `card_amount_b` bigint(16) NOT NULL COLLATE utf8_bin COMMENT '补贴金额；说明：指折扣金额；样例：20',
                                      `init_card_status` varchar(10) NOT NULL COLLATE utf8_bin COMMENT '初始状态；说明：4:未激活 6:激活；样例：06-激活、12-冻结、20-作废',
                                      `valid_start_date` varchar(10) NOT NULL COLLATE utf8_bin COMMENT '有效期开始日期；样例：20191230',
                                      `valid_start_time` varchar(15) NOT NULL COLLATE utf8_bin COMMENT '有效期开始时间；样例：12:44:38',
                                      `valid_end_date` varchar(10) NOT NULL COLLATE utf8_bin COMMENT '有效期结束日期；样例：20221230',
                                      `valid_end_time` varchar(15) NOT NULL COLLATE utf8_bin COMMENT '有效期结束时间；样例：12:44:38',
                                      `result_info` varchar(255) NOT NULL COLLATE utf8_bin COMMENT '结果信息；说明：成功、失败；样例：成功',
                                      `pos_no` varchar(50)  COLLATE utf8_bin COMMENT 'pos号',
                                      `sku_no` varchar(50)  COLLATE utf8_bin COMMENT 'sku；样例：102411114136',
                                      `store_no` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '门店号；样例：010',
                                      `store_name` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '门店名称；样例：星巴克移动应用、宝尊电子商务、微信3.0',
                                      `partner_code` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '商户号；样例：6113700030',
                                      `partner_name` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '商户名称；样例：星巴克（上海）商业有限公司、上海宝尊电子商务有限公司、微信3.0',
                                      `create_date` varchar(10) NOT NULL COLLATE utf8_bin COMMENT '创建日期；样例：20191230',
                                      `create_time` varchar(15) NOT NULL COLLATE utf8_bin COMMENT '创建时间；样例：12:44:38',
                                      `update_date` varchar(10)  COLLATE utf8_bin COMMENT '更新日期；样例：20191230',
                                      `update_time` varchar(15)  COLLATE utf8_bin COMMENT '更新时间；样例：12:44:38',
                                      `import_data_source` int(1)  COLLATE utf8_bin COMMENT '数据来源（1:PNC，2:FEEMUD，3:E-BUY）；样例：1',
                                      `import_batch_date` varchar(10)  COLLATE utf8_bin COMMENT '导入批次日期(格式为：YYYYMMDD)；样例：20200102',
                                      `import_batch_no` int(1)  COLLATE utf8_bin COMMENT '导入批次；说明：无需三家填写；样例：Seehoo生成',
                                      `import_time` datetime  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COLLATE utf8_bin COMMENT '数据插入时间；说明：无需三家填写；样例：Seehoo生成',
                                      PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8
  COLLATE = utf8_bin
  COMMENT = '卡创建记录表'
  ROW_FORMAT = COMPACT;

DROP TABLE IF EXISTS `t_card_change_record`;
CREATE TABLE `t_card_change_record` (
                                      `id` int NOT NULL AUTO_INCREMENT COLLATE utf8_bin COMMENT 'ID；说明：记录唯一ID；样例：Seehoo生成',
                                      `trans_id` varchar(50)  COLLATE utf8_bin COMMENT '交易号/订单号；样例：2019071111174900079a6d',
                                      `card_no` varchar(255) NOT NULL COLLATE utf8_bin COMMENT '卡号；样例：8110299903156572353',
                                      `change_item` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '变更项；说明：变更的字段名：有效期、卡状态；样例：卡状态',
                                      `b_change_value` varchar(50)  COLLATE utf8_bin COMMENT '变更前值；样例：激活',
                                      `a_change_value` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '变更后值；样例：作废',
                                      `opt_result` varchar(500) NOT NULL COLLATE utf8_bin COMMENT '操作结果；说明：成功、失败；样例：成功',
                                      `pos_no` varchar(50)  COLLATE utf8_bin COMMENT 'pos号',
                                      `sku_no` varchar(50)  COLLATE utf8_bin COMMENT 'sku；样例：102411114136',
                                      `store_no` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '门店号；样例：061',
                                      `store_name` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '门店名称；样例：星巴克天猫',
                                      `partner_code` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '商户号；样例：6113400378',
                                      `partner_name` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '商户名称；样例：Tmall',
                                      `create_date` varchar(10) NOT NULL COLLATE utf8_bin COMMENT '创建日期；样例：20190724',
                                      `create_time` varchar(15) NOT NULL COLLATE utf8_bin COMMENT '创建时间；样例：15:10:07',
                                      `update_date` varchar(10)  COLLATE utf8_bin COMMENT '更新日期；样例：20190724',
                                      `update_time` varchar(15)  COLLATE utf8_bin COMMENT '更新时间；样例：15:10:07',
                                      `import_data_source` int(1)  COLLATE utf8_bin COMMENT '数据来源（1:PNC，2:FEEMUD，3:E-BUY）；样例：3',
                                      `import_batch_date` varchar(10)  COLLATE utf8_bin COMMENT '导入批次日期(格式为：YYYYMMDD)；样例：20200104',
                                      `import_batch_no` int(1)  COLLATE utf8_bin COMMENT '导入批次；说明：无需三家填写；样例：Seehoo生成',
                                      `import_time` datetime  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COLLATE utf8_bin COMMENT '数据插入时间；说明：无需三家填写；样例：Seehoo生成',
                                      PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8
  COLLATE = utf8_bin
  COMMENT = '卡信息变更记录表'
  ROW_FORMAT = COMPACT;

DROP TABLE IF EXISTS `t_card_trans_record`;
CREATE TABLE `t_card_trans_record` (
                                     `id` int NOT NULL AUTO_INCREMENT COLLATE utf8_bin COMMENT 'ID；说明：记录唯一ID',
                                     `trans_id` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '交易号/订单号；样例：20190713102532004e236d',
                                     `s_card_no` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '短卡号；样例：7360017349570120',
                                     `l_card_no` varchar(255)  COLLATE utf8_bin COMMENT '长卡号；样例：92RJb3myyfYFEEXn3EUfZpNUNkFD3tzalFU4XaOQHCTxtQxp1pILNUuVyOZqi2A4',
                                     `sku_no` varchar(50) NOT NULL COLLATE utf8_bin COMMENT 'sku；说明：卡品类号；样例：Z0130005',
                                     `swap_date` varchar(10) NOT NULL COLLATE utf8_bin COMMENT '交易日期；样例：20191230',
                                     `swap_time` varchar(15) NOT NULL COLLATE utf8_bin COMMENT '交易时间；样例：00:00:18',
                                     `swap_type` varchar(20) NOT NULL COLLATE utf8_bin COMMENT '交易类型；说明：类型ID +“-” +名称；样例：0200000100-消费、0200200100-退款、0200000600-充值、0200200600-取消充值、0500003900-延期、0500002400-换卡、0100399900-取消激活、12-冻结、06-解冻',
                                     `trans_amount_a` bigint(16) NOT NULL COLLATE utf8_bin COMMENT '交易金额；样例：100',
                                     `order_status` int(2) NOT NULL COLLATE utf8_bin COMMENT '交易状态；说明：0:等待、1:成功、2:失败…；样例：1',
                                     `pos_no` varchar(50) NOT NULL COLLATE utf8_bin COMMENT 'POS号；样例：10598501',
                                     `pos_serial_no` varchar(200) NOT NULL COLLATE utf8_bin COMMENT 'Pos流水号；样例：874462',
                                     `store_no` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '交易门店号；样例：53078',
                                     `store_name` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '交易门店名称；样例：杭州文三西路古墩路店',
                                     `partner_code` varchar(200) NOT NULL COLLATE utf8_bin COMMENT '交易商户号；样例：6333400624',
                                     `partner_name` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '交易商户名称；样例：上海星巴克咖啡经营有限公司',
                                     `recharge_type` varchar(50)  COLLATE utf8_bin COMMENT '充值类型；说明：线上APP充值、门店充值',
                                     `recharge_trans_type` varchar(50)  COLLATE utf8_bin COMMENT '充值交易类型；说明：微信充值、支付宝充值等',
                                     `before_amount_a` bigint(16)  COLLATE utf8_bin COMMENT '交易前余额；样例：50',
                                     `before_amount_b` bigint(16)  COLLATE utf8_bin COMMENT '交易前补贴余额；样例：0',
                                     `after_amount_a` bigint(16) NOT NULL COLLATE utf8_bin COMMENT '交易后余额；样例：21',
                                     `after_amount_b` bigint(16)  COLLATE utf8_bin COMMENT '交易后补贴余额；样例：0',
                                     `associated_order_no` varchar(255)  COLLATE utf8_bin COMMENT '关联订单号',
                                     `outer_trade_id` varchar(50)  COLLATE utf8_bin COMMENT '关联外部订单号；说明：第三方订单号',
                                     `batch_no` varchar(50)  COLLATE utf8_bin COMMENT '批次号',
                                     `before_valid_start_date` varchar(10)  COLLATE utf8_bin COMMENT '交易前有效期开始日期；样例：20191213',
                                     `before_valid_start_time` varchar(15)  COLLATE utf8_bin COMMENT '交易前有效期开始时间；样例：12:23:37',
                                     `before_valid_end_date` varchar(10)  COLLATE utf8_bin COMMENT '交易前有效期结束日期；样例：20221230',
                                     `before_valid_end_time` varchar(15)  COLLATE utf8_bin COMMENT '交易前有效期结束时间；样例：00:04:14',
                                     `after_valid_start_date` varchar(10)  COLLATE utf8_bin COMMENT '交易后有效期开始日期；样例：20191213',
                                     `after_valid_start_time` varchar(15)  COLLATE utf8_bin COMMENT '交易后有效期开始时间；样例：12:23:37',
                                     `after_valid_end_date` varchar(10)  COLLATE utf8_bin COMMENT '交易后有效期结束日期；样例：20191213',
                                     `after_valid_end_time` varchar(15)  COLLATE utf8_bin COMMENT '交易后有效期结束时间；样例：12:23:37',
                                     `org_name` varchar(32) NOT NULL COLLATE utf8_bin COMMENT '机构名称；说明：URP；样例：上海星巴克咖啡经营有限公司',
                                     `cashregister_no` varchar(32) NOT NULL COLLATE utf8_bin COMMENT '收银机号；说明：URP；样例：63302363',
                                     `sales_no` varchar(32)  COLLATE utf8_bin COMMENT '销售单号；说明：URP',
                                     `settle_amount` bigint(16) NOT NULL COLLATE utf8_bin COMMENT '清算金额；说明：URP；样例：2',
                                     `issuing_bank` varchar(32) NOT NULL COLLATE utf8_bin COMMENT '发卡行；说明：URP；样例：星巴克',
                                     `auth_code` varchar(32) NOT NULL COLLATE utf8_bin COMMENT '授权码；说明：URP；样例：664540',
                                     `account_type` varchar(32)  COLLATE utf8_bin COMMENT '账户类型；说明：URP',
                                     `discount_scale` varchar(32)  COLLATE utf8_bin COMMENT '贴现率；说明：URP',
                                     `net_code` varchar(32)  COLLATE utf8_bin COMMENT 'NETCODE；说明：URP',
                                     `net_name` varchar(32)  COLLATE utf8_bin COMMENT 'NETNAME；说明：URP',
                                     `old_card_no` varchar(50)  COLLATE utf8_bin COMMENT '旧卡号；说明：URP；样例：7310292520015217365',
                                     `area_no` varchar(32)  COLLATE utf8_bin COMMENT '区域编号；说明：URP',
                                     `activate_date` varchar(10)  COLLATE utf8_bin COMMENT '激活日期；说明：URP；样例：20190103',
                                     `activate_time` varchar(15)  COLLATE utf8_bin COMMENT '激活时间；说明：URP；样例：16:08:52',
                                     `activation_name` varchar(32)  COLLATE utf8_bin COMMENT '激活门店；说明：URP；样例：杭州文三西路古墩路店',
                                     `activation_channel` varchar(32)  COLLATE utf8_bin COMMENT '激活渠道；说明：URP；样例：上海星巴克咖啡经营有限公司',
                                     `track_no` varchar(32)  COLLATE utf8_bin COMMENT '外部流水号；说明：URP',
                                     `service_charge` varchar(50) NOT NULL COLLATE utf8_bin COMMENT '手续费；说明：URP；样例：0',
                                     `payment_method` varchar(50)  COLLATE utf8_bin COMMENT '支付方式；说明：URP',
                                     `product_name` varchar(50)  COLLATE utf8_bin COMMENT '产品名称；说明：URP；样例：金星级专属电子星礼卡0元',
                                     `card_type` varchar(50)  COLLATE utf8_bin COMMENT '卡类型；说明：URP；样例：标准卡',
                                     `a_account` varchar(50)  COLLATE utf8_bin COMMENT 'A账户；说明：URP',
                                     `b_account` varchar(50)  COLLATE utf8_bin COMMENT 'B账户；说明：URP',
                                     `province` varchar(50)  COLLATE utf8_bin COMMENT '省份；说明：URP',
                                     `import_data_source` int(1)  COLLATE utf8_bin COMMENT '数据来源（1:PNC，2:FEEMUD，3:E-BUY）；样例：1',
                                     `import_batch_date` varchar(10)  COLLATE utf8_bin COMMENT '导入批次日期(格式为：YYYYMMDD)；样例：20200102',
                                     `import_batch_no` int(1)  COLLATE utf8_bin COMMENT '导入批次；说明：无需三家填写',
                                     `import_time` datetime  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COLLATE utf8_bin COMMENT '数据插入时间；说明：无需三家填写',
                                     PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8
  COLLATE = utf8_bin
  COMMENT = '卡交易记录表'
  ROW_FORMAT = COMPACT;
