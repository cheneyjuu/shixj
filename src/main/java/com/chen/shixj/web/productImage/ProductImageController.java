package com.chen.shixj.web.productImage;

import com.chen.shixj.entity.Product;
import com.chen.shixj.entity.ProductImage;
import com.chen.shixj.service.product.ProductService;
import com.chen.shixj.service.productImage.ProductImageService;
import com.chen.shixj.utility.HandlerUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * User: jpm
 * Date: 13-8-25
 * Time: 下午8:30
 */
@Controller
@RequestMapping(value = "/admin/productImage")
public class ProductImageController {
    @Autowired
    private ProductImageService productImageService;
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
    public String add(@PathVariable("id") Long productId,Model model) {
        model.addAttribute("productId",productId);
        return "/admin/productImage/add";
    }
//    //增加单个文件
//    @RequestMapping(value = "/addSingle", method = RequestMethod.POST)
//    public String add(@RequestParam(value = "fileNameList") String fileNameList,@RequestParam(value = "productId") Long productId, @Valid ProductImage productImage, RedirectAttributes redirectAttributes) {
//        Product product = productService.getProduct(productId);
//        //处理图片路径
//        if (fileNameList != ""){
//            String[] str = fileNameList.split("/");
//            String imageName = str[str.length-1];
//            String imagePath = fileNameList.substring(0,fileNameList.length()-imageName.length());
//
//            productImage.setMobileImageName(imageName);
//            productImage.setOriginImageName(imageName);
//            productImage.setPcImageName(imageName);
//            productImage.setImagePath(imagePath);
//            productImage.setProduct(product);
//            productImageService.saveProductImage(productImage);
//        }
//        redirectAttributes.addAttribute("message", "添加产品图片成功");
//        return "redirect:/admin/productImage/add";
//    }
    //增加多个文件
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@RequestParam(value = "fileNameList") List<String> fileNameList,@RequestParam(value = "productId") Long productId, RedirectAttributes redirectAttributes) {
        Product product = productService.getProduct(productId);
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
                productImage.setProduct(product);
                productImageService.saveProductImage(productImage);
            }
        }
        redirectAttributes.addAttribute("message", "添加产品图片成功");
        return "redirect:/admin/productImage/add";
    }

    @RequestMapping(value = "/productImageList", method = RequestMethod.GET)
    public String list(@RequestParam(value = "productId") Long productId,Model model) {
        List<ProductImage> productImageList = productImageService.getAllProductImageWithProductId(productId);

        model.addAttribute("productImageList", productImageList);
        return "/admin/productImage/productImageList";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long productId, Model model) {
        model.addAttribute("productId",productId);
        Product product = productService.getProduct(productId);
        Set<ProductImage> productImageSet = product.getProductImages();
        List<ProductImage> productImageList = new ArrayList<ProductImage>();
        productImageList.addAll(productImageSet);
        model.addAttribute("productImageList", productImageList);
        return "/admin/productImage/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam(value = "productId") Long productId,@RequestParam(value = "fileNameList") List<String> fileNameList, RedirectAttributes redirectAttributes) {
        Product product = productService.getProduct(productId);
        //增加新的产品图片
        for (String fileName : fileNameList){
            if (fileName != ""){
                //处理图片路径
                ProductImage productImage = new ProductImage();
                String[] str = fileName.split("/");
                String imageName = str[str.length-1];
                String imagePath = fileName.substring(0,fileName.length()-imageName.length());
                productImage.setMobileImageName(imageName);
                productImage.setOriginImageName(imageName);
                productImage.setPcImageName(imageName);
                productImage.setImagePath(imagePath);
                productImage.setProduct(product);
                productImageService.saveProductImage(productImage);
            }
        }
        redirectAttributes.addFlashAttribute("message", "更新产品图片成功");
        return "redirect:/admin/productImage/update/"+productId;
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        ProductImage productImage = productImageService.getProductImage(id);
        Long productId = productImage.getProduct().getId();
        //删除物理文件
        String filePath=productImage.getImagePath();
        String fileAddress = productImage.getPcImageName();
        String fileAddress1 = "m_"+productImage.getPcImageName();
        String fileAddress2 = "or_"+productImage.getMobileImageName();
        String fileAddress3 = "pc_"+productImage.getOriginImageName();

        File file = new File(fileAddress);
        File file1 = new File(fileAddress1);
        File file2 = new File(fileAddress2);
        File file3 = new File(fileAddress3);

        String aa = file.getAbsolutePath();

        HandlerUpload hu = new HandlerUpload();
        hu.DeleteFolder(file.getAbsolutePath());
        hu.DeleteFolder(file1.getAbsolutePath());
        hu.DeleteFolder(file2.getAbsolutePath());
        hu.DeleteFolder(file3.getAbsolutePath());


        productImageService.deleteProductImage(id);
        redirectAttributes.addFlashAttribute("message", "删除产品图片成功");
        return "redirect:/admin/productImage/update/"+productId;
    }

    @ModelAttribute(value = "perloadProductImage")
    public ProductImage getProductImage(@RequestParam(value = "id", required = false) Long id) {
        if (id != null) {
            return productImageService.getProductImage(id);
        }
        return null;
    }
}
