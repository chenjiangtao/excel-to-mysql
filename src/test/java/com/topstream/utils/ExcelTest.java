package com.topstream.utils;

import com.alibaba.fastjson.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest
class ExcelTest {

    @Test
    void card() {
        //Excel2SQL.printSQL("doc/template.xls");
        Excel2SQL.printSQL("doc/template-card.xls");
    }


    @Test
    void coupon() {
        //Excel2SQL.printSQL("doc/template.xls");
        Excel2SQL.printSQL("doc/template-coupon.xls");
    }

    @Test
    void test() {

        //
        //Map<String, Object> testMap = new HashMap<String, Object>();
        //testMap.put("a", "b");
        //testMap.put("a", "b");
        //testMap.put("a", "b");
        //
        //String o = JSONObject.toJSONString(testMap);
        //System.out.println(o);

        String json = "{\"recharge_amount\":\"累计充值金额:\",\"init_card_status\":\"初始状态:4:未激活 6:激活\",\"account_type\":\"账户类型:URP\",\"after_valid_end_date\":\"交易后有效期结束日期:\",\"partner_name\":\"交易商户名称:\",\"cashregister_no\":\"收银机号:URP\",\"l_card_no\":\"长卡号:\",\"import_batch_no\":\"导入批次:无需三家填写\",\"order_status\":\"交易状态:0:等待、1:成功、2:失败…\",\"after_valid_end_time\":\"交易后有效期结束时间:\",\"is_repeat_b\":\"卡能否重复消费:\",\"province\":\"省份:URP\",\"is_repeat_a\":\"卡能否重复充值:\",\"associated_order_no\":\"关联订单号:\",\"valid_end_time\":\"有效期结束时间:\",\"net_name\":\"NETNAME:URP\",\"id\":\"ID:记录唯一ID\",\"import_data_source\":\"数据来源（1:PNC，2:FEEMUD，3:E-BUY）:\",\"a_account\":\"A账户:URP\",\"change_item\":\"变更项:变更的字段名：有效期、卡状态\",\"auth_code\":\"授权码:URP\",\"area_no\":\"区域编号:URP\",\"is_replace\":\"是否补卡过:\",\"company_name\":\"公司名称:\",\"rloss_card_time\":\"挂失时间:\",\"before_valid_start_date\":\"交易前有效期开始日期:\",\"card_name\":\"卡名称:\",\"l_expired_time\":\"长码过期时间:\",\"after_amount_a\":\"交易后余额:\",\"after_amount_b\":\"交易后补贴余额:\",\"trans_id\":\"交易号/订单号:\",\"b_change_value\":\"变更前值:\",\"old_card_no\":\"旧卡号:URP\",\"swap_type\":\"交易类型:类型ID +“-” +名称\",\"freeze_card_date\":\"冻结日期:\",\"update_time\":\"更新时间:\",\"card_no\":\"卡号:\",\"freeze_amount_b\":\"冻结补贴金额:\",\"freeze_amount_a\":\"冻结金额:\",\"enc_type\":\"长卡号加密方式:\",\"org_name\":\"机构名称:URP\",\"unfreeze_card_date\":\"解冻日期:\",\"channel_name\":\"发卡渠道:\",\"apply_type1\":\"卡类型1:类型ID +“-” +名称\",\"apply_type2\":\"卡类型2:类型ID +“-” +名称\",\"create_card_date\":\"生卡日期:\",\"result_info\":\"结果信息:成功、失败\",\"card_type\":\"卡类型:URP\",\"rloss_card_date\":\"挂失日期:\",\"activate_date\":\"激活日期:URP\",\"sku_no\":\"sku:卡品类号\",\"settle_amount\":\"清算金额:URP\",\"freeze_card_time\":\"冻结时间:\",\"init_amount_a\":\"激活金额:指初始金额\",\"init_amount_b\":\"补贴金额:指初始折扣金额\",\"valid_start_time\":\"有效期开始时间:\",\"recharge_type\":\"充值类型:线上APP充值、门店充值\",\"before_valid_end_date\":\"交易前有效期结束日期:\",\"store_no\":\"交易门店号:\",\"activate_time\":\"激活时间:URP\",\"track_no\":\"外部流水号:URP\",\"active_card_date\":\"激活日期:\",\"partner_code\":\"交易商户号:\",\"delete_flag\":\"删除标识:逻辑删除标识\\n(0:正常、1:删除)\",\"create_date\":\"创建日期:\",\"first_trans_no\":\"首笔交易交易号:首笔交易订单号\",\"payment_method\":\"支付方式:URP\",\"consume_amount\":\"累计消费金额:\",\"before_amount_a\":\"交易前余额:\",\"activation_name\":\"激活门店:URP\",\"before_amount_b\":\"交易前补贴余额:\",\"create_time\":\"创建时间:\",\"opt_result\":\"操作结果:成功、失败\",\"sales_no\":\"销售单号:URP\",\"invalid_card_date\":\"作废日期:\",\"import_time\":\"数据插入时间:无需三家填写\",\"valid_start_date\":\"有效期开始日期:\",\"recharge_trans_type\":\"充值交易类型:微信充值、支付宝充值等\",\"l_expired_date\":\"长码过期日期:\",\"product_name\":\"产品名称:URP\",\"update_date\":\"更新日期:\",\"is_used\":\"是否使用过:\",\"unfreeze_card_time\":\"解冻时间:\",\"create_card_time\":\"生卡时间:制卡时间\",\"active_card_time\":\"激活时间:\",\"discount_scale\":\"贴现率:URP\",\"net_code\":\"NETCODE:URP\",\"outer_trade_id\":\"关联外部订单号:第三方订单号\",\"o_card_no\":\"原卡号:\",\"after_valid_start_date\":\"交易后有效期开始日期:\",\"card_amount_b\":\"补贴金额:指折扣金额\",\"b_account\":\"B账户:URP\",\"card_amount_a\":\"金额:\",\"trans_amount_a\":\"交易金额:\",\"closs_card_time\":\"解挂时间:\",\"import_batch_date\":\"导入批次日期(格式为：YYYYMMDD):\",\"first_recharge_no\":\"首笔充值交易号:首笔交易订单号\",\"swap_time\":\"交易时间:\",\"activation_channel\":\"激活渠道:URP\",\"s_card_no\":\"短卡号:\",\"issuing_bank\":\"发卡行:URP\",\"store_name\":\"交易门店名称:\",\"unactive_card_date\":\"取消激活日期:\",\"batch_no\":\"批次号:\",\"closs_card_date\":\"解挂日期:\",\"after_valid_start_time\":\"交易后有效期开始时间:\",\"pos_serial_no\":\"Pos流水号:\",\"before_valid_start_time\":\"交易前有效期开始时间:\",\"before_valid_end_time\":\"交易前有效期结束时间:\",\"card_status\":\"卡状态:类型ID +“-” +名称\",\"invalid_card_time\":\"作废时间:\",\"valid_end_date\":\"有效期结束日期:\",\"service_charge\":\"手续费:URP\",\"unactive_card_time\":\"取消激活时间:\",\"swap_date\":\"交易日期:\",\"a_change_value\":\"变更后值:\",\"pos_no\":\"POS号:\"}\n";
        JSONObject jsonObject = JSONObject.parseObject(json);
        Map<String, Object> valueMap = new HashMap<String, Object>();
        valueMap.putAll(jsonObject);
        System.out.println(valueMap.get("recharge_amount"));


    }

}
