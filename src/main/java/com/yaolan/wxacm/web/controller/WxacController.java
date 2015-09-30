package com.yaolan.wxacm.web.controller;

import com.yaolan.wxacm.core.spring.ConfigurerInfo;
import com.yaolan.wxacm.core.util.FileUtils;
import com.yaolan.wxacm.core.util.HttpClientUtils;
import com.yaolan.wxacm.core.util.ImgUtils;
import com.yaolan.wxacm.core.util.StringUtils;
import com.yaolan.wxacm.web.model.Message;
import com.yaolan.wxacm.web.model.Prize;
import com.yaolan.wxacm.web.model.Wxac;
import com.yaolan.wxacm.web.service.PrizeService;
import com.yaolan.wxacm.web.service.WxacService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Yaolan on 2015/8/12.
 */
@Controller
@RequestMapping("/ac")
public class WxacController {
    Logger logger=Logger.getLogger(WxacController.class);

    @Autowired
    private WxacService wxacService;

    @Autowired
    private PrizeService prizeService;

    @RequestMapping(value = "/list")
    public String listAll(Model model) {
        List<Wxac> wxacList=wxacService.selectList();
        //model.addAttribute("ms",ms);
        model.addAttribute(wxacList);
        //ms.setMessage("list测试成功");
        //model.addAttribute("ms",ms);
        return "/ac/activity";
    }


