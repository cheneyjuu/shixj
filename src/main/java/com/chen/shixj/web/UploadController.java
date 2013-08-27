package com.chen.shixj.web;

import com.chen.shixj.utility.HandlerUpload;
import com.chen.shixj.utility.ImageTools;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

/**
 * User: Juchen
 * Date: 13-8-13
 * Time: 上午11:17
 */
@Controller
@RequestMapping (value = "/admin/image")
public class UploadController {

    /**
     * 多文件上传
     * @param file
     * @param request
     * @return
     */
    @RequestMapping (value = "/multiUpload")
    @ResponseBody
    public String multiUpload(@RequestParam("file") MultipartFile file,
                              HttpServletRequest request,Model model){
        HandlerUpload handlerUpload = new HandlerUpload();
        Map<String, String> fileNameAndPathMap = null;
        try {
            InputStream iis = file.getInputStream();
            BufferedImage bi= ImageIO.read(iis);
            //  4*4缩略图宽高
            int originWidth = bi.getWidth();
            int originHeight = bi.getHeight();
            //  画廊缩略图
            int bigThumbWidth = bi.getWidth()>900?900:bi.getWidth();
            int bigThumbHeight = bi.getHeight()>600?600:bi.getHeight();
            int smallThumbWidth = bi.getWidth()>200?200:bi.getWidth();
            int smallThumbHeight = bi.getHeight()>150?150:bi.getHeight();

            fileNameAndPathMap = handlerUpload.uploadFile(file,request);
            //  真实路径
            String realPath = request.getSession().getServletContext().getRealPath(fileNameAndPathMap.get("filePath"))+"/";
            //  定义文件名
            File inFile = new File(realPath+fileNameAndPathMap.get("fileName"));
            File originOutFile = new File(realPath+"or_"+fileNameAndPathMap.get("fileName"));
            File bigThumbOutFile = new File(realPath+"pc_"+fileNameAndPathMap.get("fileName"));
            File smallThumOutFile = new File(realPath+"m_"+fileNameAndPathMap.get("fileName"));

            ImageTools.convert(inFile,originOutFile, originWidth, originHeight, 90);
            ImageTools.convert(inFile,bigThumbOutFile,bigThumbWidth,bigThumbHeight,90);
            ImageTools.convert(inFile,smallThumOutFile,smallThumbWidth,smallThumbHeight,90);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return  fileNameAndPathMap.get("filePath")+fileNameAndPathMap.get("fileName");
    }

    /**
     * 单文件上传
     *
     * @param files
     * @param request
     * @return
     */
    @RequestMapping (value = "/singleUpload", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> singleUpload(@RequestParam("file") MultipartFile[] files,
                                               HttpServletRequest request){
        HandlerUpload handlerUpload = new HandlerUpload();
        Map<String, String> fileNameAndPathMap = null;
        try {
            for(MultipartFile file : files){
                InputStream iis = file.getInputStream();
                BufferedImage bi = ImageIO.read(iis);
                //  4*4缩略图宽高
                int sliderImageWidth = bi.getWidth()>200?200:bi.getWidth();
                int silderImageHeight = bi.getHeight()>220?220:bi.getHeight();
                //  画廊缩略图
                int thumbWidth = bi.getWidth()>900?900:bi.getWidth();
                int thimbHeight = bi.getHeight()>600?600:bi.getHeight();

                fileNameAndPathMap = handlerUpload.uploadFile(file,request);
                //  真实路径
                String realPath = request.getSession().getServletContext().getRealPath(fileNameAndPathMap.get("filePath"))+"/";
                //  定义文件名
                File inFile = new File(realPath+fileNameAndPathMap.get("fileName"));
                File sliderOutFile = new File(realPath+"s_"+fileNameAndPathMap.get("fileName"));
                File thumbOutFile = new File(realPath+"t_"+fileNameAndPathMap.get("fileName"));
                ImageTools.convert(inFile, sliderOutFile, sliderImageWidth, silderImageHeight, 90);
                ImageTools.convert(inFile,thumbOutFile,thumbWidth,thimbHeight,90);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new ResponseEntity<String>(fileNameAndPathMap.get("filePath")+fileNameAndPathMap.get("fileName"), HttpStatus.OK);
//        return  fileNameAndPathMap.get("filePath")+fileNameAndPathMap.get("fileName");
    }

    @RequestMapping (value = "/fileUpload",method = RequestMethod.POST)
    @ResponseBody
    public String uploadFile(@RequestParam("file") MultipartFile[] files,
                                               HttpServletRequest request){
        HandlerUpload handlerUpload = new HandlerUpload();
        Map<String, String> fileNameAndPathMap = null;
        try {
            for(MultipartFile file : files){
                InputStream iis = file.getInputStream();
                fileNameAndPathMap = handlerUpload.uploadFile(file,request);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return  fileNameAndPathMap.get("filePath")+fileNameAndPathMap.get("fileName");
    }
}
