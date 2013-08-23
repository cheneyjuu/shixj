package com.chen.shixj.web.product;

import com.chen.shixj.entity.Nav;
import com.chen.shixj.entity.Product;
import com.chen.shixj.entity.ProductImage;
import com.chen.shixj.repository.ProductImageDao;
import com.chen.shixj.service.nav.NavService;
import com.chen.shixj.service.product.ProductService;
import com.chen.shixj.service.productImage.ProductImageService;
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
 * Date: 13-8-21
 * Time: 上午9:44
 */
@Controller
@RequestMapping(value = "/admin/product")
public class ProductController {
    private static final int PAGE_SIZE = 15;

    @Autowired
    private ProductService productService;

    @Autowired
    private NavService navService;

    @Autowired
    private ProductImageService productImageService;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        //查询所有一级文章栏目
        List<Nav> navList = navService.getAllNavWithNavTypeParentNav(0,0);
        List resultList = new ArrayList();
        for (Nav nav : navList) {
            resultList.add(nav);
            long parentNav = nav.getId();
            List<Nav> subNavList = navService.getAllNavWithNavTypeParentNav(0,(int) parentNav);
            resultList.addAll(subNavList);
        }
        model.addAttribute("navList", resultList);
        return "/admin/product/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@Valid Product product,@RequestParam(value = "fileNameList") List<String> fileNameList, RedirectAttributes redirectAttributes) {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String createTime = simpleDateFormat.format(new Date());
        product.setProductCreateDate(createTime);
        productService.saveProduct(product);
        redirectAttributes.addAttribute("errorMessage", "添加文章成功");

        //处理图片路径
        for (String fileName : fileNameList){
            if (fileName != ""){
                ProductImage productImage = new ProductImage();
                String[] str = fileName.split("/");
                String imageName = str[str.length-1];
                String imagePath = fileName.substring(0,fileName.length()-imageName.length());
                productImage.setMobileImageName(imageName);
                productImage.setOriginImageName(imageName);
                productImage.setPcImageName(imageName);
                productImage.setImagePath(imagePath);
                productImage.setProductId(product.getId());
                productImageService.saveProductImage(productImage);
            }
        }

        return "redirect:/admin/product/add";
    }
    //获得单个栏目的数据根据栏目id 和搜索条件查询
    @RequestMapping (value = "/productList" ,method = RequestMethod.POST)
    public String listForNavId(@RequestParam(value = "navId") int navId,@RequestParam(value ="parameter") String parameter,@RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model){
        Page<Product> productPage = productService.pageProduct(pageNumber, PAGE_SIZE, navId,parameter);
        model.addAttribute("productPage", productPage);

        //查询所有一级文章栏目
        List<Nav> navList = navService.getAllNavWithNavTypeParentNav(0,0);
        List resultList = new ArrayList();
        for (Nav nav : navList) {
            resultList.add(nav);
            long parentNav = nav.getId();
            List<Nav> subNavList = navService.getAllNavWithNavTypeParentNav(0,(int) parentNav);
            resultList.addAll(subNavList);
        }
        model.addAttribute("navList", resultList);
        model.addAttribute("selectNavId",navId);
        model.addAttribute("parameter",parameter);
        return "/admin/product/productList";
    }
    //获得所有栏目的数据
    @RequestMapping (value = "/productList" ,method = RequestMethod.GET)
    public String listAll(@RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model){
        //查找所有文章
        Page<Product> productPage = productService.pageProduct(pageNumber, PAGE_SIZE);
        model.addAttribute("productPage", productPage);

        //查询所有一级文章栏目
        List<Nav> navList = navService.getAllNavWithNavTypeParentNav(0,0);
        List resultList = new ArrayList();
        for (Nav nav : navList) {
            resultList.add(nav);
            long parentNav = nav.getId();
            List<Nav> subNavList = navService.getAllNavWithNavTypeParentNav(0,(int) parentNav);
            resultList.addAll(subNavList);
        }
        model.addAttribute("navList", resultList);
        return "/admin/product/productList";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("product", productService.getProduct(id));

        //查询所有一级文章栏目
        List<Nav> navList = navService.getAllNavWithNavTypeParentNav(0,0);
        List resultList = new ArrayList();
        for (Nav nav : navList) {
            resultList.add(nav);
            long parentNav = nav.getId();
            List<Nav> subNavList = navService.getAllNavWithNavTypeParentNav(0,(int) parentNav);
            resultList.addAll(subNavList);
        }
        model.addAttribute("navList", resultList);

        return "/admin/product/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("perloadProduct") Product product,@RequestParam(value = "fileNameList") List<String> fileNameList,RedirectAttributes redirectAttributes) {
        //移除已有的产品已有的图片
        List<ProductImage> productImages = productImageService.getAllProductImageWithProductId(product.getId());
        for (ProductImage pi : productImages){
            productImageService.deleteProductImage(pi.getId());
        }

        //处理图片路径
        for (String fileName : fileNameList){
            if (fileName != ""){

                //增加新的图片
                ProductImage productImage = new ProductImage() ;
                String[] str = fileName.split("/");
                String imageName = str[str.length-1];
                String imagePath = fileName.substring(0,fileName.length()-imageName.length());
                productImage.setMobileImageName(imageName);
                productImage.setOriginImageName(imageName);
                productImage.setPcImageName(imageName);
                productImage.setImagePath(imagePath);
                productImage.setProductId(product.getId());
                productImageService.saveProductImage(productImage);
            }
        }

        productService.saveProduct(product);
        redirectAttributes.addFlashAttribute("message", "更新文章成功");

        return "redirect:/admin/product/productList";
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        productService.deleteProduct(id);
        redirectAttributes.addFlashAttribute("message", "删除文章成功");
        return "redirect:/admin/product/productList";
    }

    @ModelAttribute(value = "perloadProduct")
    public Product getProduct(@RequestParam(value = "id", required = false) Long id) {
        if (id != null) {
            return productService.getProduct(id);
        }
        return null;
    }
}