    @RequestMapping(value = "/save_ac_pz")
    public String save_ac_pz(Long acid,Long pzid,Model model) {
        logger.info("save_ac_pz:" + acid);
        wxacService.savePzAc(acid,pzid);
        model.addAttribute("acid",acid);
        model.addAttribute("active","pzxx");
        add_after(acid,model);
        Wxac wxac= wxacService.selectById(acid);
        model.addAttribute("wxac",wxac);
        model.addAttribute("ms",new Message("添加奖品成功！！"));
        //return "redirect:/rest/ac/add_after";
        return "/ac/add_ac";
    }


    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(Wxac wxac,  Model model, HttpServletRequest request,@RequestParam("formfile") MultipartFile file) {
        logger.info("file:" + file.getOriginalFilename() + " " + file.getContentType());
        String imgurl= null;//将文件上传到服务器上
        try {
            imgurl = ImgUtils.UpFile(file.getBytes());
            wxac.setImgUrl(ImgUtils.getOrgImgUrl(imgurl));
            wxac.setTinyImgUrl(ImgUtils.getTinyImgUrl(imgurl));
            wxac.setStats(0);
            wxac.setCreateTime(new Date());
            int i=wxacService.insert(wxac);
            wxac.setId(wxac.getId());


            model.addAttribute("wxac",wxac);
            Long acid=wxac.getId();
            model.addAttribute("acid",acid);
            logger.info("wxac_id:" +acid);
            model.addAttribute("active","pzxx");
            model.addAttribute("ms",new Message("添加活动成功,请继续添加奖品！！"));
            add_after(acid,model);
            //return "forward:add_after";
            //return "/ac/add_ac";
            //return "/ac/add_ac";
            //redirect:
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("ms",new Message("添加活动失败了，请联系后台管理员！！"));

        }
        return "/ac/add_ac";

    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update(Wxac wxac,  Model model, HttpServletRequest request,@RequestParam("formfile") MultipartFile file) {
        logger.info("file:" + file.getOriginalFilename() + " " + file.getContentType());
        String imgurl= null;//将文件上传到服务器上
        try {
            if (!file.isEmpty()) {
                imgurl = ImgUtils.UpFile(file.getBytes());
                wxac.setImgUrl(ImgUtils.getOrgImgUrl(imgurl));
                wxac.setTinyImgUrl(ImgUtils.getTinyImgUrl(imgurl));

            }

           // wxac.setCreateTime(new Date()); //将来补上修改时间

            int i=wxacService.update(wxac);

            if (i>=1){
                model.addAttribute("ms",new Message("修改活动成功!!"));
            }else{
                model.addAttribute("ms",new Message("修改活动失败!!"));
            }
            //wxac.setId(wxac.getId());
            //model.addAttribute("wxac",wxac);
            //Long acid=wxac.getId();
            //model.addAttribute("acid",acid);
            //logger.info("wxac_id:" +acid);
            //return "redirect:/rest/ac/add_after";
            return "forward:/rest/ac/list";
            //redirect:
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("ms",new Message("修改活动失败，请检查是否操作不当或者联系管理员!"));
            return "/ac/add_ac";
        }

    }

    @RequestMapping(value = "/deleteByF")
    public String deleteByF(Long id,Long pzid,Model model){
        int j=wxacService.deleteByFKey(id,pzid);
        if (j>=1){
            model.addAttribute("ms",new Message("删除奖品成功！！"));
        }else{
            model.addAttribute("ms",new Message("删除奖品失败！！"));
        }
        model.addAttribute("active","pzxx");
        add_after(id,model);
        return "/ac/add_ac";
        //return "redirect:/rest/ac/add_after?acid="+id;
    }

    @RequestMapping(value = "/delete")
    public String delete(Wxac wxac,Long id, Model model, HttpServletRequest request){
       if (id!=null){
           List<Prize> prizeList=prizeService.selectPrizeByAc(id);
           if (prizeList!=null&&prizeList.size()>0){
               model.addAttribute("ms",new Message("此活动存在关联奖品，请先编辑活动并删除奖品！！"));
           }else {
               //int j=wxacService.deleteByFKey(id);
               int i = wxacService.delete(id);
               if (i>=1){
                   model.addAttribute("ms",new Message("删除活动成功！！"));
               }else{
                   model.addAttribute("ms",new Message("删除活动失败！！"));
               }
               logger.info("删除成功:" + id);
           }
       }
        //return "/ac/activity";
        return "forward:/rest/ac/list";
    }


    public void findPrize(Long acid, Model model){
        List<Prize> prizeList=prizeService.selectPrizeByAc(acid);
        List<Prize> prizeAllList=prizeService.selectPrizeByAcStats(1);
        logger.info("prizeAllList:" + prizeAllList.size());
        model.addAttribute("prizeList",prizeList);
        model.addAttribute("prizeAllList",prizeAllList);
    }


    @RequestMapping(value = "/add_after")
    public String add_after(Long acid, Model model){
        logger.info("wxac_acid:" + acid);
        //String acid2=request.getParameter("acid");
        //logger.info("acid:" + acid2);
        //logger.info("wxac:" + wxac);
//        if (wxac==null||(wxac.getId()==null)||(wxac.getName()==null&&wxac.getIntro()==null)){
//            logger.info("wxac2:" + wxac);
//              //根据主键取出ac
      Wxac    wxac= wxacService.selectById(acid);
//        }
        //if (wxac.getId()==null){
        //    wxac.setId(acid);
        //}
        findPrize(acid,model);
//        List<Prize> prizeList=prizeService.selectPrizeByAc(acid);
//        List<Prize> prizeAllList=prizeService.selectPrizeByAcStats(1);
//        logger.info("prizeAllList:" + prizeAllList.size());
//        model.addAttribute("prizeList",prizeList);
//        model.addAttribute("prizeAllList",prizeAllList);
        model.addAttribute("wxac",wxac);
        //model.addAttribute("ms",ms);
        //model.addAttribute("active",active);
        //logger.info("wxac_add_after:" + wxac.getId()+";"+wxac.getName()+";"+wxac.getType());
        return "/ac/add_ac";
    }

    @RequestMapping(value = "/updateStats",method = RequestMethod.POST)
    public void updateStats(Model model,Integer stats,Integer acid,HttpServletRequest request,HttpServletResponse response) {
        logger.info("updateStats,stats="+stats+",acid="+acid);
        int updates=wxacService.updateStats(stats,acid);
        renderData(response,String.valueOf(updates));
    }

    @RequestMapping(value = "/updateStats_test",method = RequestMethod.POST)
    public void updateStats_test(Model model,String result,HttpServletRequest request,HttpServletResponse response) {
        logger.info("result,result="+result);
        //int updates=wxacService.updateStats(stats,acid);
        try {
            Thread.sleep(100);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        renderData(response,result!=null?"true":"false");
    }

    @RequestMapping(value = "/selectCharts")
    public String selectCharts(Model model,Long acid,HttpServletRequest request,HttpServletResponse response) {
        logger.info("selectCharts,acid="+acid);
        List<Map<String,Object>> signUsers=wxacService.selectCharts(acid);
        model.addAttribute("charts",signUsers);
        return "/ac/baby_charts";
    }

    @RequestMapping(value = "/selectSignUpUsers")
    public String selectSignUpUsers(Model model,Long acid,HttpServletRequest request,HttpServletResponse response) {
        logger.info("selectSignUpUsers,acid="+acid);
        List<Map<String,Object>> signUsers=wxacService.selectSignUpUsers(acid);
        model.addAttribute("signUsers",signUsers);
        return "/ac/sing_up_users";
    }

    /**
     * 通过PrintWriter将响应数据写入response，ajax可以接受到这个数据
     *
     * @param response
     * @param data
     */
    private void renderData(HttpServletResponse response, String data) {
        PrintWriter printWriter = null;
        try {
            printWriter = response.getWriter();
            printWriter.print(data);
        } catch (IOException ex) {
            logger.info("ioex:"+ex);
        } finally {
            if (null != printWriter) {
                printWriter.flush();
                printWriter.close();
            }
        }
    }



    /**
     * form表单提交 Date类型数据绑定
     * <功能详细描述>
     * @param binder
     * @see [类、类#方法、类#成员]
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
