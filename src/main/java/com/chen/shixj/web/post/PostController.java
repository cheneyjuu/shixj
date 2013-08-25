package com.chen.shixj.web.post;

import com.chen.shixj.entity.Nav;
import com.chen.shixj.entity.Post;
import com.chen.shixj.service.nav.NavService;
import com.chen.shixj.service.post.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * User: jpm
 * Date: 13-8-20
 * Time: 下午1:20
 */
@Controller
@RequestMapping(value = "/admin/post")
public class PostController {
    private static final int PAGE_SIZE = 15;

    @Autowired
    private PostService postService;

    @Autowired
    private NavService navService;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        //查询所有一级文章栏目
        List<Nav> navList = navService.getAllNavWithNavTypeParentNav(1,0L);
        List resultList = new ArrayList();
        for (Nav nav : navList) {
            resultList.add(nav);
            long parentNav = nav.getId();
            List<Nav> subNavList = navService.getAllNavWithNavTypeParentNav(1,parentNav);
            resultList.addAll(subNavList);
        }
        model.addAttribute("navList", resultList);
        return "/admin/post/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@Valid Post post, @RequestParam(value = "navId") Long navId,RedirectAttributes redirectAttributes) {
        Nav nav = navService.getNav(navId);
        post.setNav(nav);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String createTime = simpleDateFormat.format(new Date());
        post.setPostCreateDate(createTime);
        postService.savePost(post);
        redirectAttributes.addAttribute("errorMessage", "添加文章成功");
        return "redirect:/admin/post/add";
    }
    //获得单个栏目的数据根据栏目id 和搜索条件查询
    @RequestMapping (value = "/postList" ,method = RequestMethod.POST)
    public String listForNavId(@RequestParam(value = "navId") int navId,@RequestParam(value ="parameter") String parameter,@RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model){
        Page<Post> postPage = postService.pagePost(pageNumber, PAGE_SIZE, navId,parameter);
        model.addAttribute("postPage", postPage);

        //查询所有一级文章栏目
        List<Nav> navList = navService.getAllNavWithNavTypeParentNav(1,0L);
        List resultList = new ArrayList();
        for (Nav nav : navList) {
            resultList.add(nav);
            long parentNav = nav.getId();
            List<Nav> subNavList = navService.getAllNavWithNavTypeParentNav(1,parentNav);
            resultList.addAll(subNavList);
        }
        model.addAttribute("navList", resultList);
        model.addAttribute("selectNavId",navId);
        model.addAttribute("parameter",parameter);
        return "/admin/post/postList";
    }
    //获得所有栏目的数据
    @RequestMapping (value = "/postList" ,method = RequestMethod.GET)
    public String listAll(@RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model){
        //查找所有文章
        Page<Post> postPage = postService.pagePost(pageNumber, PAGE_SIZE);
        model.addAttribute("postPage", postPage);

        //查询所有一级文章栏目
        List<Nav> navList = navService.getAllNavWithNavTypeParentNav(1,0L);
        List resultList = new ArrayList();
        for (Nav nav : navList) {
            resultList.add(nav);
            long parentNav = nav.getId();
            List<Nav> subNavList = navService.getAllNavWithNavTypeParentNav(1,parentNav);
            resultList.addAll(subNavList);
        }
        model.addAttribute("navList", resultList);
        return "/admin/post/postList";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("post", postService.getPost(id));

        //查询所有一级文章栏目
        List<Nav> navList = navService.getAllNavWithNavTypeParentNav(1,0L);
        List resultList = new ArrayList();
        for (Nav nav : navList) {
            resultList.add(nav);
            long parentNav = nav.getId();
            List<Nav> subNavList = navService.getAllNavWithNavTypeParentNav(1,parentNav);
            resultList.addAll(subNavList);
        }
        model.addAttribute("navList", resultList);

        return "/admin/post/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("perloadPost") Post post,RedirectAttributes redirectAttributes) {
        postService.savePost(post);
        redirectAttributes.addFlashAttribute("message", "更新文章成功");

        return "redirect:/admin/post/postList";
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        postService.deletePost(id);
        redirectAttributes.addFlashAttribute("message", "删除文章成功");
        return "redirect:/admin/post/postList";
    }

    @ModelAttribute(value = "perloadPost")
    public Post getPost(@RequestParam(value = "id", required = false) Long id) {
        if (id != null) {
            return postService.getPost(id);
        }
        return null;
    }
}
