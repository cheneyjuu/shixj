package com.chen.shixj.web.infoImage;

import com.chen.shixj.entity.Info;
import com.chen.shixj.entity.InfoImage;
import com.chen.shixj.service.info.InfoService;
import com.chen.shixj.service.infoImage.InfoImageService;
import com.chen.shixj.utility.HandlerUpload;
import com.chen.shixj.web.info.InfoController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * User: jpm
 * Date: 13-8-25
 * Time: 下午8:30
 */
@Controller
@RequestMapping(value = "/admin/infoImage")
public class InfoImageController {
    @Autowired
    private InfoImageService infoImageService;
    @Autowired
    private InfoService infoService;

    @RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
    public String add(@PathVariable("id") Long infoId, Model model) {
        model.addAttribute("infoId", infoId);
        return "/admin/infoImage/add";
    }

    //增加多个文件
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@RequestParam(value = "fileNameList", required = false) List<String> fileNameList, @RequestParam(value = "infoId") Long infoId, RedirectAttributes redirectAttributes) {
        Info info = infoService.getInfo(infoId);
        //处理图片路径
        if (fileNameList != null) {
            for (String fileName : fileNameList) {
                if (fileName != "") {
                    InfoImage infoImage = new InfoImage();
                    String[] str = fileName.split("/");
                    String imageName = str[str.length - 1];
                    String imagePath = fileName.substring(0, fileName.length() - imageName.length());
                    infoImage.setMobileImageName("m_" + imageName);
                    infoImage.setOriginImageName("or_" + imageName);
                    infoImage.setPcImageName("pc_" + imageName);
                    infoImage.setImagePath(imagePath);
                    infoImage.setInfo(info);
                    infoImageService.saveInfoImage(infoImage);
                }
            }
        }
        redirectAttributes.addAttribute("message", "添加产品图片成功");
        return "redirect:/admin/infoImage/add";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(@RequestParam(value = "infoId") Long infoId, Model model) {
        List<InfoImage> infoImageList = infoImageService.getAllInfoImageWithInfoId(infoId);

        model.addAttribute("list", infoImageList);
        return "/admin/infoImage/list";
    }

    @RequestMapping(value = "/update/{id}/{navType}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long infoId,@PathVariable("navType") int navType, Model model) {
        model.addAttribute("infoId", infoId);
        Info info = infoService.getInfo(infoId);
        Set<InfoImage> infoImageSet = info.getInfoImages();
        List<InfoImage> infoImageList = new ArrayList<InfoImage>();
        infoImageList.addAll(infoImageSet);
        model.addAttribute("infoImageList", infoImageList);
        model.addAttribute("navType",navType);
        return "/admin/infoImage/update";
    }

    @RequestMapping(value = "/update/{navType}", method = RequestMethod.POST)
    public String update(@RequestParam(value = "infoId") Long infoId, @PathVariable("navType") int navType,@RequestParam(value = "fileNameList", required = false) List<String> fileNameList, RedirectAttributes redirectAttributes) {
        Info info = infoService.getInfo(infoId);
        //增加新的产品图片
        if (fileNameList != null) {
            for (String fileName : fileNameList) {
                if (fileName != "") {
                    //处理图片路径
                    InfoImage infoImage = new InfoImage();
                    String[] str = fileName.split("/");
                    String imageName = str[str.length - 1];
                    String imagePath = fileName.substring(0, fileName.length() - imageName.length());
                    infoImage.setMobileImageName("m_" + imageName);
                    infoImage.setOriginImageName("or_" + imageName);
                    infoImage.setPcImageName("pc_" + imageName);
                    infoImage.setImagePath(imagePath);
                    infoImage.setInfo(info);
                    infoImageService.saveInfoImage(infoImage);
                }
            }
        }
        redirectAttributes.addFlashAttribute("message", "更新产品图片成功");
        return "redirect:/admin/infoImage/update/" + infoId+"/"+navType;
    }

    @RequestMapping(value = "/delete/{id}/{navType}")
    public String delete(@PathVariable("id") Long id,@PathVariable("navType") int navType, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        InfoImage infoImage = infoImageService.getInfoImage(id);
        Long infoId = infoImage.getInfo().getId();

        //删除物理文件
        String filePath = infoImage.getImagePath();
        String realPath = request.getSession().getServletContext().getRealPath(filePath) + "/";
        String fileName = infoImage.getPcImageName();
        String fileAddress = realPath + fileName.substring(3, fileName.length());
        String fileAddress1 = realPath + infoImage.getPcImageName();
        String fileAddress2 = realPath + infoImage.getMobileImageName();
        String fileAddress3 = realPath + infoImage.getOriginImageName();

        HandlerUpload hu = new HandlerUpload();
        hu.DeleteFolder(fileAddress);
        hu.DeleteFolder(fileAddress1);
        hu.DeleteFolder(fileAddress2);
        hu.DeleteFolder(fileAddress3);


        infoImageService.deleteInfoImage(id);
        redirectAttributes.addFlashAttribute("message", "删除产品图片成功");
        return "redirect:/admin/infoImage/update/" + infoId+"/"+navType;
    }

    @ModelAttribute(value = "perloadInfoImage")
    public InfoImage getInfoImage(@RequestParam(value = "id", required = false) Long id) {
        if (id != null) {
            return infoImageService.getInfoImage(id);
        }
        return null;
    }

    private String urlStr(int navType){
        if (navType == 0){//
            return "share";
        }else if(navType == 1){
            return "groupBuying";
        }else if(navType == 2){
            return "festival";
        }else if(navType == 3){
            return "classroom";
        }else if(navType == 4){
            return "story";
        }else if(navType == 5){
            return "partner";
        }else if(navType == 6){
            return "about";
        }else {
            return "share";
        }
//        =0食享食分；=1团购实惠；=2有礼有节；=3食享课堂；=4品牌故事；=5合作伙伴；=6关于我们；
    }
}
