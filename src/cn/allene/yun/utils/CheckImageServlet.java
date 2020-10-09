package cn.allene.yun.utils;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class CheckImageServlet
 */
public class CheckImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("image/jpeg;utf-8");
		//1.获取验证码图片
		VerifyCode vf = new VerifyCode();
		BufferedImage image = vf.getImage();
		//2.得到四个随机数
		String code = vf.getText();
		//为了进行验证码校验 放入session域中
		request.getSession().setAttribute("serverCode", code);
		//3.把生成的验证码输入到页面
		VerifyCode.output(image, response.getOutputStream());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
