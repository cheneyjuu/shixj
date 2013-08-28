package com.chen.shixj.web.story;

import com.chen.shixj.entity.*;
import com.chen.shixj.service.story.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * User: jpm
 * Date: 13-8-21
 * Time: 上午9:44
 */
@Controller
@RequestMapping(value = "/admin/story")
public class StoryController {
    private static final int PAGE_SIZE = 15;

    @Autowired
    private StoryService storyService;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {

        return "/admin/story/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@Valid Story story, @RequestParam(value = "fileNameList", required = false) List<String> fileNameList, RedirectAttributes redirectAttributes) {
        //处理图片路径
        Set<StoryImage> storyImages = new HashSet<StoryImage>();
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
                    storyImages.add(storyImage);
                }
            }
        }
        story.setStoryImages(storyImages);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String createTime = simpleDateFormat.format(new Date());
        story.setStoryCreateDate(createTime);
        storyService.saveStory(story);
        redirectAttributes.addAttribute("message", "添加故事成功");

        return "redirect:/admin/story/add";
    }

    @RequestMapping(value = "/look/{id}", method = RequestMethod.GET)
    public String look(@PathVariable("id") Long id, Model model) {

        model.addAttribute("story", storyService.getStory(id));
        return "/admin/story/look";
    }

    //获得搜索条件查询
    @RequestMapping(value = "/storyList", method = RequestMethod.POST)
    public String listForNavId(@RequestParam(value = "parameter") String parameter, @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model) {
        Page<Story> storyPage = storyService.pageStory(pageNumber, PAGE_SIZE, parameter);
        model.addAttribute("storyPage", storyPage);

        model.addAttribute("parameter", parameter);
        return "/admin/story/storyList";
    }

    //获得所有栏目的数据
    @RequestMapping(value = "/storyList", method = RequestMethod.GET)
    public String listAll(@RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model) {
        //查找所有文章
        Page<Story> storyPage = storyService.pageStory(pageNumber, PAGE_SIZE);
        model.addAttribute("storyPage", storyPage);
        return "/admin/story/storyList";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("story", storyService.getStory(id));

        return "/admin/story/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("perloadStory") Story story, RedirectAttributes redirectAttributes) {
        storyService.saveStory(story);
        redirectAttributes.addFlashAttribute("message", "更新故事成功");

        return "redirect:/admin/story/storyList";
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        storyService.deleteStory(id);
        redirectAttributes.addFlashAttribute("message", "删除故事成功");
        return "redirect:/admin/story/storyList";
    }

    @ModelAttribute(value = "perloadStory")
    public Story getStory(@RequestParam(value = "id", required = false) Long id) {
        if (id != null) {
            return storyService.getStory(id);
        }
        return null;
    }
}
