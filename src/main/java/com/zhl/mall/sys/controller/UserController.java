package com.zhl.mall.sys.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhl.mall.sys.model.UserModel;
import com.zhl.mall.sys.service.UserService;
import com.zhl.util.AuthCode;
import com.zhl.util.MD5;

@Controller
@RequestMapping("/userController")
public class UserController {

	@Autowired
	private UserService userService;
	
	private boolean isOkAuthCode(HttpServletRequest request) {
        Object authCode = request.getSession().getAttribute("authCode");
        String code = request.getParameter("authCode");
        return authCode.toString().equals(code);
    }
	
	@RequestMapping("/reg")
	@ResponseBody
	public String reg(UserModel model,String uuid,HttpServletRequest request) {
		if (!isOkAuthCode(request)) {
            return "操作失败，验证码错误。";
        }
		model.setPass(MD5.encode(model.getPass()));
		if ("0000".equals(uuid)) {
			model.setState("1");
			return userService.insertByUQCode(model);
		}else {
			model.setState("0");
		}
		return userService.insertByUQCode(model);
	}
	
	@RequestMapping(value="/servlet",method=RequestMethod.GET)
	@ResponseBody
	public void authCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		AuthCode.doGet(request,response);
	}
	
	/**
	 * 
	 * @param login
	 * 登录时，先验证账号，再验证账号的权限是否匹配，再验证密码是否正确
	 * return -2为账号不存在,-1当前帐号权限不是所选权限，0为用户登录，1为管理员登录，2为验证码错误 3为密码错误
	 */
	@RequestMapping(value="login",method=RequestMethod.POST)
	@ResponseBody
	public String login(UserModel userModel,HttpServletRequest request) {
		if (!isOkAuthCode(request)) {
            return "2";
        }
		String option=(String) request.getParameter("option");
		UserModel model=userService.selectModel(userModel);
		if (model==null) {
			return "-2";//账号不存在
		}
		if (!option.equals(model.getState())) {
			return "-1";//当前帐号权限不是所选权限
		}
		String password=userModel.getPass();
		password= MD5.encode(password);
		if (model.getPass().equals(password)) {
			if ("0".equals(model.getState())) {
				request.getSession().setAttribute("user", model);
				return "0";//用户登录成功
			}else {
				request.getSession().setAttribute("user", model);
				return "1";//管理员登录成功
			}
		}
		return "3";//密码错误
	}
	
	@RequestMapping(value="/select")
	@ResponseBody
	public String selectAll(UserModel userModel,String name,HttpServletResponse response) {
		userModel.setState("0");
		userModel.setName("%"+name+"%");
		List<UserModel> list=userService.selectAll(userModel);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", userService.selectCount(userModel));
		response.setContentType("application/json;charset=utf-8");
		return new JSONObject(map).toString();
	}
	/**
	 * 
	 * @param selectModel
	 * @param 
	 * @return
	 */
	@RequestMapping("/selectModel")
	public String selectModel(UserModel userModel,Model model) {
		model.addAttribute("user",userService.selectModel(userModel));
		return "admin/update";
	}
	/**
	 * 
	 * @param delete
	 * @param 根据主键删除
	 * @return 1为删除成功  	2为删除失败--账号已被使用 	3为删除失败--当前账号不允许删除
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(UserModel userModel) {
		return userService.delete(userModel);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public String updateActive(UserModel userModel,HttpServletRequest request) {
		return userService.updateActive(userModel);
	}
	
	@RequestMapping("/updPass")
	@ResponseBody
	public String updPass(UserModel userModel,HttpServletRequest request) {
		userModel.setPass(MD5.encode("000000"));
		return userService.updateActive(userModel);
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		return "system/login";
	}
}
