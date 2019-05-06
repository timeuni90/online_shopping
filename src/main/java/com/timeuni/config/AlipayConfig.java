package com.timeuni.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016093000634923";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCQbJeRi/r/lnRf2wyrxSOJGywczzkewdFGdxPq1W/4HMnUYDAr3c7AJxrYoDktxFF1kiULxPXfQ8FKxaP4qDXn9Q8cV6jgIy+NUafBdHXq5NvgdyuJEWvFAeCPaOeULMoga+znXAaMg0nESIeFWCQVZS2AaXJPWUdLB9pS98kfO+XpVj0vqw+TBV+K1gHCrir5dfWPKXT3nGZWl3CJXD54iZkSzGX+nhla8NSYG/Wz1C65pusqhEnJhjvYef8YxkOMX8sH+Y4Vdfx/l11zP3agVyhPAP4/Es2Gzelp5wTtCHg+LDdLr+8EuijT3FuOB1U84ZU61xuNgtp8w2i9DJoXAgMBAAECggEBAINtzyDsuiYNzSnONeG7LXN//szY56pNxxzREJcMVTD9Qc67GhtRZu0GqS+p317+4QKVVJE5VGcxSZ257lZC/YtxP6cTPuN6IbQBMyCh0w1H57CFwmCiMei+pJTdaqE1gVuv249P98W3VFIDjxCR/YRa5uWNEDGVlYN6Sfxm8egxPqBW411FA9CaZJbRW9bOIrjBeLOHu85LVSUqTAOjUd0ffaoTvMjU9lTf/A3q7QVYpDlSAXHDVL/V5uAswAPZnDUOd7XLznnLwXmGPUICsJapWFOZ7AxxkWbtzM1SL8w2e36qJUEhhyq8rpNdSvhZ3wLBoaCnyxNUiW8CPiJwnYECgYEA5eKqkNkUvLh+GRFkLhgrtoa93kVO2WATQQswsIspi81f/dcdPL8hrS9mTDpjSGlFG4yG8b0VKeGR2n06VYJbOn33/kR7yHo+BkDfaozy5o/dpA6gn7NVDn9Uq+M9fKqIReIIQ4qGyKwxY7qo+6CwgBozqPqGfmSOH9gtbNoO1RkCgYEAoNSdTa5bZIOoUmKMkNdHlzROdPHf5h3ozOch/1ujaRPStz9RdDDz9iNFyAGGSdfgG+ykplgoUr/EI5aSUQYVL8v7TSPmsdZOnKGDnvBTjoww7XIxdpcm79uOlVpM1A26gZfVF5c80zEhZxyD1skot6/PunMHLilnb7vIk/1wHq8CgYEAumSoy71X1RT6GTVCtyUd/GcP9/LWVeZSdkCuf9a2HwasuFL8/84xbgyqs0/8RDAmuomcuNEJIeYlrrQu4jpJ4glVVLMOcqS7ObLL88bJBCzOF0FM93AenRyc+KnNpxFWYOM+tBTT6E3F1gj5Dt1hfty/2lkXR9AcdLGBU2sS77ECgYBDLUufHMrTyyJNdxhbj3A5ugFjW3w39Bo/K/PJY4933m3PWMU/EQt1rfoBtpFO2rqjL07+pCgDmFHmw4fODAphcoQ/DlXXxjoDtnrxslRUYD43j9EVRcFfwodl3tfkYu+aHb9GIUeotwbKuOBgoJk/UFImANHo+CZaR0daeSuRxQKBgQCahGhhnNivck0ooHT01MGgH9GHvGTkhRbHXSxhuFnQ8u6TWVCOtIs7pLUNGvYZndQ2pKRbWA67azhzdWjOvHKvbOyP0q9nWECt4kCoOzL21hwjpmv7VHNlCms9OssWQ6RnCoJ0OJkuZrEuLQ2ExImWTs0rvfrEp3xF6t2UoxCGuA==";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkGyXkYv6/5Z0X9sMq8UjiRssHM85HsHRRncT6tVv+BzJ1GAwK93OwCca2KA5LcRRdZIlC8T130PBSsWj+Kg15/UPHFeo4CMvjVGnwXR16uTb4HcriRFrxQHgj2jnlCzKIGvs51wGjINJxEiHhVgkFWUtgGlyT1lHSwfaUvfJHzvl6VY9L6sPkwVfitYBwq4q+XX1jyl095xmVpdwiVw+eImZEsxl/p4ZWvDUmBv1s9QuuabrKoRJyYY72Hn/GMZDjF/LB/mOFXX8f5ddcz92oFcoTwD+PxLNhs3paecE7Qh4Piw3S6/vBLoo09xbjgdVPOGVOtcbjYLafMNovQyaFwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/online-shopping/cart";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/online-shopping/cart";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

