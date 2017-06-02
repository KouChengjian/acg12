package com.acg12.controller;

import com.acg12.beans.Result;
import com.acg12.beans.User;
import com.acg12.beans.Verify;
import com.acg12.config.Constant;
import com.acg12.service.UserServiceImpl;
import com.acg12.service.VerifyServiceImpl;
import com.acg12.service.base.ResourceService;
import com.acg12.service.base.UserService;
import com.acg12.utils.ListUtil;
import com.acg12.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Iterator;
import java.util.List;

/**
 * Created by kouchengjian on 2017/3/6.
 */
@Controller
@RequestMapping(value = "/api")
public class UserController {

    @Resource
    private UserServiceImpl userService;
    @Resource
    private VerifyServiceImpl verifyService;

    @RequestMapping(value = "/login" , method = {RequestMethod.POST})
    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user ;
        Result result = new Result();

        if(username.isEmpty() || password.isEmpty()){
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }

        user = userService.queryUserName(username);
        if(user == null){
            result.setResult(Constant.HTTP_RESULT_ERROR_NULL_DATA);
            result.setDesc("不存在该用户");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }

        if(!user.getPassword().equals(password)) {
            result.setResult(Constant.HTTP_RESULT_ERROR_PASSWORD);
            result.setDesc("密码错误");
            StringUtil.outputStream(response , StringUtil.result(result));
        } else {
            user.setPassword(null);
            user.setCreatedAt(null);
            user.setUpdatedAt(null);
            result.setResult(Constant.HTTP_RESULT_SUCCEED);
            result.setDesc("成功");
            result.putDataObject("user" , user);
            StringUtil.outputStream(response , StringUtil.result(result));
        }
    }

    @RequestMapping(value = "/register" , method = {RequestMethod.POST })
    public void register(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String verify = request.getParameter("verify");
        Verify ver;
        User user = new User();
        Result result = new Result();

        if(username.isEmpty()|| password.isEmpty() || verify.isEmpty()) {
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }

        if(!StringUtil.isNumeric(verify)){
            result.setResult(Constant.HTTP_RESULT_ERROR);
            result.setDesc("验证码错误");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }

        ver = verifyService.queryVerifyCode(Integer.valueOf(verify).intValue());
        if(ver == null){
            result.setResult(Constant.HTTP_RESULT_ERROR);
            result.setDesc("验证码错误");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }

        user.setUsername(username);
        user.setPassword(password);
        long time = System.currentTimeMillis();
        time = time / 1000;
        user.setCreatedAt(new Long(time).intValue());
        user.setUpdatedAt(new Long(time).intValue());
        user.setSign("这个家伙很懒，什么也不说...");
        long id = userService.saveUser(user);
        if(id > 0){
            user.setPassword(null);
            user.setCreatedAt(null);
            user.setUpdatedAt(null);
            result.setResult(Constant.HTTP_RESULT_SUCCEED);
            result.setDesc("成功");
            result.putDataObject("user" , user);
            StringUtil.outputStream(response , StringUtil.result(result));
        } else {
            result.setResult(Constant.HTTP_RESULT_ERROR_SQL_SAVE);
            result.setDesc("数据存储异常");
            StringUtil.outputStream(response , StringUtil.result(result));
        }
    }

    @RequestMapping(value = "/userInfo" , method = {RequestMethod.POST})
    public void userInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String uid = request.getHeader("uid");
        User user ;
        Result result = new Result();
        if(uid == null || uid.isEmpty()){
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }
        if(StringUtil.isNumeric(uid)){
            int id = Integer.valueOf(uid).intValue();
            user = userService.queryUser(id);
            if(user == null){
                result.setResult(Constant.HTTP_RESULT_ERROR_NULL_DATA);
                result.setDesc("不存在该数据");
                StringUtil.outputStream(response , StringUtil.result(result));
            } else {
                user.setPassword(null);
                user.setCreatedAt(null);
                user.setUpdatedAt(null);
                result.setResult(Constant.HTTP_RESULT_SUCCEED);
                result.setDesc("成功");
                result.putDataObject("user" , user);
                StringUtil.outputStream(response , StringUtil.result(result));
            }
        } else {
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
        }


    }

    @RequestMapping(value = "/verify" , method = {RequestMethod.POST})
    public void verify(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String username = request.getParameter("username");
        Result result = new Result();
        if(username.isEmpty()) {
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }

        Verify verify = new Verify();
        int randomNum = StringUtil.randomNum();
        long time = System.currentTimeMillis();
        time = time / 1000;
        verify.setPhone(username);
        verify.setVerifycode(randomNum);
        verify.setDuration(60 * 1000);
        verify.setCreatedAt(new Long(time).intValue());
        verify.setStatus(0);

        int code = verifyService.saveVerify(verify);
        if(code < 0){
            result.setResult(Constant.HTTP_RESULT_ERROR);
            result.setDesc("存储失败");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }





    }

    @RequestMapping(value = "/restPwd" , method = {RequestMethod.POST})
    public void restPwd(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String verify = request.getParameter("verify");
        User user ;
        Result result = new Result();
        if(username.isEmpty()|| password.isEmpty() || verify.isEmpty()) {
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }


    }

    @RequestMapping(value = "/alteruser" , method = {RequestMethod.POST})
    public void alterUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String uid = request.getHeader("uid");
        String alterType = request.getParameter("alterType");
        String param1 = request.getParameter("param1");
        String param2 = request.getParameter("param2");
        User user ;
        Result result = new Result();
        if(alterType == null || alterType.isEmpty()){
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }

        if(param1 != null && !param1.isEmpty()){
            if(StringUtil.isNumeric(uid)){
                int id = Integer.valueOf(uid).intValue();
                user = userService.queryUser(id);
                if(user == null){
                    result.setResult(Constant.HTTP_RESULT_ERROR_NULL_DATA);
                    result.setDesc("不存在该用户");
                    StringUtil.outputStream(response , StringUtil.result(result));
                } else {
                    long time = System.currentTimeMillis();
                    time = time / 1000;
                    user.setUpdatedAt(new Long(time).intValue());

                    if(alterType.equals("1")){ // 修改昵称
                        user.setNick(param1);
                    } else if(alterType.equals("2")){ // 修改签名
                        user.setSign(param1);
                    } else if(alterType.equals("3")){ // 修改头像

                    } else if(alterType.equals("4")){ // 修改性别
                        if(StringUtil.isNumeric(param1)){
                            int s = Integer.valueOf(param1).intValue();
                            user.setSex(s);
                        }else {
                            result.setResult(Constant.HTTP_RESULT_ERROR);
                            result.setDesc("失败");
                            StringUtil.outputStream(response , StringUtil.result(result));
                            return;
                        }
                    } else if(alterType.equals("5")){ // 修改密码
                        if(user.getPassword().equals(param1)){
                            if(param2  == null || param2.isEmpty()){
                                result.setResult(Constant.HTTP_RESULT_ERROR);
                                result.setDesc("失败");
                                StringUtil.outputStream(response , StringUtil.result(result));
                                return;
                            }else {
                                user.setPassword(param2);
                            }
                        }else {
                            result.setResult(Constant.HTTP_RESULT_ERROR);
                            result.setDesc("密码错误");
                            StringUtil.outputStream(response , StringUtil.result(result));
                            return;
                        }
                    }

                    long i = userService.updateUser(user);
                    if(i > 0){
                        user.setPassword(null);
                        user.setCreatedAt(null);
                        user.setUpdatedAt(null);
                        result.setResult(Constant.HTTP_RESULT_SUCCEED);
                        result.setDesc("成功");
                        result.putDataObject("user" , user);
                        StringUtil.outputStream(response , StringUtil.result(result));
                    } else {
                        result.setResult(Constant.HTTP_RESULT_ERROR);
                        result.setDesc("失败");
                        StringUtil.outputStream(response , StringUtil.result(result));
                    }
                }
            }else {
                result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
                result.setDesc("请求参数为空");
                StringUtil.outputStream(response , StringUtil.result(result));
            }

        } else {
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
        }
    }

    @RequestMapping(value = "/alteruser/file" , method = {RequestMethod.POST})
    public void alterFileUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String uid = request.getHeader("uid");
        String alterType = request.getParameter("alterType");
