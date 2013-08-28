package com.chen.shixj.web.storyImage;

import com.chen.shixj.entity.Story;
import com.chen.shixj.entity.StoryImage;
import com.chen.shixj.service.story.StoryService;
import com.chen.shixj.service.storyImage.StoryImageService;
import com.chen.shixj.utility.HandlerUpload;
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
@RequestMapping(value = "/admin/storyImage")
public class StoryImageController {
    @Autowired
    private StoryImageService storyImageService;

    @Autowired
    private StoryService storyService;

    @RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
    public String add(@PathVariable("id") Long storyId, Model model) {
        model.addAttribute("storyId", storyId);
        return "/admin/storyImage/add";
    }

    //增加多个文件
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@RequestParam(value = "fileNameList", required = false) List<String> fileNameList, @RequestParam(value = "storyId") Long storyId, RedirectAttributes redirectAttributes) {
        Story story = storyService.getStory(storyId);
        //处理图片路径
        if (fileNameList != null) {
            for (String fileName : fileNameList) {
                if (fileName != "") {
                    StoryImage storyImage = new StoryImage();
                    String[] str = fileName.split("/");
                    String imageName = str[str.length - 1];
                    String imagePath = fileName.substring(0, fileName.length() - imageName.length());
                    storyImage.setMobileImageName("m_" + imageName);
                    storyImage.setOriginImageName("or_" + imageName);
                    storyImage.setPcImageName("pc_" + imageName);
                    storyImage.setImagePath(imagePath);
                    storyImage.setStory(story);
                    storyImageService.saveStoryImage(storyImage);
                }
            }
        }
        redirectAttributes.addAttribute("message", "添加产品图片成功");
        return "redirect:/admin/storyImage/add";
    }

    @RequestMapping(value = "/storyImageList", method = RequestMethod.GET)
    public String list(@RequestParam(value = "storyId") Long storyId, Model model) {
        List<StoryImage> storyImageList = storyImageService.getAllStoryImageWithStoryId(storyId);

        model.addAttribute("storyImageList", storyImageList);
        return "/admin/storyImage/storyImageList";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long storyId, Model model) {
        model.addAttribute("storyId", storyId);
        Story story = storyService.getStory(storyId);
        Set<StoryImage> storyImageSet = story.getStoryImages();
        List<StoryImage> storyImageList = new ArrayList<StoryImage>();
        storyImageList.addAll(storyImageSet);
        model.addAttribute("storyImageList", storyImageList);
        return "/admin/storyImage/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam(value = "storyId") Long storyId, @RequestParam(value = "fileNameList", required = false) List<String> fileNameList, RedirectAttributes redirectAttributes) {
        Story story = storyService.getStory(storyId);
        if (fileNameList != null) {
            //增加新的产品图片
            for (String fileName : fileNameList) {
                if (fileName != "") {
                    //处理图片路径
                    StoryImage storyImage = new StoryImage();
                    String[] str = fileName.split("/");
                    String imageName = str[str.length - 1];
                    String imagePath = fileName.substring(0, fileName.length() - imageName.length());
                    storyImage.setMobileImageName("m_" + imageName);
                    storyImage.setOriginImageName("or_" + imageName);
                    storyImage.setPcImageName("pc_" + imageName);
                    storyImage.setImagePath(imagePath);
                    storyImage.setStory(story);
                    storyImageService.saveStoryImage(storyImage);
                }
            }
        }
        redirectAttributes.addFlashAttribute("message", "更新产品图片成功");
        return "redirect:/admin/storyImage/update/" + storyId;
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        StoryImage storyImage = storyImageService.getStoryImage(id);
        Long storyId = storyImage.getStory().getId();

        //删除物理文件
        String filePath = storyImage.getImagePath();
        String realPath = request.getSession().getServletContext().getRealPath(filePath) + "/";
        String fileName = storyImage.getPcImageName();
        String fileAddress = realPath + fileName.substring(3, fileName.length());
        String fileAddress1 = realPath + storyImage.getPcImageName();
        String fileAddress2 = realPath + storyImage.getMobileImageName();
        String fileAddress3 = realPath + storyImage.getOriginImageName();

        HandlerUpload hu = new HandlerUpload();
        hu.DeleteFolder(fileAddress);
        hu.DeleteFolder(fileAddress1);
        hu.DeleteFolder(fileAddress2);
        hu.DeleteFolder(fileAddress3);


        storyImageService.deleteStoryImage(id);
        redirectAttributes.addFlashAttribute("message", "删除产品图片成功");
        return "redirect:/admin/storyImage/update/" + storyId;
    }

    @ModelAttribute(value = "perloadStoryImage")
    public StoryImage getStoryImage(@RequestParam(value = "id", required = false) Long id) {
        if (id != null) {
            return storyImageService.getStoryImage(id);
        }
        return null;
    }
}
