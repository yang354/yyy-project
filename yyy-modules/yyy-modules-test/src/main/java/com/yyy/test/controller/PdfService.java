package com.yyy.test.controller;

/**
 * @Author yyy
 * @Date 2023/9/5 下午5:15
 */


import lombok.extern.slf4j.Slf4j;
import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.net.URLEncoder;

/**
 * @author hyy
 */
@Slf4j
@RestController
public class PdfService {




    /**
     * 富文本生成word
     */
    @RequestMapping(value = "downloadword")
    public int download(HttpServletResponse response, HttpServletRequest request)throws Exception {
        String content = "<p class=\"ql-align-center\"><strong>学生课后托管服务协议</strong></p><p><span style=\"color: black;\">甲方：</span><u style=\"color: black;\">广州市越秀区新城市教育培训中心 &nbsp;</u></p><p><span style=\"color: black;\">乙方：\u00AD\u00AD\u00AD\u00AD\u00AD______________________________</span><u> </u></p><p>\t该协议书分为甲、乙双方，分别对应第三方机构、学生家长。学校受家委会委托通过公开招标方式与甲方开展合作，学校协助制定该协议书。</p><p>\t乙方为方便子女接受教育，决定将现就读于<span style=\"color: black;\">_________________________</span><u> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年级<span style=\"color: black;\">__________________</span>班<span style=\"color: black;\">__________________</span>交由甲方托管。为明确权利义务，与甲方达成协议如下：</p><p><strong>一、</strong>乙方委托甲方在指定期间履行对学生的看护及教育管理责任。甲方要以高度负责和敬业奉献的精神，为学生提供安全、科学的学习与生活管理，使学生各方面素质得到全面的发展和提高。乙方有责任配合甲方对学生的管理，有权利提出甲方对学生管理的建议，发现问题并指出。</p><p><strong>二、服务时间及收费标准</strong></p><p>收费标准：基础托管2-12元/天，不含餐费等，素质拓展40元/课时，如收费标准、内容或服务时间发生变化以实际发生为准。</p><p>（一）基础托管</p><p>  1、午托：周一至周五 12:00-14:00</p><p> 5元/天</p><p>   2、晚托A段：周一至周五 16：00-17:00&nbsp;</p><p> 5元/天</p><p>   3、晚托B段：周一至周五 17:00-18:30</p><p> 2元/天</p><p>  （二）素质拓展</p><p>  1.素质课：周一至周五17:00-18:00</p><p> 40元/课时</p><p>  <strong>三、服务内容</strong></p><p>1.午休服务(午托)：因地制宜创造校园午休氛围，午休时间不少于40分钟。</p><p>2.学业辅导：根据不同年级学生作业辅导需求，晚托安排写书面家庭作业。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>3.自主阅读/自习：在晚托时间段自由阅读健康读物。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>4.体能训练：学生在基础托管时间由老师组织参与体能训练，坚持学习之余还可以加强运动，增强体质。<span style=\"color: black;\">（具体时间由学校安排）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.艺术素养提升：根据学生的个人发展需求，第三方机构开设素质拓展课程，供学生自主选修。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>6.观看教育影片。</p><p><strong>四、委托期限：自<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>至<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>（课程开始时间）；</strong></p><p><strong>五、委托项目：详见【课程清单】</strong></p><p><strong>六、请假及退费规则</strong></p><p>1、请假可退费情况：最少提前一天于17:00前，在小程序上对次日课程请假，则对应课程可退费（素质托管课程除外）。</p><p>2、请假不可退费情况：基础托管17:00 后至次日课程考勤前，在小程序上请假或通过其他方式向老师请假，对应课程登记为缺勤，不退费；素质课程请假、缺勤均不退费不补课。 </p><p>3、无需请假可退费：因学校活动、假期、天气等原因导致以班级为单位造成停课（含基础托管及素质拓展）。 </p><p>4、请假不只是提前一天才能在小程序上操作，可以提前把需要请假的日期选择请假。</p><p>5、课后托管课程按一整学期（教育局公布的校历日期为准）服务期为收费标准，课程开始后，中途不作退费，学期结束后统一计算退费。 </p><p>6、素质托管课程按照16 节课/学期收费，学生因为个人原因请假无法正常上课的，该次课程不另安排补课，学费不予退还。</p><p>7、如因学校活动、假期、天气等原因导致以班级为单位造成停课，且不能安排到补课的，学期结束进行退费。</p><p>8、学期结束后请家长自行在小程序上，将对应课程的余额申请退费，有效期为课程结束后一个月内。 </p><p><strong>七、课后托管课程服务(含基础托管、素质托管课程)安全纪律管理制度</strong></p><p>1、参加午餐的学生需有序、安静地在走廊排队，听从午托老师的指挥，依次领取学生营养餐，学生必须在教室就餐、阅读和休息。午餐结束后，收拾好个人物品，把课室恢复原状，值日生打扫课室卫生。</p><p>2、午休期间，不准在校园内从事任何体育运动、文娱活动或游戏活动，不允许学生午睡时在教室里看书、写作业，不得在午休结束前提前起来离开。午休结束后，学生安静、快速收拾个人的午休物品，放置到指定地点，有序、安静地在走廊排队，听从午托老师的指挥，依次回到班级。</p><p>3、托管期间，学生应保持教室的安静和整洁，不得影响其他同学，不准在教室内进行追逐打闹、大声喧哗、随意走动等与托管正常秩序相冲突的一切活动，不迟到、不缺席，不早退，不随意离开教室，如需离开，需要向托管老师举手请假，得到托管老师允许才离开。</p><p>4.第三方托管老师制定好班级管理制度，并安排一名学生纪律委员，负责协助托管老师的管理，托管老师和纪律委员把当天的特殊情况及时告知班主任，便于班主任对学生进行教育及时解决问题。</p><p>5、爱护公物，损坏公物应接受教育，并按价赔偿；讲究卫生，养成良好的卫生习惯，保持室内空气、卫生良好。</p><p>6、托管期间，紧急情况，及时寻求在岗负责托管服务的老师协助。</p><p>7、家长应配合课后托管课程老师，教育学生遵守课后服务期间的有关规定，要求学生不得自行外出、擅自脱离课程老师监护，其造成的后果由家长自行承担。</p><p>8、在课后服务期间有下列行为之一的，课后托管第三方机构可终止学生课后托管课程，造成课堂机构方或他人人身伤害，或财产损失的，学生监护人应承担相应赔偿责任。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;8.1、学生多次故意伤害、侵扰其他学生或伤害、侵扰其他学生造成严重后果的；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;8.2、学生故意损毁课程老师财物造成重大损失的；</p><p>&nbsp;&nbsp;&nbsp;&nbsp;8.3、其他严重影响课后服务协议实施的行为。</p><p><strong>八、甲方权利与义务</strong></p><p>\t（一）<span style=\"color: black;\">甲方要以高度负责和敬业奉献的精神，为学生提供安全、科学的学习与生活管理，使学生各方面素质得到全面的发展和提高。</span></p><p>\t（二）<span style=\"color: black;\">因甲方故意或重大过失未能充分履行监护义务，造成学生财产或人身损害的，甲方应当承担相应赔偿责任。</span></p><p>\t<span style=\"color: black;\">（三）</span>如乙方或学生存在以下行为的，甲方可单方解除本协议，终止学生托管课程，且乙方应承担相应的赔偿责任，甲方不承担责任；如甲方承担责任后，可向乙方进行追偿。</p><p>\t1.学生故意伤害、侵扰其他学生、甲方工作人员或校外第三人，造成其他学生、甲方工作人员或校外第三人人身损害的；</p><p>\t2.学生故意损毁其他学生、甲方工作人员或校外第三人的；</p><p>\t3.学生多次严重扰乱课堂秩序的；</p><p>\t4. 其他严重影响本协议实施的行为。</p><p>\t（四）甲方应为每位参加托管的学生购买保险。</p><p><strong>九、乙方义务</strong></p><p>\t<span style=\"color: black;\">（一）乙方要配合甲方为学生创造良好的学习条件和氛围，教育学生遵守托管期间的有关规定，不得自行外出、擅自脱离甲方监护，如学生不服从安排外出玩耍或进行其他未约定的活动，造成人身和财产损害的，甲方不承担相应的责任。</span></p><p>\t<span style=\"color: black;\">（二）乙方应于托管开始一周前及托管过程中及时向甲方汇报学生健康情况，如学生患有传染性疾病或其他不适宜托管的疾病，甲方有权根据学生病情做出合理处置或拒绝学生参加托管。</span></p><p>\t<span style=\"color: black;\">（三）如存在下列情况，乙方不得向甲方提出任何赔偿或补偿要求：</span></p><p>\t<span style=\"color: black;\">1. 战争、自然灾害、传染性疾病等不可抗力造成学生人身或财产损害的；</span></p><p>\t<span style=\"color: black;\">2.学生有特异体质、特定疾病或者异常心理状态，托管期间造成人身损害的；</span></p><p>\t<span style=\"color: black;\">3.因战争、自然灾害、传染性疾病等不可抗力致使本协议无法继续履行的，双方互不承担违约责任，受不可抗力影响的一方应及时书面通知对方，双方按照实际情况结算(或协商结算 ) 费用.</span></p><p><strong>十、违纪处理</strong></p><p>1、托管期间，经托管老师的耐心劝导、教育后仍不改正，视为违纪。违纪第一次、第二次的同学，将收到《课后托管违纪告知书》（详见附件一），经托管老师签名，学生签名，家长签名后交班主任存档。</p><p>2、违纪第三次，停托一周。</p><p>3、停托一周后，可再次回来学校参加托管。若再次违纪，停托一个月。</p><p>4、停托一个月后，可再次回来学校参加托管。若再次违纪，本学期托管暂停。</p><p>5、因违纪原因停托期间，课后托管课程仅登记但不退费。</p><p><strong>十一、购买个人保险</strong></p><p><strong>甲方为每位参加托管的学生购买相关的保险，</strong>甲方有义务提供安全的学习条件，确保学生托管期间履行监护义务。对因提供条件不当、甲方故意或重大过失未能充分履行监护义务，造成学生财产或人身损害的，甲方及其负责人应当承担相应赔偿责任。因下列原因或者学生擅自脱离监护发生意外事故而致人身或者财产损失的，甲方已履行了相应职责，行为并无不当的，乙方不得向甲方和校方提出赔偿要求。</p><p>1、地震、雷击、台风、洪水等不可抗拒的自然因素造成的；</p><p>2、学生有特异体质、特定疾病或者异常心理状态，甲方不知道或者难于知道的；</p><p>3、其它难预料的意外因素造成的。</p><p><strong>十二、合同解除</strong></p><p>1.乙方不打招呼，擅自离校转学，或者不再符合托管条件的，甲方有权解除本协议。</p><p>2.违纪超过5次，经过老师和家长沟通之后，仍屡教不改的，甲方可视具体情况取消该学生的托管资格。</p><p>3.如学生自身存在疾病，乙方需在开学第一周及时向学校和甲方如实告知情况，学校和甲方有权根据学生病情作出合理的安排。</p><p><strong>十三、本协议自双方签字或盖章之日起生效，请家长签字后将协议交学校备案。未尽事宜，由甲乙双方协商解决，协商不成的，按照《合同法》的有关规定处理。</strong></p><p><img src=\"https://linkjoint.oss-cn-shenzhen.aliyuncs.com/linkjoint-student-oa/avatar/xingxing.png\" height=\"159\" width=\"159\"></p><p>甲方（盖章）：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乙方（签字）：_____________ </p><p>广州市越秀区新城市教育培训中心&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>日期：<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>日</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>附件一：</p><p class=\"ql-align-center\"><strong>课后托管违纪告知书</strong></p><p class=\"ql-align-center\"><strong>&nbsp;</strong></p><p>\t学生姓名：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年级班级：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>（午托/晚托/素质课程）期间违反课后托管管理制度，特此提醒教育一次。</p><p>\t注：参加托管的同学应遵守学校管理纪律，如严重违反托管纪律的，第一次、第二次书面提醒教育，第三次书面提醒教育即停止托管一周，第四次书面提醒教育即停止托管一个月，第五次书面提醒教育即取消该生本学期的托管资格，因违纪原因停托期间，课后托管课程登记缺勤不退费。</p><p>&nbsp;</p><p>托管老师签名：__________&nbsp;学生签名：_________ 班主任签名：__________</p><p><u>&nbsp;</u></p><p class=\"ql-align-right\"><u>&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>日</p><p>*上联机构留底，下联家长签名后交回班主任处。</p><p class=\"ql-align-center\"><strong>课后托管违纪告知书</strong></p><p class=\"ql-align-center\"><strong>&nbsp;</strong></p><p>\t您好！由于您的孩子在<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>日（午托/晚托/素质课程）期间违反课后托管管理制度，特此提醒教育一次。请您务必督促、教育孩子遵守学校纪律。</p><p>\t注：参加托管的同学应遵守学校管理纪律，如严重违反托管纪律的，第一次、第二次书面提醒教育，第三次书面提醒教育即停止托管一周，第四次书面提醒教育即停止托管一个月，第五次书面提醒教育即取消该生本学期的托管资格，因违纪原因停托期间，课后托管课程登记缺勤不退费。</p><p>&nbsp;</p><p>托管老师签名：__________&nbsp;学生签名：_________&nbsp;家长签名：___________</p><p><u>&nbsp;</u></p><p class=\"ql-align-right\"><u>&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>日</p><p><br></p>";
        StringBuffer sbf = new StringBuffer();
        sbf.append("<html><body>");
        sbf.append(content);
        sbf.append("</body></html");
        exportWord(request,response,String.valueOf(sbf),"word1");
        return 1;
    }


    /**
     *
     * @param request
     * @param response
     * @param content  富文本内容
     * @param fileName 生成word名字
     * @throws Exception
     */
    public static void exportWord(HttpServletRequest request, HttpServletResponse response, String content, String fileName) throws Exception {
        byte b[] = content.getBytes("utf-8"); //这里是必须要设置编码的，不然导出中文就会乱码。
        ByteArrayInputStream bais = new ByteArrayInputStream(b);//将字节数组包装到流中


        POIFSFileSystem poifs = new POIFSFileSystem();
        DirectoryEntry directory = poifs.getRoot();
        DocumentEntry documentEntry = directory.createDocument("WordDocument", bais); //该步骤不可省略，否则会出现乱码。
        //输出文件
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/msword");//导出word格式
        response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("导出任务数据.doc", "utf-8"));

        ServletOutputStream ostream = response.getOutputStream();
        poifs.writeFilesystem(ostream);  //将poifs输出ostream


        bais.close();
        ostream.close();
        poifs.close();
    }


//~~~~~~~~~~~~~~~~~~~~~~~~~~~``````





}