//        File param1 = request.getParameter("param1");
        String param2 = request.getParameter("param2");
        User user ;
        Result result = new Result();
        if(alterType == null || alterType.isEmpty()){
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }

        if(StringUtil.isNumeric(uid)) {
            int id = Integer.valueOf(uid).intValue();
            user = userService.queryUser(id);
            if (user == null) {
                result.setResult(Constant.HTTP_RESULT_ERROR_NULL_DATA);
                result.setDesc("不存在该用户");
                StringUtil.outputStream(response , StringUtil.result(result));
                return;
            }
        } else {
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }

        //创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //判断 request 是否有文件上传,即多部分请求
        if(!multipartResolver.isMultipart(request)){
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }

        //转换成多部分request
        MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
        //取得request中的所有文件名
        Iterator<String> iter = multiRequest.getFileNames();
        List<String> myList = ListUtil.copyIterator(iter);
        if(myList == null || myList.isEmpty()){
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
            return;
        }

        iter = ListUtil.copyList(myList);
        while (iter.hasNext()) {
            //取得上传文件
            System.err.printf("=======");
            MultipartFile file = multiRequest.getFile(iter.next());
            if (file != null) {
                //取得当前上传文件的文件名称
                String myFileName = file.getOriginalFilename();
                System.out.println(myFileName);
                //如果名称不为“”,说明该文件存在，否则说明该文件不存在
                if (!myFileName.trim().isEmpty()) {
                    //重命名上传后的文件名
                    String fileName = "demoUpload" + file.getOriginalFilename();
                    //定义上传路径
                    String path = "D:/" + fileName;
                    File localFile = new File(path);
                    file.transferTo(localFile);
                }
            }
        }
    }

    @RequestMapping(value = "/delUser" , method = {RequestMethod.POST})
    public void delUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String uid = request.getHeader("uid");
        String username = request.getParameter("username");
        Result result = new Result();
        if(uid == null || uid.isEmpty()){
            result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
            result.setDesc("请求参数为空");
            StringUtil.outputStream(response , StringUtil.result(result));
        } else {
            if(StringUtil.isNumeric(uid)){
                int id = Integer.valueOf(uid).intValue();
                long i = userService.deleteUser(id);
                if(i > 0){
                    result.setResult(Constant.HTTP_RESULT_SUCCEED);
                    result.setDesc("成功");
                    StringUtil.outputStream(response , StringUtil.result(result));
                } else {
                    result.setResult(Constant.HTTP_RESULT_ERROR_NULL_DATA);
                    result.setDesc("不存在该数据");
                    StringUtil.outputStream(response , StringUtil.result(result));
                }
            } else {
                result.setResult(Constant.HTTP_RESULT_ERROR_PARAM);
                result.setDesc("请求参数为空");
                StringUtil.outputStream(response , StringUtil.result(result));
            }
        }
    }

    @RequestMapping(value = "/userList" , method = {RequestMethod.POST})
    public void userList(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Result result = new Result();
        List<User> userList = userService.queryUserList();
        if(userList == null || userList.size() == 0){
            result.setResult(Constant.HTTP_RESULT_ERROR_NULL_DATA);
            result.setDesc("不存在该数据");
            StringUtil.outputStream(response , StringUtil.result(result));
        }else {
            result.setResult(Constant.HTTP_RESULT_SUCCEED);
            result.setDesc("成功");
            result.putDataArray("user" , userList);
            StringUtil.outputStream(response , StringUtil.result(result));
        }
    }



























//    @ResponseBody
//    @RequestMapping(value = "/sava" , method = {RequestMethod.POST})
//    public String userInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
//        User u = new User();
////        u.setId(1);
//        u.setUsername("1111");
//        u.setPassword("123456");
//        try {
//            userService.saveUser(u);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return u.getId()+"===";
//    }

//    @ResponseBody
//    @RequestMapping(value="/get/{userNo}", method=RequestMethod.GET)
//    public String get(@PathVariable String userNo, Model model){
//        String username = userService.get(userNo);
//        return username;
//    }

}