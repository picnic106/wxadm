package com.yaolan.wxacm.web.controller;

import com.yaolan.wxacm.core.spring.ConfigurerInfo;
import com.yaolan.wxacm.core.util.HttpClientUtils;
import com.yaolan.wxacm.core.util.ImgUtils;
import com.yaolan.wxacm.core.util.StringUtils;
import com.yaolan.wxacm.web.model.Message;
import com.yaolan.wxacm.web.model.Prize;
import com.yaolan.wxacm.web.service.PrizeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by Yaolan on 2015/8/14.
 */
@Controller
@RequestMapping("/pz")
public class PrizeController {
    Logger logger= Logger.getLogger(PrizeController.class);

    @Autowired
    private PrizeService prizeService;

    @RequestMapping(value = "/list")
    public String listAll(Model model,HttpServletRequest request) {
        List<Prize> prizeList=prizeService.selectList();
        //model.addAttribute("ms",ms);
        //logger.info("ms:" + request.getAttribute("ms"));

        //request.setAttribute("ms",ms);
        model.addAttribute(prizeList);
        return "/pz/prize";
    }

    @RequestMapping(value = "/listByAc")
    public String listAllByAc(Model model,HttpServletRequest request) {
        String acid=request.getParameter("acid");
        List<Prize> prizeList=prizeService.selectPrizeByAc(Long.parseLong(acid));
        model.addAttribute(prizeList);
        model.addAttribute("from","ac");
        return "/pz/prize";
    }




    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(Prize prize,  Model model, HttpServletRequest request,@RequestParam("formfile") MultipartFile file) {
        model.addAttribute("menu","2");
        logger.info("file:" + file.getOriginalFilename() + " " + file.getContentType());
        String imgurl= null;//将文件上传到服务器上
        try {
            imgurl = ImgUtils.UpFile(file.getBytes());
            prize.setImgUrl(ImgUtils.getOrgImgUrl(imgurl));
            prize.setTinyImgUrl(ImgUtils.getTinyImgUrl(imgurl));
            prize.setCreateTime(new Date());
            int i=prizeService.insert(prize);
            //model.addAttribute("pz",prize);
            model.addAttribute("ms",new Message("添加奖品成功！！"));
            return "forward:/rest/pz/list";
            //return "/pz/add_pz";
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("menu","3");
            model.addAttribute("pz",prize);
            model.addAttribute("ms",new Message("添加奖品失败！！"));
            return "/pz/add_pz";
        }

    }


    @RequestMapping(value = "/queryByid")
    public String queryByid(Long id,  Model model, HttpServletRequest request) {
        Prize pz=null;
        if (id!=null){
             pz=prizeService.selectById(id);
        }
        model.addAttribute("pz",pz);
        return "/pz/add_pz";
    }

    @RequestMapping(value = "/delete")
   // @RequestMapping(value = "/delete")
    public String delete(Long id,   HttpServletRequest request,RedirectAttributes attr) {
        if (id!=null){
            List<Prize> p=prizeService.selectPrizeByPz(id);
            if(p!=null&&p.size()>0){
                //request.setAttribute("ms","此奖品已存在关联活动，请先在活动中删除本奖品！！");

                attr.addFlashAttribute("ms", new Message("此奖品已存在关联活动，请先在活动中删除本奖品！！"));
            }else {
                int i = prizeService.delete(id);
                if (i>=1){
                    attr.addFlashAttribute("ms", new Message("删除奖品成功！！"));
                }else{
                    attr.addFlashAttribute("ms", new Message("删除奖品失败！！"));
                }
                logger.info("删除成功:" + id);
            }
        }

        return "redirect:/rest/pz/list";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update(Prize prize,  Model model, HttpServletRequest request,@RequestParam("formfile") MultipartFile file) {
        model.addAttribute("menu","2");

        String imgurl= null;//将文件上传到服务器上
        try {
            if (!file.isEmpty()) {
                imgurl = ImgUtils.UpFile(file.getBytes());
                prize.setImgUrl(ImgUtils.getOrgImgUrl(imgurl));
                prize.setTinyImgUrl(ImgUtils.getTinyImgUrl(imgurl));
            }
            prize.setId(prize.getId());

            int i=prizeService.update(prize);
            //model.addAttribute("pz",prize);
            model.addAttribute("ms",new Message("修改奖品成功！！"));
            //return "/pz/add_pz";
            return "forward:/rest/pz/list";
        } catch (IOException e) {
            e.printStackTrace();
            //model.addAttribute("pz",prize);
            model.addAttribute("ms",new Message("修改奖品失败！！"));
            return "/pz/add_pz";
        }

    }
}
